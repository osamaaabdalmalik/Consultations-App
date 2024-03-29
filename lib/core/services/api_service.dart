import 'dart:convert';

import 'package:consultations_app/core/constants/app_endpoints.dart';
import 'package:consultations_app/core/constants/app_keys.dart';
import 'package:consultations_app/core/helpers/exception.dart';
import 'package:consultations_app/core/helpers/get_exception_from_status_code.dart';
import 'package:consultations_app/core/services/caching_service.dart';
import 'package:consultations_app/core/services/network_info_service.dart';
import 'package:consultations_app/features/auth/data/models/user_auth_model.dart';
import 'package:consultations_app/features/auth/domain/entities/user_auth_entity.dart';
import 'package:consultations_app/injection_container.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

abstract class ApiService {
  Future<Map<String, dynamic>> post({
    required String subUrl,
    required Map<String, dynamic> data,
    bool needToken = false,
  });

  Future<Map<String, dynamic>> get({
    required String subUrl,
    required Map<String, String>? parameters,
    bool needToken = false,
  });

// Future<Unit> getAccessToken();
}

class ApiServiceImpl extends ApiService {
  final http.Client client;
  final NetworkInfoService networkInfo;
  UserAuth? userAuth;

  ApiServiceImpl({required this.client, required this.networkInfo}) {
    InjectionContainer.getIt<Logger>().i('Start `onInit` in ApiServiceImpl');
    getUserAuth();
    InjectionContainer.getIt<Logger>().w('End `onInit` in ApiServiceImpl');
  }

  void getUserAuth() {
    InjectionContainer.getIt<Logger>().i('Start `getUserAuth` in ApiServiceImpl');
    String? user = InjectionContainer.getIt<CacheServiceImpl>().getData<String>(
      key: AppKeys.user,
    );
    if (user != null) {
      userAuth = UserAuthModel.fromJson(json.decode(user));
    }
    InjectionContainer.getIt<Logger>().w('End `getUserAuth` in ApiServiceImpl');
  }

  @override
  Future<Map<String, dynamic>> post({
    required String subUrl,
    required Map<String, dynamic> data,
    bool needToken = false,
  }) async {
    try {
      InjectionContainer.getIt<Logger>().i('Start post `$subUrl` |ApiServiceImpl|  data: $data');
      if (!(await networkInfo.isConnected)) {
        throw OfflineException();
      }
      final response = await client.post(
        Uri.http(
          AppEndpoints.baseUrl,
          subUrl,
        ),
        body: json.encode(data),
        headers: _getHeaders(token: needToken ? userAuth!.token : null),
      );
      getExceptionStatusCode(response);
      InjectionContainer.getIt<Logger>().w(
        'End post `$subUrl` |ApiServiceImpl| response: ${json.decode(response.body)}',
      );
      return Future.value(json.decode(response.body));
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e('End post `$subUrl` |ApiServiceImpl| Exception: ${e.runtimeType}, $s');
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> get({
    required String subUrl,
    Map<String, String>? parameters,
    bool needToken = false,
  }) async {
    try {
      InjectionContainer.getIt<Logger>().i('Start get `$subUrl` |ApiServiceImpl| parameters: $parameters');
      if (!(await networkInfo.isConnected)) {
        throw OfflineException();
      }
      parameters?.removeWhere((key, value) => value == 'null');
      final response = await client.get(
        Uri.http(
          AppEndpoints.baseUrl,
          subUrl,
          parameters,
        ),
        headers: _getHeaders(token: needToken ? userAuth!.token : null),
      );
      getExceptionStatusCode(response);
      InjectionContainer.getIt<Logger>().w('End get `$subUrl` |ApiServiceImpl| response: ${response.body}');
      return Future.value((json.decode(response.body)));
    } catch (e, s) {
      InjectionContainer.getIt<Logger>().e('End get `$subUrl` |ApiServiceImpl| Exception: ${e.runtimeType} $s');
      rethrow;
    }
  }

  Map<String, String> _getHeaders({String? lang, String? token}) {
    var map = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    if (lang != null) {
      map.addAll({
        'lang': lang,
      });
    }
    if (token != null) {
      map.addAll({
        'Authorization': 'Bearer $token',
      });
    }
    return map;
  }
}
