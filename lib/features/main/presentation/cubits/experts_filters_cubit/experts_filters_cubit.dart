import 'package:bloc/bloc.dart';
import 'package:consultations_app/core/enums/experts_types.dart';
import 'package:consultations_app/features/main/domain/entities/experts_filters_entity/experts_filters_entity.dart';
import 'package:consultations_app/features/main/domain/entities/main_category_entity.dart';
import 'package:consultations_app/features/main/domain/entities/sub_category_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'experts_filters_cubit.freezed.dart';
part 'experts_filters_state.dart';

class ExpertsFiltersCubit extends Cubit<ExpertsFiltersState> {
  ExpertsFiltersCubit() : super(const ExpertsFiltersState.initial());

  /// Data
  ExpertsFilters _initialExpertsFilters = ExpertsFilters(
    selectedExpertsType: ExpertsTypes.allExperts,
  );

  set initialExpertsFilters(ExpertsFilters expertsFilters) {
    _initialExpertsFilters = expertsFilters.copyWith();
    currentExpertsFilters = expertsFilters.copyWith();
    newExpertsFilters = expertsFilters.copyWith();
  }

  ExpertsFilters get initialExpertsFilters => _initialExpertsFilters;

  ExpertsFilters currentExpertsFilters = ExpertsFilters(
    selectedExpertsType: ExpertsTypes.allExperts,
  );
  ExpertsFilters newExpertsFilters = ExpertsFilters(
    selectedExpertsType: ExpertsTypes.allExperts,
  );
  List<MainCategory> mainCategories = [];

  /// variables
  bool isFiltersApplied = false;
  bool isFiltersChanged = false;
  bool isFiltersShowInAppbar = false;
  int selectedIndexExpertType = 0;
  int selectedIndexMainCategory = 0;
  int selectedIndexSubCategory = 0;

  void clearFilters({bool useInitFilters = false}) {
    _update(const ExpertsFiltersState.loading());
    if (useInitFilters) {
      currentExpertsFilters = _initialExpertsFilters.copyWith();
    } else {
      currentExpertsFilters = currentExpertsFilters.copyWith(
        selectedMainCategory: null,
        selectedSubCategory: null,
        selectedExpertsType: ExpertsTypes.allExperts,
      );
    }
    newExpertsFilters = currentExpertsFilters.copyWith();
    selectedIndexExpertType = 0;
    selectedIndexMainCategory = 0;
    selectedIndexSubCategory = 0;
    isFiltersApplied = false;
    isFiltersChanged = false;
    isFiltersShowInAppbar = false;
    _update(const ExpertsFiltersState.loaded());
  }

  void onChangeIndexExpertType({required int index, required ExpertsTypes expertsTypes}) {
    _update(const ExpertsFiltersState.loading());
    newExpertsFilters = newExpertsFilters.copyWith(
      selectedExpertsType: expertsTypes,
    );
    selectedIndexExpertType = index;
    if (newExpertsFilters != currentExpertsFilters) {
      isFiltersChanged = true;
    } else {
      isFiltersChanged = false;
    }
    if ((expertsTypes == ExpertsTypes.allExperts &&
            newExpertsFilters.selectedSubCategory == null &&
            newExpertsFilters.selectedMainCategory == null) ||
        (expertsTypes == ExpertsTypes.allExperts &&
            newExpertsFilters.selectedSubCategory == null &&
            initialExpertsFilters.selectedMainCategory != null)) {
      isFiltersShowInAppbar = false;
    } else {
      isFiltersShowInAppbar = true;
    }
    _update(const ExpertsFiltersState.loaded());
  }

  void onChangeIndexMainCategory({required int index, required MainCategory? mainCategory}) {
    _update(const ExpertsFiltersState.loading());
    newExpertsFilters = newExpertsFilters.copyWith(
      selectedMainCategory: mainCategory,
      selectedSubCategory: mainCategory == null ? null : newExpertsFilters.selectedSubCategory,
    );
    selectedIndexMainCategory = index;
    if (newExpertsFilters != currentExpertsFilters) {
      isFiltersChanged = true;
    } else {
      isFiltersChanged = false;
    }
    if (mainCategory == null &&
        newExpertsFilters.selectedSubCategory == null &&
        newExpertsFilters.selectedExpertsType == initialExpertsFilters.selectedExpertsType) {
      isFiltersShowInAppbar = false;
    } else {
      isFiltersShowInAppbar = true;
    }
    _update(const ExpertsFiltersState.loaded());
  }

  void onChangeIndexSubCategory({required int index, required SubCategory? subCategory}) {
    _update(const ExpertsFiltersState.loading());
    newExpertsFilters = newExpertsFilters.copyWith(
      selectedSubCategory: subCategory,
    );
    selectedIndexSubCategory = index;
    if (newExpertsFilters != currentExpertsFilters) {
      isFiltersChanged = true;
    } else {
      isFiltersChanged = false;
    }
    if ((subCategory == null &&
            newExpertsFilters.selectedMainCategory == null &&
            newExpertsFilters.selectedExpertsType == initialExpertsFilters.selectedExpertsType) ||
        (subCategory == null &&
            initialExpertsFilters.selectedMainCategory != null &&
            newExpertsFilters.selectedExpertsType == initialExpertsFilters.selectedExpertsType)) {
      isFiltersShowInAppbar = false;
    } else {
      isFiltersShowInAppbar = true;
    }
    _update(const ExpertsFiltersState.loaded());
  }

  void onFiltersApplied() {
    _update(const ExpertsFiltersState.loading());
    currentExpertsFilters = newExpertsFilters.copyWith();
    isFiltersApplied = true;
    isFiltersChanged = false;
    _update(const ExpertsFiltersState.loaded());
  }

  void _update(ExpertsFiltersState state) {
    if (!isClosed) {
      emit(state);
    }
  }
}
