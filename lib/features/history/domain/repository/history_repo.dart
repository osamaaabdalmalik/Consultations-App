import 'package:consultations_app/core/helpers/failures.dart';
import 'package:consultations_app/features/main/domain/entities/home_data_entity.dart';
import 'package:dartz/dartz.dart';

abstract class HistoryRepo {
  Future<Either<Failure, HomeData>> getHistories();
}
