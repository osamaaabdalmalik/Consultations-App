import 'package:consultations_app/core/helpers/failures.dart';
import 'package:consultations_app/features/expert/domain/entities/expert_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ExpertRepo {
  Future<Either<Failure, List<Expert>>> getExperts({
    required int page,
    int limit = 10,
    String? expertsType,
    int? subCategoryId,
    int? mainCategoryId,
  });
}
