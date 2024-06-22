import 'package:consultations_app/core/constants/app_endpoints.dart';
import 'package:consultations_app/core/services/api_service.dart';
import 'package:consultations_app/features/main/data/models/home_data_model.dart';
import 'package:consultations_app/injection_container.dart';
import 'package:logger/logger.dart';

abstract class AppointmentRemoteDataSource {
  Future<HomeDataModel> getAppointments();
}

class AppointmentRemoteDataSourceImpl extends AppointmentRemoteDataSource {
  final ApiService apiService;

  AppointmentRemoteDataSourceImpl({required this.apiService});

  @override
  Future<HomeDataModel> getAppointments() async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `getAppointments` in |AppointmentRemoteDataSourceImpl|");

      Map<String, dynamic> mapData = await apiService.get(
        subUrl: AppEndpoints.getHome,
      );
      final homeDataModel = HomeDataModel.fromJson(mapData['data']);

      InjectionContainer.getIt<Logger>().w("End `getAppointments` in |AppointmentRemoteDataSourceImpl|");
      return Future.value(homeDataModel);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `getAppointments` in |AppointmentRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }
}
