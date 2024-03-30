import 'package:consultations_app/features/auth/presentation/screens/auth_screen.dart';
import 'package:consultations_app/features/main/presentation/screens/category_experts_screen.dart';
import 'package:consultations_app/features/main/presentation/screens/main_screen.dart';
import 'package:go_router/go_router.dart';

abstract class AppRoutes {
  static const String mainScreen = "/";
  static const String authScreen = "/authScreen";
  static const String categoryExpertsScreen = "/categoryExpertsScreen";

  static final router = GoRouter(
    routes: [
      GoRoute(
        path: mainScreen,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: categoryExpertsScreen,
        builder: (context, state) => const CategoryExpertsScreen(),
      ),
      GoRoute(
        path: authScreen,
        builder: (context, state) => const AuthScreen(),
      ),
    ],
  );
}
