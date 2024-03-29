import 'package:consultations_app/core/constants/app_routes.dart';
import 'package:consultations_app/core/constants/app_themes.dart';
import 'package:consultations_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  await initSettings();
  runApp(const MyApp());
}

Future<void> initSettings() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: SystemUiOverlayStyle.dark.systemNavigationBarColor,
    ),
  );
  InjectionContainer.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(350, 800),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, __) => MaterialApp.router(
        title: 'Consultations App',
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoutes.router,
        builder: EasyLoading.init(),
        theme: AppThemes.themeEnglish,
      ),
    );
  }
}
