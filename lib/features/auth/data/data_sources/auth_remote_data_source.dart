import 'package:consultations_app/core/constants/app_endpoints.dart';
import 'package:consultations_app/core/services/api_service.dart';
import 'package:consultations_app/features/auth/data/models/user_auth_model.dart';
import 'package:consultations_app/features/auth/data/models/user_model.dart';
import 'package:consultations_app/injection_container.dart';
import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

abstract class AuthRemoteDataSource {
  Future<UserAuthModel> register({required UserModel userModel});

  Future<UserAuthModel> login({required UserModel userModel});

  Future<Unit> logout();
}

class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final ApiServiceImpl apiService;

  AuthRemoteDataSourceImpl({required this.apiService});

  @override
  Future<UserAuthModel> register({required UserModel userModel}) async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `register` in |MainRemoteDataSourceImpl|");

      Map<String, dynamic> mapData = await apiService.post(
        subUrl: AppEndpoints.register,
        data: userModel.toJson(),
      );
      final userAuthModel = UserAuthModel.fromJson(mapData['data']);

      InjectionContainer.getIt<Logger>().w("End `register` in |MainRemoteDataSourceImpl|");
      return Future.value(userAuthModel);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `register` in |MainRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }

  @override
  Future<UserAuthModel> login({required UserModel userModel}) async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `login` in |MainRemoteDataSourceImpl|");

      Map<String, dynamic> mapData = await apiService.post(
        subUrl: AppEndpoints.login,
        data: userModel.toJson(),
      );
      final userAuthModel = UserAuthModel.fromJson(mapData['data']);
      InjectionContainer.getIt<Logger>().w("End `login` in |MainRemoteDataSourceImpl|");
      return Future.value(userAuthModel);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `login` in |MainRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }

  @override
  Future<Unit> logout() async {
    try {
      InjectionContainer.getIt<Logger>().i("Start `logout` in |MainRemoteDataSourceImpl|");
      await apiService.get(
        subUrl: AppEndpoints.logout,
        needToken: true,
      );
      InjectionContainer.getIt<Logger>().w("End `logout` in |MainRemoteDataSourceImpl|");
      return Future.value(unit);
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e(
        "End `logout` in |MainRemoteDataSourceImpl| Exception: ${e.runtimeType} $s",
      );
      rethrow;
    }
  }
}
