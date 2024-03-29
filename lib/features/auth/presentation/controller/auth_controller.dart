class AuthController {
  // // Data
  // UserAuth? userAuth;
  //
  // // States
  // StateType registerState = StateType.init;
  // StateType loginState = StateType.init;
  // StateType logoutState = StateType.init;
  //
  // // Primitive
  // String validationMessage = '';
  //
  // @override
  // void onInit() async {
  //   InjectionContainer.getIt<Logger>().i("Start onInit AuthController");
  //   super.onInit();
  //   InjectionContainer.getIt<Logger>().w("End onInit AuthController");
  // }
  //
  // Future<bool> register({required SignupData signupData}) async {
  //   InjectionContainer.getIt<Logger>().i("Start `register` in |QuranController|");
  //   registerState = StateType.loading;
  //   update();
  //   RegisterUseCase registerUseCase = RegisterUseCase(Get.find());
  //   var result = await registerUseCase(
  //     user: User(
  //       id: 0,
  //       email: signupData.name!,
  //       password: signupData.password!,
  //     ),
  //   );
  //   return result.fold(
  //     (l) async {
  //       registerState = getStateFromFailure(l);
  //       validationMessage = l.message;
  //       update();
  //       await Future.delayed(const Duration(milliseconds: 50));
  //       registerState = StateType.init;
  //       InjectionContainer.getIt<Logger>().w("End `register` in |QuranController| $registerState");
  //       return false;
  //     },
  //     (r) {
  //       registerState = StateType.success;
  //       userAuth = r;
  //       update();
  //       Get.offNamed(AppNavigationRoutes.chatsScreen, arguments: {AppKeys.user: r});
  //       InjectionContainer.getIt<Logger>().w("End `register` in |QuranController| $registerState");
  //       return true;
  //     },
  //   );
  // }
  //
  // Future<bool> login({required LoginData loginData}) async {
  //   InjectionContainer.getIt<Logger>().i("Start `login` in |QuranController|");
  //   loginState = StateType.loading;
  //   update();
  //   LoginUseCase loginUseCase = LoginUseCase(Get.find());
  //   var result = await loginUseCase(
  //     user: User(
  //       id: 0,
  //       email: loginData.name,
  //       password: loginData.password,
  //     ),
  //   );
  //   return result.fold(
  //     (l) async {
  //       loginState = getStateFromFailure(l);
  //       validationMessage = l.message;
  //       update();
  //       await Future.delayed(const Duration(milliseconds: 50));
  //       loginState = StateType.init;
  //       InjectionContainer.getIt<Logger>().w("End `login` in |QuranController| $loginState");
  //       return false;
  //     },
  //     (r) {
  //       loginState = StateType.success;
  //       userAuth = r;
  //       update();
  //       Get.offNamed(AppNavigationRoutes.chatsScreen, arguments: {AppKeys.user: r});
  //       InjectionContainer.getIt<Logger>().w("End `login` in |QuranController| $loginState");
  //       return true;
  //     },
  //   );
  // }
  //
  // Future<bool> logout() async {
  //   InjectionContainer.getIt<Logger>().i("Start `logout` in |QuranController|");
  //   logoutState = StateType.loading;
  //   update();
  //   EasyLoaderService.showLoading();
  //   Get.put<AuthRemoteDataSource>(
  //     AuthRemoteDataSourceImpl(apiService: Get.find()),
  //   );
  //   Get.put<AuthLocalDataSource>(
  //     AuthLocalDataSourceImpl(sharedPreferencesService: Get.find()),
  //   );
  //   Get.put<AuthRepo>(
  //     AuthRepoImpl(
  //       authRemoteDataSource: Get.find(),
  //       authLocalDataSource: Get.find(),
  //     ),
  //   );
  //   LogoutUseCase logoutUseCase = LogoutUseCase(Get.find());
  //   var result = await logoutUseCase();
  //   return result.fold(
  //     (l) async {
  //       logoutState = getStateFromFailure(l);
  //       validationMessage = l.message;
  //       update();
  //       await Future.delayed(const Duration(milliseconds: 50));
  //       logoutState = StateType.init;
  //       EasyLoaderService.showError(message: validationMessage);
  //       InjectionContainer.getIt<Logger>().w("End `logout` in |QuranController| $logoutState");
  //       return false;
  //     },
  //     (r) {
  //       logoutState = StateType.success;
  //       userAuth = null;
  //       update();
  //       EasyLoaderService.dismiss();
  //       Get.offAllNamed(AppNavigationRoutes.authScreen);
  //       InjectionContainer.getIt<Logger>().w("End `logout` in |QuranController| $logoutState");
  //       return true;
  //     },
  //   );
  // }
}
