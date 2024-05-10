import 'package:consultations_app/core/helpers/failures.dart';
import 'package:consultations_app/core/helpers/get_failure_from_exception.dart';
import 'package:consultations_app/features/main/data/data_sources/main_remote_data_source.dart';
import 'package:consultations_app/features/main/domain/entities/expert_details_data_entity.dart';
import 'package:consultations_app/features/main/domain/entities/expert_entity.dart';
import 'package:consultations_app/features/main/domain/entities/home_data_entity.dart';
import 'package:consultations_app/features/main/domain/entities/main_category_details_data_entity.dart';
import 'package:consultations_app/features/main/domain/repository/main_repo.dart';
import 'package:consultations_app/injection_container.dart';
import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

class MainRepoImpl implements MainRepo {
  final MainRemoteDataSource mainRemoteDataSource;

  const MainRepoImpl({required this.mainRemoteDataSource});

  @override
  Future<Either<Failure, List<Expert>>> search({
    required String query,
  }) async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `search` in |MainRepoImpl|");
      var experts = await mainRemoteDataSource.search(
        query: query,
      );
      InjectionContainer.getIt<Logger>().w("End `search` in |MainRepoImpl|");
      return Right(experts);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `search` in |MainRepoImpl| Exception: ${e.runtimeType} $s",
      );
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, HomeData>> getHome() async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `getHome` in |MainRepoImpl|");
      var homeData = await mainRemoteDataSource.getHome();
      InjectionContainer.getIt<Logger>().w("End `getHome` in |MainRepoImpl|");
      return Right(homeData);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getHome` in |MainRepoImpl| Exception: ${e.runtimeType} $s",
      );
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, MainCategoryDetails>> getMainCategoryDetails({
    required int categoryId,
  }) async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `getMainCategoryDetails` in |MainRepoImpl|");
      var mainCategoryDetails = await mainRemoteDataSource.getMainCategoryDetails(
        categoryId: categoryId,
      );
      InjectionContainer.getIt<Logger>().w("End `getMainCategoryDetails` in |MainRepoImpl|");
      return Right(mainCategoryDetails);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getMainCategoryDetails` in |MainRepoImpl| Exception: ${e.runtimeType} $s",
      );
      return Left(getFailureFromException(e));
    }
  }

  @override
  Future<Either<Failure, List<Expert>>> getExperts({
    required int page,
    int limit = 10,
    String? expertsType,
    int? subCategoryId,
    int? mainCategoryId,
  }) async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `getExperts` in |MainRepoImpl|");
      var experts = await mainRemoteDataSource.getExperts(
        page: page,
        limit: limit,
        expertsType: expertsType,
        subCategoryId: subCategoryId,
        mainCategoryId: mainCategoryId,
      );
      InjectionContainer.getIt<Logger>().w("End `getExperts` in |MainRepoImpl|");
      return Right(experts);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getExperts` in |MainRepoImpl| Exception: ${e.runtimeType} $s",
      );
      return Left(getFailureFromException(e));
    }
  }


  @override
  Future<Either<Failure, ExpertDetails>> getExpertDetails({
    required int expertId,
  }) async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `getExpertDetails` in |MainRepoImpl|");
      var mainCategoryDetails = await mainRemoteDataSource.getExpertDetails(
        expertId: expertId,
      );
      InjectionContainer.getIt<Logger>().w("End `getExpertDetails` in |MainRepoImpl|");
      return Right(mainCategoryDetails);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getExpertDetails` in |MainRepoImpl| Exception: ${e.runtimeType} $s",
      );
      return Left(getFailureFromException(e));
    }
  }
}
