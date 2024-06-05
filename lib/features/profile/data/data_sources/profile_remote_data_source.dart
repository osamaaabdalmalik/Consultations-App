import 'package:consultations_app/core/constants/app_endpoints.dart';
import 'package:consultations_app/core/services/api_service.dart';
import 'package:consultations_app/features/main/data/models/home_data_model.dart';
import 'package:consultations_app/injection_container.dart';
import 'package:logger/logger.dart';

abstract class ProfileRemoteDataSource {
  Future<HomeDataModel> getProfile();
}

class ProfileRemoteDataSourceImpl extends ProfileRemoteDataSource {
  final ApiService apiService;

  ProfileRemoteDataSourceImpl({required this.apiService});

  @override
  Future<HomeDataModel> getProfile() async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `getProfile` in |ProfileRemoteDataSourceImpl|");

      Map<String, dynamic> mapData = await apiService.get(
        subUrl: AppEndpoints.getHome,
      );
      final homeDataModel = HomeDataModel.fromJson(mapData['data']);

      InjectionContainer.getIt<Logger>().w("End `getProfile` in |ProfileRemoteDataSourceImpl|");
      return Future.value(homeDataModel);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getProfile` in |ProfileRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }
}
