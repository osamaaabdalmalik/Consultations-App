part of 'appointment_cubit.dart';

@freezed
class AppointmentState with _$AppointmentState {
  const factory AppointmentState.initial() = _Initial;

  const factory AppointmentState.loading() = _Loading;

  const factory AppointmentState.loaded() = _Loaded;

  const factory AppointmentState.error(String message) = _Error;
}
