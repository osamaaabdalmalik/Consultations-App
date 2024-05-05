import 'package:consultations_app/core/constants/app_themes.dart';
import 'package:consultations_app/core/services/router_service.dart';
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
  await InjectionContainer.initAppDependencies();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  final designSize = const Size(350, 800);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: designSize,
      minTextAdapt: true,
      splitScreenMode: true,
      fontSizeResolver: (fontSize, instance) {
        final display = View.of(context).display;
        final screenSize = display.size / display.devicePixelRatio;
        final scaleWidth = screenSize.width / designSize.width;
        return fontSize * scaleWidth;
      },
      builder: (_, __) => MaterialApp.router(
        title: 'Consultations App',
        debugShowCheckedModeBanner: false,
        routerConfig: InjectionContainer.getIt<RouterService>().router,
        builder: EasyLoading.init(),
        theme: AppThemes.themeEnglish,
      ),
    );
  }
}
