import 'package:consultations_app/core/helpers/failures.dart';
import 'package:consultations_app/features/main/domain/entities/expert_entity.dart';
import 'package:consultations_app/features/main/domain/repository/main_repo.dart';
import 'package:dartz/dartz.dart';

class SearchUseCase {
  final MainRepo mainRepo;

  SearchUseCase({required this.mainRepo});

  Future<Either<Failure, List<Expert>>> call({required String query}) async {
    return await mainRepo.search(query: query);
  }
}
