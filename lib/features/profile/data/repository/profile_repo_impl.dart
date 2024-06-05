import 'package:consultations_app/core/helpers/failures.dart';
import 'package:consultations_app/core/helpers/get_failure_from_exception.dart';
import 'package:consultations_app/features/main/domain/entities/home_data_entity.dart';
import 'package:consultations_app/features/profile/data/data_sources/profile_remote_data_source.dart';
import 'package:consultations_app/features/profile/domain/repository/profile_repo.dart';
import 'package:consultations_app/injection_container.dart';
import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ProfileRemoteDataSource mainRemoteDataSource;

  const ProfileRepoImpl({required this.mainRemoteDataSource});

  @override
  Future<Either<Failure, HomeData>> getProfile() async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `getProfile` in |ProfileRepoImpl|");
      var homeData = await mainRemoteDataSource.getProfile();
      InjectionContainer.getIt<Logger>().w("End `getProfile` in |ProfileRepoImpl|");
      return Right(homeData);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getProfile` in |ProfileRepoImpl| Exception: ${e.runtimeType} $s",
      );
      return Left(getFailureFromException(e));
    }
  }
}
