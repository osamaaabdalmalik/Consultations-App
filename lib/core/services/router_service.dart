import 'package:consultations_app/core/constants/app_keys.dart';
import 'package:consultations_app/core/constants/app_routes.dart';
import 'package:consultations_app/core/enums/experts_types.dart';
import 'package:consultations_app/core/services/caching_service.dart';
import 'package:consultations_app/features/auth/presentation/screens/auth_screen.dart';
import 'package:consultations_app/features/main/domain/entities/experts_filters_entity/experts_filters_entity.dart';
import 'package:consultations_app/features/main/presentation/cubits/expert_cubit/expert_cubit.dart';
import 'package:consultations_app/features/main/presentation/cubits/experts_filters_cubit/experts_filters_cubit.dart';
import 'package:consultations_app/features/main/presentation/screens/experts_screen.dart';
import 'package:consultations_app/features/main/presentation/screens/main_screen.dart';
import 'package:consultations_app/injection_container.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
          builder: (context, state) => MainScreen(),
        ),
        GoRoute(
          path: AppRoutes.expertsScreen,
          builder: (context, state) => BlocProvider(
            create: (context) {
              context.read<ExpertsFiltersCubit>().initialExpertsFilters = ExpertsFilters(
                selectedExpertsType: ((state.extra as Map?)?[AppKeys.expertsType] ?? ExpertsTypes.allExperts),
                selectedMainCategory: (state.extra as Map?)?[AppKeys.mainCategory],
              );

              return InjectionContainer.getIt<ExpertCubit>()
                ..getExperts(
                  newExpertsFilters: context.read<ExpertsFiltersCubit>().initialExpertsFilters,
                );
            },
            child: ExpertsScreen(
              titleScreen: (state.extra as Map?)?[AppKeys.titleScreen],
            ),
          ),
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
