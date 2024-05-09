part of 'expert_cubit.dart';

@freezed
class ExpertState with _$ExpertState {
  const factory ExpertState.initial() = _Initial;

  const factory ExpertState.loading() = _Loading;

  const factory ExpertState.loaded(List<Expert> experts) = _Loaded;

  const factory ExpertState.error(String message) = _Error;
}
