import 'package:consultations_app/core/helpers/failures.dart';
import 'package:consultations_app/core/helpers/get_failure_from_exception.dart';
import 'package:consultations_app/features/appointment/data/data_sources/appointment_remote_data_source.dart';
import 'package:consultations_app/features/appointment/domain/repository/appointment_repo.dart';
import 'package:consultations_app/features/main/domain/entities/home_data_entity.dart';
import 'package:consultations_app/injection_container.dart';
import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

class AppointmentRepoImpl implements AppointmentRepo {
  final AppointmentRemoteDataSource appointmentRemoteDataSource;

  const AppointmentRepoImpl({required this.appointmentRemoteDataSource});

  @override
  Future<Either<Failure, HomeData>> getAppointments() async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `getAppointments` in |AppointmentRepoImpl|");
      var homeData = await appointmentRemoteDataSource.getAppointments();
      InjectionContainer.getIt<Logger>().w("End `getAppointments` in |AppointmentRepoImpl|");
      return Right(homeData);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getAppointments` in |AppointmentRepoImpl| Exception: ${e.runtimeType} $s",
      );
      return Left(getFailureFromException(e));
    }
  }
}
