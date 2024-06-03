import 'package:consultations_app/core/constants/app_keys.dart';
import 'package:consultations_app/core/constants/app_routes.dart';
import 'package:consultations_app/core/enums/experts_types.dart';
import 'package:consultations_app/core/services/caching_service.dart';
import 'package:consultations_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:consultations_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:consultations_app/features/main/domain/entities/experts_filters_entity/experts_filters_entity.dart';
import 'package:consultations_app/features/main/presentation/cubits/expert_cubit/expert_cubit.dart';
import 'package:consultations_app/features/main/presentation/cubits/experts_filters_cubit/experts_filters_cubit.dart';
import 'package:consultations_app/features/main/presentation/screens/experts_screen.dart';
import 'package:consultations_app/features/main/presentation/screens/main_screen.dart';
import 'package:consultations_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RouterService {
  final CacheService _cacheService;
  late GoRouter router;

  RouterService({required CacheService cacheService}) : _cacheService = cacheService {
    String initialLocation = _cacheService.getData<String>(
          key: AppKeys.initialLocationRoute,
        ) ??
        AppRoutes.signInScreen;
    router = GoRouter(
      routes: [
        //-------------------------------------------
        // Main Routes
        //-------------------------------------------
        GoRoute(
          path: AppRoutes.mainScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: MainScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              final tween = Tween(begin: const Offset(0, 1), end: Offset.zero);
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: AppRoutes.expertsScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) {
                context.read<ExpertsFiltersCubit>().initialExpertsFilters = ExpertsFilters(
                  selectedExpertsType: ((state.extra as Map?)?[AppKeys.expertsType] ?? ExpertsTypes.allExperts),
                  selectedMainCategory: (state.extra as Map?)?[AppKeys.mainCategory],
                );

                return InjectionContainer.getIt<ExpertCubit>()
                      ..getExperts(
                        newExpertsFilters: context
                            .read<ExpertsFiltersCubit>()
                            .initialExpertsFilters,
                      );
                  },
                  child: ExpertsScreen(
                    titleScreen: (state.extra as Map?)?[AppKeys.titleScreen],
                    isSearchMode: (state.extra as Map?)?[AppKeys.isSearchMode] ?? false,
                  ),
                ),
                transitionsBuilder: (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                },
              ),
        ),
        //-------------------------------------------
        // Authentication Routes
        //-------------------------------------------
        GoRoute(
          path: AppRoutes.signUpScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const SignUpScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              final tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: AppRoutes.signInScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const SignInScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              final tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
          ),
        ),
        //-------------------------------------------
      ],
      initialLocation: initialLocation,
    );
  }
}
