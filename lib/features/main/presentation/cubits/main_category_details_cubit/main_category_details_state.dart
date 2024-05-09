part of 'main_category_details_cubit.dart';

@freezed
class MainCategoryDetailsState with _$MainCategoryDetailsState {
  const factory MainCategoryDetailsState.initial() = _Initial;

  const factory MainCategoryDetailsState.loading() = _Loading;

  const factory MainCategoryDetailsState.loaded(MainCategoryDetails mainCategoryDetails) = _Loaded;

  const factory MainCategoryDetailsState.subCategoryExpertsLoading() = _SubCategoryExpertsLoading;

  const factory MainCategoryDetailsState.subCategoryExpertsLoaded(List<Expert> subCategoryExperts) =
      _SubCategoryExpertsLoaded;

  const factory MainCategoryDetailsState.error(String message) = _Error;
}
