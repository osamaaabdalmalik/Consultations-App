import 'dart:convert';

import 'package:consultations_app/core/constants/app_keys.dart';
import 'package:consultations_app/core/services/caching_service.dart';
import 'package:consultations_app/features/auth/data/models/user_auth_model.dart';
import 'package:consultations_app/injection_container.dart';
import 'package:dartz/dartz.dart';
import 'package:logger/logger.dart';

abstract class AuthLocalDataSource {
  Future<Unit> setUser({required UserAuthModel userAuthModel});

  Future<UserAuthModel?> getUser();

  Future<Unit> clear();
}

class AuthLocalDataSourceImpl extends AuthLocalDataSource {
  final CacheServiceImpl sharedPreferencesService;

  AuthLocalDataSourceImpl({
    required this.sharedPreferencesService,
  });

  @override
  Future<Unit> setUser({required UserAuthModel userAuthModel}) async {
    InjectionContainer.getIt<Logger>().i("Start setUser in AuthLocalDataSourceImpl");
    await sharedPreferencesService.setData(
      key: AppKeys.user,
      value: json.encode(userAuthModel.toJson()),
    );
    InjectionContainer.getIt<Logger>().w("End setUser in AuthLocalDataSourceImpl");
    return Future.value(unit);
  }

  @override
  Future<UserAuthModel?> getUser() {
    InjectionContainer.getIt<Logger>().i("Start getUser in AuthLocalDataSourceImpl");
    final String? userString = sharedPreferencesService.getData<String>(key: AppKeys.user);
    if (userString != null) {
      InjectionContainer.getIt<Logger>().w(
        "End getUser in AuthLocalDataSourceImpl user: $userString",
      );
      return Future.value(UserAuthModel.fromJson(json.decode(userString)));
    }
    InjectionContainer.getIt<Logger>().w(
      "End getUser in AuthLocalDataSourceImpl user: null",
    );
    return Future.value(null);
  }

  @override
  Future<Unit> clear() async {
    InjectionContainer.getIt<Logger>().i("Start clear in AuthLocalDataSourceImpl");
    final removeUser = await sharedPreferencesService.clear();
    InjectionContainer.getIt<Logger>().w(
      "End clear in AuthLocalDataSourceImpl \nremoveUser: $removeUser",
    );
    return Future.value(unit);
  }
}
