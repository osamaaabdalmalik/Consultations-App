import 'package:consultations_app/core/helpers/failures.dart';
import 'package:consultations_app/features/main/domain/entities/expert_details_data_entity.dart';
import 'package:consultations_app/features/main/domain/repository/main_repo.dart';
import 'package:dartz/dartz.dart';

class GetExpertDetailsUseCase {
  final MainRepo mainRepo;

  GetExpertDetailsUseCase({required this.mainRepo});

  Future<Either<Failure, ExpertDetails>> call({required int expertId}) async {
    return await mainRepo.getExpertDetails(expertId: expertId);
  }
}
