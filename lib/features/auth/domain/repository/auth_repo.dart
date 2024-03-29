import 'package:consultations_app/core/helpers/failures.dart';
import 'package:consultations_app/features/auth/domain/entities/user_auth_entity.dart';
import 'package:consultations_app/features/auth/domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserAuth>> register({required User user});

  Future<Either<Failure, UserAuth>> login({required User user});

  Future<Either<Failure, Unit>> logout();

  Future<Either<Failure, UserAuth?>> getUser();
}
