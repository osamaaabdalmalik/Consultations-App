import 'package:consultations_app/core/services/api_service.dart';
import 'package:consultations_app/core/services/bloc_observer_service.dart';
import 'package:consultations_app/core/services/caching_service.dart';
import 'package:consultations_app/core/services/network_info_service.dart';
import 'package:consultations_app/core/services/router_service.dart';
import 'package:consultations_app/core/services/status_handler_service.dart';
import 'package:consultations_app/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:consultations_app/features/auth/data/data_sources/auth_remote_data_source.dart';
import 'package:consultations_app/features/auth/data/repository/auth_repo_impl.dart';
import 'package:consultations_app/features/auth/domain/repository/auth_repo.dart';
import 'package:consultations_app/features/auth/domain/usecases/login_use_case.dart';
import 'package:consultations_app/features/auth/domain/usecases/logout_use_case.dart';
import 'package:consultations_app/features/auth/domain/usecases/register_use_case.dart';
import 'package:consultations_app/features/expert/data/data_sources/expert_remote_data_source.dart';
import 'package:consultations_app/features/expert/data/repository/expert_repo_impl.dart';
import 'package:consultations_app/features/expert/domain/repository/expert_repo.dart';
import 'package:consultations_app/features/expert/domain/usecases/get_experts_use_case.dart';
import 'package:consultations_app/features/expert/presentation/cubits/expert_cubit/expert_cubit.dart';
import 'package:consultations_app/features/expert/presentation/cubits/experts_filters_cubit/experts_filters_cubit.dart';
import 'package:consultations_app/features/main/domain/usecases/get_home_data_use_case.dart';
import 'package:consultations_app/features/main/presentation/cubits/main_cubit/main_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/main/data/data_sources/main_remote_data_source.dart';
import 'features/main/data/repository/main_repo_impl.dart';
import 'features/main/domain/repository/main_repo.dart';

abstract class InjectionContainer {
  static GetIt getIt = GetIt.instance;

  static Future<void> initAppDependencies() async {
    await initCoreServices();
    await initAuthenticationDependencies();
    await initMainDependencies();
    await initExpertDependencies();
  }

  static Future<void> initCoreServices() async {
    /// Helper Services
    GetIt.instance.registerSingleton(Logger());
    GetIt.instance.registerSingleton(StatusHandlerService());
    GetIt.instance.registerSingleton(BlocObserverService());
    Bloc.observer = getIt<BlocObserverService>();

    /// Cache Services
    var perf = await SharedPreferences.getInstance();
    GetIt.instance.registerSingleton<SharedPreferences>(perf);
    GetIt.instance.registerSingleton<CacheService>(
      CacheServiceImpl(
        pref: getIt<SharedPreferences>(),
      ),
    );

    /// API Services
    GetIt.instance.registerSingleton(InternetConnectionChecker());
    GetIt.instance.registerSingleton<NetworkInfoService>(
      NetworkInfoServiceImpl(
        getIt<InternetConnectionChecker>(),
      ),
    );
    GetIt.instance.registerSingleton(Client());
    GetIt.instance.registerSingleton<ApiService>(
      ApiServiceImpl(
        client: getIt<Client>(),
        networkInfo: getIt<NetworkInfoService>(),
      ),
    );

    /// Router Services
    GetIt.instance.registerSingleton<RouterService>(
      RouterService(
        cacheService: getIt<CacheService>(),
      ),
    );
  }

  static Future<void> initMainDependencies() async {
    /// Data Sources
    GetIt.instance.registerLazySingleton<MainRemoteDataSource>(
      () => MainRemoteDataSourceImpl(
        apiService: getIt(),
      ),
    );
    // GetIt.instance.registerLazySingleton<MainLocalDataSource>(
    //   () => MainLocalDataSourceImpl(
    //     cacheService: getIt(),
    //   ),
    // );

    /// Repositories
    GetIt.instance.registerLazySingleton<MainRepo>(
      () => MainRepoImpl(
        mainRemoteDataSource: getIt(),
        // mainLocalDataSource: getIt(),
      ),
    );

    /// UseCases
    GetIt.instance.registerLazySingleton(
      () => GetHomeDataUseCase(mainRepo: getIt()),
    );

    /// Cubits and Blocs
    GetIt.instance.registerFactory(() => MainCubit());
  }

  static Future<void> initExpertDependencies() async {
    /// Data Sources
    GetIt.instance.registerLazySingleton<ExpertRemoteDataSource>(
      () => ExpertRemoteDataSourceImpl(
        apiService: getIt(),
      ),
    );
    // GetIt.instance.registerLazySingleton<MainLocalDataSource>(
    //   () => MainLocalDataSourceImpl(
    //     cacheService: getIt(),
    //   ),
    // );

    /// Repositories
    GetIt.instance.registerLazySingleton<ExpertRepo>(
      () => ExpertRepoImpl(
        expertRemoteDataSource: getIt(),
        // mainLocalDataSource: getIt(),
      ),
    );

    /// UseCases
    GetIt.instance.registerLazySingleton(
      () => GetExpertsUseCase(expertRepo: getIt()),
    );

    /// Cubits and Blocs
    GetIt.instance.registerFactory(() => ExpertsFiltersCubit());
    GetIt.instance.registerFactory(() => ExpertCubit());
  }

  static Future<void> initAuthenticationDependencies() async {
    /// Data Sources
    GetIt.instance.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(
        apiService: getIt(),
      ),
    );
    GetIt.instance.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(
        cacheService: getIt(),
      ),
    );

    /// Repositories
    GetIt.instance.registerLazySingleton<AuthRepo>(
      () => AuthRepoImpl(
        authRemoteDataSource: getIt(),
        authLocalDataSource: getIt(),
      ),
    );

    /// UseCases
    GetIt.instance.registerLazySingleton(
      () => LoginUseCase(authRepo: getIt()),
    );
    GetIt.instance.registerLazySingleton(
      () => RegisterUseCase(authRepo: getIt()),
    );
    getIt.registerLazySingleton(
      () => LogoutUseCase(authRepo: getIt()),
    );

    /// Cubits and Blocs
  }
}
