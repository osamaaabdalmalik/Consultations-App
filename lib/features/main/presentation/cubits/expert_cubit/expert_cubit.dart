import 'package:bloc/bloc.dart';
import 'package:consultations_app/core/enums/experts_types.dart';
import 'package:consultations_app/core/enums/general_states.dart';
import 'package:consultations_app/core/helpers/get_state_from_failure.dart';
import 'package:consultations_app/features/main/domain/entities/expert_entity.dart';
import 'package:consultations_app/features/main/domain/usecases/get_experts_use_case.dart';
import 'package:consultations_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'expert_cubit.freezed.dart';
part 'expert_cubit_state.dart';

class ExpertCubit extends Cubit<ExpertState> {
  ExpertCubit() : super(const ExpertState.initial());

  /// Use Cases
  final GetExpertsUseCase getExpertsUseCase = InjectionContainer.getIt();
  GeneralStates generalState = GeneralStates.init;

  /// Data
  List<Expert>? experts;

  /// variables
  ScrollController scrollController = ScrollController();
  bool isLoadingMore = false;
  bool hasMore = true;
  bool isRefreshedAfterHasMore = false;
  bool loaded = true;
  int page = 1;
  int limit = 25;
  bool isScrollListenerInit = false;
  ExpertsTypes expertsType = ExpertsTypes.allExperts;

  Future<void> getExperts({
    required ExpertsTypes expertsType,
    int? mainCategoryId,
    int? subCategoryId,
  }) async {
    InjectionContainer.getIt<Logger>().i("Start `getExperts` in |MainCubit|");
    _update(const ExpertState.loading());
    if (!isScrollListenerInit) {
      scrollController.addListener(
        () {
          if (!isLoadingMore) {
            loadMoreExperts(expertsType: expertsType.value);
          }
        },
      );
      isScrollListenerInit = true;
    }
    generalState = GeneralStates.loading;
    var result = await getExpertsUseCase(
      page: 1,
      limit: limit,
      expertsType: expertsType.value,
      subCategoryId: subCategoryId,
      mainCategoryId: mainCategoryId,
    );
    result.fold(
      (l) {
        generalState = getStateFromFailure(l);
        _update(ExpertState.error(l.message));
      },
      (experts) {
        _update(ExpertState.loaded(experts));
        generalState = GeneralStates.success;
        this.experts = experts;
      },
    );
    InjectionContainer.getIt<Logger>().w(
      "End `getExperts` in |MainCubit| General State:$generalState",
    );
  }

  Future<void> loadMoreExperts({
    required String expertsType,
    int? mainCategoryId,
    int? subCategoryId,
  }) async {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent && hasMore && !isLoadingMore) {
      InjectionContainer.getIt<Logger>().i("Start `loadMoreExperts` in |MainCubit|");
      isLoadingMore = true;
      loaded = false;
      page++;
      _update(const ExpertState.initial());
      _update(ExpertState.loaded(experts!));
      generalState = GeneralStates.loading;
      var result = await getExpertsUseCase(
        page: page,
        limit: limit,
        expertsType: expertsType,
        subCategoryId: subCategoryId,
        mainCategoryId: mainCategoryId,
      );
      result.fold(
        (l) {
          _update(ExpertState.error(l.message));
          page--;
          hasMore = true;
          loaded = true;
          generalState = getStateFromFailure(l);
        },
        (experts) {
          if (experts.isEmpty) {
            page--;
            hasMore = false;
            isRefreshedAfterHasMore = true;
            loaded = false;
          } else {
            this.experts = [...this.experts!, ...experts];
            hasMore = true;
            loaded = true;
          }
          _update(ExpertState.loaded(this.experts!));
          generalState = GeneralStates.success;
        },
      );
      isLoadingMore = false;
      InjectionContainer.getIt<Logger>().w(
        "End `loadMoreExperts` in |MainCubit| General State:$generalState",
      );
    }
    if (isRefreshedAfterHasMore) {
      _update(const ExpertState.initial());
      isRefreshedAfterHasMore = false;
      _update(ExpertState.loaded(experts!));
    }
  }

  void _update(ExpertState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
