import 'package:consultations_app/core/constants/app_keys.dart';
import 'package:consultations_app/core/constants/app_routes.dart';
import 'package:consultations_app/core/services/caching_service.dart';
import 'package:consultations_app/features/auth/presentation/screens/auth_screen.dart';
import 'package:consultations_app/features/main/presentation/screens/category_experts_screen.dart';
import 'package:consultations_app/features/main/presentation/screens/main_screen.dart';
import 'package:go_router/go_router.dart';

class RouterService {
  final CacheService _cacheService;
  late GoRouter router;

  RouterService({required CacheService cacheService}) : _cacheService = cacheService {
    String initialLocation = _cacheService.getData<String>(
          key: AppKeys.initialLocationRoute,
        ) ??
        AppRoutes.mainScreen;
    router = GoRouter(
      routes: [
        GoRoute(
          path: AppRoutes.mainScreen,
          builder: (context, state) => const MainScreen(),
        ),
        GoRoute(
          path: AppRoutes.categoryExpertsScreen,
          builder: (context, state) => const CategoryExpertsScreen(),
        ),
        GoRoute(
          path: AppRoutes.authScreen,
          builder: (context, state) => const AuthScreen(),
        ),
        //-------------------------------------------
      ],
      initialLocation: initialLocation,
    );
  }
}
