import 'package:consultations_app/core/helpers/failures.dart';
import 'package:consultations_app/core/helpers/get_failure_from_exception.dart';
import 'package:consultations_app/features/history/data/data_sources/history_remote_data_source.dart';
import 'package:consultations_app/features/history/domain/repository/history_repo.dart';
import 'package:consultations_app/features/main/domain/entities/home_data_entity.dart';
import 'package:consultations_app/injection_container.dart';
import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

class HistoryRepoImpl implements HistoryRepo {
  final HistoryRemoteDataSource historyRemoteDataSource;

  const HistoryRepoImpl({required this.historyRemoteDataSource});

  @override
  Future<Either<Failure, HomeData>> getHistories() async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `getHistories` in |HistoryRepoImpl|");
      var homeData = await historyRemoteDataSource.getHistories();
      InjectionContainer.getIt<Logger>().w("End `getHistories` in |HistoryRepoImpl|");
      return Right(homeData);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getHistories` in |HistoryRepoImpl| Exception: ${e.runtimeType} $s",
      );
      return Left(getFailureFromException(e));
    }
  }
}
