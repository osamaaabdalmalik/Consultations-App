import 'package:consultations_app/core/helpers/failures.dart';
import 'package:consultations_app/features/main/domain/entities/main_category_details_data_entity.dart';
import 'package:consultations_app/features/main/domain/repository/main_repo.dart';
import 'package:dartz/dartz.dart';

class GetMainCategoryDetailsUseCase {
  final MainRepo mainRepo;

  GetMainCategoryDetailsUseCase({required this.mainRepo});

  Future<Either<Failure, MainCategoryDetails>> call({required int categoryId}) async {
    return await mainRepo.getMainCategoryDetails(categoryId: categoryId);
  }
}
