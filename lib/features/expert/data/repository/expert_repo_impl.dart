import 'package:consultations_app/core/helpers/failures.dart';
import 'package:consultations_app/core/helpers/get_failure_from_exception.dart';
import 'package:consultations_app/features/expert/data/data_sources/expert_remote_data_source.dart';
import 'package:consultations_app/features/expert/domain/entities/expert_entity.dart';
import 'package:consultations_app/features/expert/domain/repository/expert_repo.dart';
import 'package:consultations_app/injection_container.dart';
import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

class ExpertRepoImpl implements ExpertRepo {
  final ExpertRemoteDataSource expertRemoteDataSource;

  const ExpertRepoImpl({required this.expertRemoteDataSource});

  @override
  Future<Either<Failure, List<Expert>>> getExperts({
    required int page,
    int limit = 10,
    String? expertsType,
    int? subCategoryId,
    int? mainCategoryId,
  }) async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `getExperts` in |ExpertRepoImpl|");
      var experts = await expertRemoteDataSource.getExperts(
        page: page,
        limit: limit,
        expertsType: expertsType,
        subCategoryId: subCategoryId,
        mainCategoryId: mainCategoryId,
      );
      InjectionContainer.getIt<Logger>().w("End `getExperts` in |ExpertRepoImpl|");
      return Right(experts);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getExperts` in |ExpertRepoImpl| Exception: ${e.runtimeType} $s",
      );
      return Left(getFailureFromException(e));
    }
  }
}
