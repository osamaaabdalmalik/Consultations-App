import 'package:bloc/bloc.dart';
import 'package:consultations_app/core/enums/general_states.dart';
import 'package:consultations_app/core/helpers/get_state_from_failure.dart';
import 'package:consultations_app/features/main/domain/entities/expert_entity.dart';
import 'package:consultations_app/features/main/domain/entities/home_data_entity.dart';
import 'package:consultations_app/features/main/domain/usecases/get_home_data_use_case.dart';
import 'package:consultations_app/features/main/domain/usecases/search_use_case.dart';
import 'package:consultations_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'main_cubit.freezed.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState.initial()) {
    initMain();
  }

  /// Use Cases
  final GetHomeDataUseCase getHomeDataUseCase = InjectionContainer.getIt();
  final SearchUseCase searchUseCase = InjectionContainer.getIt();
  GeneralStates generalState = GeneralStates.init;

  /// Data
  HomeData? homeData;
  List<Expert> resultSearchExperts = [];

  /// Controllers
  final TextEditingController searchTextController = TextEditingController();
  final PageController pageController = PageController();

  /// variables
  bool isInitMain = false;
  int currentTab = 0;

  void initMain() {
    if (isInitMain) return;
    getHomeData();
    isInitMain = true;
  }

  Future<void> getHomeData() async {
    InjectionContainer.getIt<Logger>().i("Start `getHomeData` in |MainCubit|");
    _update(const MainState.loading());
    generalState = GeneralStates.loading;
    var result = await getHomeDataUseCase();
    result.fold(
      (l) {
        generalState = getStateFromFailure(l);
        _update(MainState.error(l.message));
      },
      (homeData) {
        _update(MainState.loaded(homeData));
        generalState = GeneralStates.success;
        this.homeData = homeData;
      },
    );
    InjectionContainer.getIt<Logger>().w(
      "End `getHomeData` in |MainCubit| General State:$generalState",
    );
  }

  Future<void> search({required String query}) async {
    InjectionContainer.getIt<Logger>().i("Start `search` in |MainCubit|");
    _update(const MainState.loading());
    generalState = GeneralStates.loading;
    var result = await searchUseCase(
      query: query,
    );
    result.fold(
      (l) {
        generalState = getStateFromFailure(l);
        _update(MainState.error(l.message));
      },
      (resultSearchExperts) {
        // _update(MainState.loaded(resultSearchExperts));
        generalState = GeneralStates.success;
        this.resultSearchExperts = resultSearchExperts;
      },
    );
    InjectionContainer.getIt<Logger>().w(
      "End `search` in |MainCubit| General State:$generalState",
    );
  }

  void changeCurrentTab(int index) {
    _update(const MainState.loading());
    currentTab = index;
    pageController.animateToPage(
      currentTab,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
    _update(MainState.changeTabSuccess(homeData));
  }

  void _update(MainState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
