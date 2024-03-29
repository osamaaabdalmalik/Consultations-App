import 'package:consultations_app/core/helpers/failures.dart';
import 'package:consultations_app/features/main/domain/entities/pair_entity.dart';
import 'package:dartz/dartz.dart';

abstract class MainRepo {
  Future<Either<Failure, List<Pair>>> getCategoriesAsPair({required int repositoryId});
}
