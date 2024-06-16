import 'package:consultations_app/core/constants/app_colors.dart';
import 'package:consultations_app/core/constants/app_themes.dart';
import 'package:consultations_app/core/services/router_service.dart';
import 'package:consultations_app/features/expert/presentation/cubits/experts_filters_cubit/experts_filters_cubit.dart';
import 'package:consultations_app/features/main/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:consultations_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      statusBarColor: AppColors.white,
      statusBarIconBrightness: Brightness.dark,
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
      builder: (_, __) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => InjectionContainer.getIt<MainCubit>(),
          ),
          BlocProvider(
            create: (context) => InjectionContainer.getIt<ExpertsFiltersCubit>(),
          ),
        ],
        child: MaterialApp.router(
          title: 'Consultations App',
          debugShowCheckedModeBanner: false,
          routerConfig: InjectionContainer.getIt<RouterService>().router,
          builder: EasyLoading.init(),
          theme: AppThemes.themeEnglish,
        ),
      ),
    );
  }
}
