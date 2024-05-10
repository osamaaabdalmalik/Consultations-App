import 'package:bloc/bloc.dart';
import 'package:consultations_app/core/enums/general_states.dart';
import 'package:consultations_app/core/helpers/get_state_from_failure.dart';
import 'package:consultations_app/features/main/domain/entities/expert_entity.dart';
import 'package:consultations_app/features/main/domain/entities/main_category_details_data_entity.dart';
import 'package:consultations_app/features/main/domain/usecases/get_experts_use_case.dart';
import 'package:consultations_app/features/main/domain/usecases/get_main_category_details_use_case.dart';
import 'package:consultations_app/injection_container.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'main_category_details_cubit.freezed.dart';
part 'main_category_details_state.dart';

class MainCategoryDetailsCubit extends Cubit<MainCategoryDetailsState> {
  MainCategoryDetailsCubit() : super(const MainCategoryDetailsState.initial());

  /// Use Cases
  final GetMainCategoryDetailsUseCase getMainCategoryDetailsUseCase = InjectionContainer.getIt();
  final GetExpertsUseCase getExpertsUseCase = InjectionContainer.getIt();
  GeneralStates generalState = GeneralStates.init;

  /// Data
  MainCategoryDetails? mainCategoryDetails;
  List<Expert>? subCategoryExperts;

  /// variables

  Future<void> getMainCategoryDetails({required int categoryId}) async {
    InjectionContainer.getIt<Logger>().i("Start `getMainCategoryDetails` in |MainCubit|");
    _update(const MainCategoryDetailsState.loading());
    generalState = GeneralStates.loading;
    var result = await getMainCategoryDetailsUseCase(
      categoryId: categoryId,
    );
    result.fold(
      (l) {
        generalState = getStateFromFailure(l);
        _update(MainCategoryDetailsState.error(l.message));
      },
      (mainCategoryDetails) {
        _update(MainCategoryDetailsState.loaded(mainCategoryDetails));
        generalState = GeneralStates.success;
        this.mainCategoryDetails = mainCategoryDetails;
      },
    );
    InjectionContainer.getIt<Logger>().w(
      "End `getMainCategoryDetails` in |MainCubit| General State:$generalState",
    );
  }

  Future<void> getSubCategoryExperts({required int subCategoryId}) async {
    InjectionContainer.getIt<Logger>().i("Start `getSubCategoryExperts` in |MainCubit|");
    _update(const MainCategoryDetailsState.subCategoryExpertsLoading());
    generalState = GeneralStates.loading;
    var result = await getExpertsUseCase(
      page: 1,
      limit: 25,
      subCategoryId: subCategoryId,
    );
    result.fold(
      (l) {
        generalState = getStateFromFailure(l);
        _update(MainCategoryDetailsState.error(l.message));
      },
      (subCategoryExperts) {
        _update(MainCategoryDetailsState.subCategoryExpertsLoaded(subCategoryExperts));
        generalState = GeneralStates.success;
        this.subCategoryExperts = subCategoryExperts;
      },
    );
    InjectionContainer.getIt<Logger>().w(
      "End `getSubCategoryExperts` in |MainCubit| General State:$generalState",
    );
  }

  void _update(MainCategoryDetailsState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
