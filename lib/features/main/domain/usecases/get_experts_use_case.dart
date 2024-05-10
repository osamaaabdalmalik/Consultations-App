import 'package:consultations_app/core/helpers/failures.dart';
import 'package:consultations_app/features/main/domain/entities/expert_entity.dart';
import 'package:consultations_app/features/main/domain/repository/main_repo.dart';
import 'package:dartz/dartz.dart';

class GetExpertsUseCase {
  final MainRepo mainRepo;

  GetExpertsUseCase({required this.mainRepo});

  Future<Either<Failure, List<Expert>>> call({
    String? expertsType,
    int? subCategoryId,
    int? mainCategoryId,
  }) async {
    return await mainRepo.getExperts(
      expertsType: expertsType,
      subCategoryId: subCategoryId,
      mainCategoryId: mainCategoryId,
    );
  }
}