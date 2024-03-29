import 'package:consultations_app/core/constants/app_translation_keys.dart';
import 'package:consultations_app/core/enums/state_type.dart';
import 'package:consultations_app/core/helpers/failures.dart';
import 'package:consultations_app/core/services/easy_loader_service.dart';

StateType getStateFromFailure(Failure failure) {
  if (failure is OfflineFailure) {
    return StateType.offline;
  } else if (failure is UnAuthenticatedFailure) {
    EasyLoaderService.showError(
      message: AppTranslationKeys.forbidden,
      durationSeconds: 5,
    );
    return StateType.forbidden;
  } else if (failure is UnAuthorizedFailure) {
    EasyLoaderService.showError(
      message: AppTranslationKeys.unauthorized,
      durationSeconds: 5,
    );
    return StateType.unAuthorized;
  } else if (failure is NotFoundFailure) {
    EasyLoaderService.showError(
      message: AppTranslationKeys.notFound,
      durationSeconds: 5,
    );
    return StateType.notFound;
  } else if (failure is BadRequestFailure) {
    return StateType.badRequest;
  } else if (failure is InternalServerErrorFailure) {
    return StateType.internalServerProblem;
  } else {
    return StateType.unexpectedProblem;
  }
}
