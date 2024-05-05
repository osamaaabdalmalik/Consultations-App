import 'package:consultations_app/core/constants/app_strings.dart';
import 'package:consultations_app/core/enums/general_states.dart';
import 'package:consultations_app/core/helpers/failures.dart';
import 'package:consultations_app/core/services/easy_loader_service.dart';

GeneralStates getStateFromFailure(Failure failure) {
  if (failure is OfflineFailure) {
    return GeneralStates.offline;
  } else if (failure is UnAuthenticatedFailure) {
    EasyLoaderService.showError(
      message: AppStrings.forbidden,
      durationSeconds: 5,
    );
    return GeneralStates.forbidden;
  } else if (failure is UnAuthorizedFailure) {
    EasyLoaderService.showError(
      message: AppStrings.unauthorized,
      durationSeconds: 5,
    );
    return GeneralStates.unAuthorized;
  } else if (failure is NotFoundFailure) {
    EasyLoaderService.showError(
      message: AppStrings.notFound,
      durationSeconds: 5,
    );
    return GeneralStates.notFound;
  } else if (failure is BadRequestFailure) {
    return GeneralStates.badRequest;
  } else if (failure is InternalServerErrorFailure) {
    return GeneralStates.internalServerProblem;
  } else {
    return GeneralStates.unexpectedProblem;
  }
}
