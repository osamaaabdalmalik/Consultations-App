part of 'experts_filters_cubit.dart';

@freezed
class ExpertsFiltersState with _$ExpertsFiltersState {
  const factory ExpertsFiltersState.initial() = _Initial;

  const factory ExpertsFiltersState.loading() = _Loading;

  const factory ExpertsFiltersState.loaded() = _Loaded;

  const factory ExpertsFiltersState.error(String message) = _Error;
}
