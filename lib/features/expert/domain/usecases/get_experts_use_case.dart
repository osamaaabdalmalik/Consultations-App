import 'package:consultations_app/core/helpers/failures.dart';
import 'package:consultations_app/features/expert/domain/entities/expert_entity.dart';
import 'package:consultations_app/features/expert/domain/repository/expert_repo.dart';
import 'package:dartz/dartz.dart';

class GetExpertsUseCase {
  final ExpertRepo expertRepo;

  GetExpertsUseCase({required this.expertRepo});

  Future<Either<Failure, List<Expert>>> call({
    required int page,
    int limit = 10,
    String? expertsType,
    int? subCategoryId,
    int? mainCategoryId,
  }) async {
    return await expertRepo.getExperts(
      page: page,
      limit: limit,
      expertsType: expertsType,
      subCategoryId: subCategoryId,
      mainCategoryId: mainCategoryId,
    );
  }
}
