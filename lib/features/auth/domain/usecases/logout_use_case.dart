import 'package:consultations_app/core/helpers/failures.dart';
import 'package:consultations_app/features/auth/domain/repository/auth_repo.dart';
import 'package:consultations_app/injection_container.dart';
import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

class LogoutUseCase {
  final AuthRepo repo;

  LogoutUseCase(this.repo);

  Future<Either<Failure, Unit>> call() async {
    InjectionContainer.getIt<Logger>().i("Call LogoutUseCase");
    return await repo.logout();
  }
}
