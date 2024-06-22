import 'package:consultations_app/core/constants/app_endpoints.dart';
import 'package:consultations_app/core/services/api_service.dart';
import 'package:consultations_app/features/main/data/models/home_data_model.dart';
import 'package:consultations_app/injection_container.dart';
import 'package:logger/logger.dart';

abstract class HistoryRemoteDataSource {
  Future<HomeDataModel> getHistories();
}

class HistoryRemoteDataSourceImpl extends HistoryRemoteDataSource {
  final ApiService apiService;

  HistoryRemoteDataSourceImpl({required this.apiService});

  @override
  Future<HomeDataModel> getHistories() async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `getHistories` in |HistoryRemoteDataSourceImpl|");

      Map<String, dynamic> mapData = await apiService.get(
        subUrl: AppEndpoints.getHome,
      );
      final homeDataModel = HomeDataModel.fromJson(mapData['data']);

      InjectionContainer.getIt<Logger>().w("End `getHistories` in |HistoryRemoteDataSourceImpl|");
      return Future.value(homeDataModel);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getHistories` in |HistoryRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }
}
