import 'package:consultations_app/core/helpers/failures.dart';
import 'package:consultations_app/features/main/domain/entities/pair_entity.dart';
import 'package:consultations_app/features/main/domain/repository/main_repo.dart';
import 'package:consultations_app/injection_container.dart';
import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

class GetCategoriesAsPairUseCase {
  final MainRepo repo;

  GetCategoriesAsPairUseCase(this.repo);

  Future<Either<Failure, List<Pair>>> call({required int repositoryId}) async {
    InjectionContainer.getIt<Logger>().i("Call GetCategoriesAsPairUseCase");
    return await repo.getCategoriesAsPair(repositoryId: repositoryId);
  }
}
