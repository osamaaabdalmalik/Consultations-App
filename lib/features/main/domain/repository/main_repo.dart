import 'package:consultations_app/core/helpers/failures.dart';
import 'package:consultations_app/features/main/domain/entities/expert_details_data_entity.dart';
import 'package:consultations_app/features/main/domain/entities/expert_entity.dart';
import 'package:consultations_app/features/main/domain/entities/home_data_entity.dart';
import 'package:consultations_app/features/main/domain/entities/main_category_details_data_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MainRepo {
  Future<Either<Failure, List<Expert>>> search({
    required String query,
  });

  Future<Either<Failure, HomeData>> getHome();

  Future<Either<Failure, MainCategoryDetails>> getMainCategoryDetails({
    required int categoryId,
  });

  Future<Either<Failure, List<Expert>>> getExperts({
    required int page,
    int limit = 10,
    String? expertsType,
    int? subCategoryId,
    int? mainCategoryId,
  });

  Future<Either<Failure, ExpertDetails>> getExpertDetails({
    required int expertId,
  });
}
