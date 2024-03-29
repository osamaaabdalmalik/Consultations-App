import 'package:consultations_app/core/helpers/failures.dart';
import 'package:consultations_app/core/helpers/get_failure_from_exception.dart';
import 'package:consultations_app/features/main/data/data_sources/main_remote_data_source.dart';
import 'package:consultations_app/features/main/domain/entities/pair_entity.dart';
import 'package:consultations_app/features/main/domain/repository/main_repo.dart';
import 'package:consultations_app/injection_container.dart';
import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

class MainRepoImpl implements MainRepo {
  final MainRemoteDataSource mainRemoteDataSource;

  const MainRepoImpl({required this.mainRemoteDataSource});

  @override
  Future<Either<Failure, List<Pair>>> getCategoriesAsPair({required int repositoryId}) async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `getCategoriesAsPair` in |MainRepoImpl|");
      var pairModels = await mainRemoteDataSource.getCategoriesAsPair(repositoryId: repositoryId);
      InjectionContainer.getIt<Logger>().w("End `getCategoriesAsPair` in |MainRepoImpl|");
      return Right(pairModels);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>()
          .e("End `getCategoriesAsPair` in |MainRepoImpl| Exception: ${e.runtimeType} $s");
      return Left(getFailureFromException(e));
    }
  }
}
