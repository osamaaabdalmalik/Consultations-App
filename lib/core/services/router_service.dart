import 'package:consultations_app/core/constants/app_keys.dart';
import 'package:consultations_app/core/constants/app_routes.dart';
import 'package:consultations_app/core/enums/experts_types.dart';
import 'package:consultations_app/core/services/caching_service.dart';
import 'package:consultations_app/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:consultations_app/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:consultations_app/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:consultations_app/features/auth/presentation/screens/sign_up_screen.dart';
import 'package:consultations_app/features/auth/presentation/screens/verification_screen.dart';
import 'package:consultations_app/features/expert/domain/entities/expert_entity.dart';
import 'package:consultations_app/features/expert/domain/entities/experts_filters_entity/experts_filters_entity.dart';
import 'package:consultations_app/features/expert/presentation/cubits/expert_cubit/expert_cubit.dart';
import 'package:consultations_app/features/expert/presentation/cubits/experts_filters_cubit/experts_filters_cubit.dart';
import 'package:consultations_app/features/expert/presentation/screens/expert_details_screen.dart';
import 'package:consultations_app/features/expert/presentation/screens/experts_screen.dart';
import 'package:consultations_app/features/expert/presentation/screens/make_appointment_screen.dart';
import 'package:consultations_app/features/main/presentation/screens/main_screen.dart';
import 'package:consultations_app/features/profile/presentation/screens/complete_expert_info_screen.dart';
import 'package:consultations_app/features/profile/presentation/screens/expert_profile_details_screen.dart';
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
        //-------------------------------------------
        // Experts Routes
        //-------------------------------------------
        GoRoute(
          path: AppRoutes.expertsScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: BlocProvider(
              create: (context) {
                context.read<ExpertsFiltersCubit>().initialExpertsFilters = ExpertsFilters(
                  selectedExpertsType: ((state.extra as Map?)?[AppKeys.expertsType] ?? ExpertsTypes.allExperts),
                  selectedMainCategory: (state.extra as Map?)?[AppKeys.mainCategory],
                  isFavorite: (state.extra as Map?)?[AppKeys.isFavorite],
                );

                return InjectionContainer.getIt<ExpertCubit>()
                  ..getExperts(
                    newExpertsFilters: context.read<ExpertsFiltersCubit>().initialExpertsFilters,
                  );
              },
              child: ExpertsScreen(
                titleScreen: (state.extra as Map?)?[AppKeys.titleScreen],
                isSearchMode: (state.extra as Map?)?[AppKeys.isSearchMode] ?? false,
              ),
            ),
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
          path: AppRoutes.expertDetailsScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: ExpertDetailsScreen(
              expert: state.extra as Expert,
            ),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              // final tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            },
          ),
        ),
        GoRoute(
          path: AppRoutes.makeAppointmentScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: MakeAppointmentScreen(
              expert: state.extra as Expert,
            ),
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
        // Profile Routes
        //-------------------------------------------
        GoRoute(
          path: AppRoutes.completeExpertInfoScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const CompleteExpertInfoScreen(),
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
          path: AppRoutes.expertProfileDetailsScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const ExpertProfileDetailsScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              // final tween = Tween(begin: const Offset(1, 0), end: Offset.zero);
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
          path: AppRoutes.forgetPasswordScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const ForgetPasswordScreen(),
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
          path: AppRoutes.verificationScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const VerificationScreen(),
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
          path: AppRoutes.resetPasswordScreen,
          pageBuilder: (context, state) => CustomTransitionPage(
            key: state.pageKey,
            child: const ResetPasswordScreen(),
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
