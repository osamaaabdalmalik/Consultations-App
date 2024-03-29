import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class InjectionContainer {
  static GetIt getIt = GetIt.instance;

  static Future<void> init() async {
    await SharedPreferences.getInstance();
    getIt.registerSingleton<Logger>(Logger());
  }
}
