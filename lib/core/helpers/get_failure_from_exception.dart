import 'package:consultations_app/core/constants/app_strings.dart';
import 'package:consultations_app/core/helpers/exception.dart';
import 'package:consultations_app/core/helpers/failures.dart';
import 'package:consultations_app/injection_container.dart';
import 'package:logger/logger.dart';

Failure getFailureFromException(Object exception) {
  if (exception is BadRequestException) {
    return BadRequestFailure(message: exception.message);
  } else if (exception is UnAuthenticatedException) {
    return const UnAuthenticatedFailure(message: AppStrings.forbidden);
  } else if (exception is UnAuthorizedException) {
    return const UnAuthorizedFailure(message: AppStrings.unauthorized);
  } else if (exception is NotFoundException) {
    return const NotFoundFailure(message: AppStrings.notFound);
  } else if (exception is InternalServerErrorException) {
    return const InternalServerErrorFailure(
      message: AppStrings.internalServerError,
    );
  } else if (exception is OfflineException) {
    return const OfflineFailure(message: AppStrings.offline);
  } else {
    InjectionContainer.getIt<Logger>().e(
      "End `getFailureFromException` Exception: ${exception.toString()}",
    );
    return const UnexpectedFailure(
      message: AppStrings.unexpectedException,
    );
  }
}
