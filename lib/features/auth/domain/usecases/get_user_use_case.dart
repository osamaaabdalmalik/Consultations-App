import 'package:consultations_app/core/helpers/failures.dart';
import 'package:consultations_app/features/auth/domain/entities/user_auth_entity.dart';
import 'package:consultations_app/features/auth/domain/repository/auth_repo.dart';
import 'package:consultations_app/injection_container.dart';
import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

class GetUserUseCase {
  final AuthRepo repo;

  GetUserUseCase(this.repo);

  Future<Either<Failure, UserAuth?>> call() async {
    InjectionContainer.getIt<Logger>().i("Call GetUserUseCase");
    return await repo.getUser();
  }
}
