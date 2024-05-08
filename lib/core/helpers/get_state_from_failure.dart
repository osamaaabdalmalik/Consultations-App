import 'package:consultations_app/core/constants/app_strings.dart';
import 'package:consultations_app/core/enums/general_states.dart';
import 'package:consultations_app/core/helpers/failures.dart';
import 'package:consultations_app/core/services/status_handler_service.dart';

GeneralStates getStateFromFailure(Failure failure) {
  if (failure is OfflineFailure) {
    StatusHandlerService.showOfflineError();
    return GeneralStates.offline;
  }
  if (failure is BadRequestFailure) {
    StatusHandlerService.showError(message: failure.message);
    return GeneralStates.badRequest;
  }
  if (failure is UnAuthenticatedFailure) {
    StatusHandlerService.showError(
      message: AppStrings.forbidden,
      durationSeconds: 8,
    );
    return GeneralStates.forbidden;
  }
  if (failure is UnAuthorizedFailure) {
    StatusHandlerService.showError(
      message: AppStrings.unauthorized,
      durationSeconds: 8,
    );
    return GeneralStates.unAuthorized;
  }
  if (failure is NotFoundFailure) {
    StatusHandlerService.showError(
      message: AppStrings.notFound,
    );
    return GeneralStates.notFound;
  }
  if (failure is InternalServerErrorFailure) {
    StatusHandlerService.showInternalServerError();
    return GeneralStates.internalServerProblem;
  }
  StatusHandlerService.showError(
    message: AppStrings.unexpectedException,
  );
  return GeneralStates.unexpectedProblem;
}
