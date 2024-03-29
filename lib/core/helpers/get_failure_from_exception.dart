import 'package:consultations_app/core/constants/app_translation_keys.dart';
import 'package:consultations_app/core/helpers/exception.dart';
import 'package:consultations_app/core/helpers/failures.dart';
import 'package:consultations_app/injection_container.dart';
import 'package:logger/logger.dart';

Failure getFailureFromException(Object exception) {
  if (exception is BadRequestException) {
    return BadRequestFailure(message: exception.message);
  } else if (exception is UnAuthenticatedException) {
    return const UnAuthenticatedFailure(message: AppTranslationKeys.forbidden);
  } else if (exception is UnAuthorizedException) {
    return const UnAuthorizedFailure(message: AppTranslationKeys.unauthorized);
  } else if (exception is NotFoundException) {
    return const NotFoundFailure(message: AppTranslationKeys.notFound);
  } else if (exception is InternalServerErrorException) {
    return const InternalServerErrorFailure(
      message: AppTranslationKeys.internalServerError,
    );
  } else if (exception is OfflineException) {
    return const OfflineFailure(message: AppTranslationKeys.offline);
  } else {
    InjectionContainer.getIt<Logger>().e('');
    return const UnexpectedFailure(
      message: AppTranslationKeys.unexpectedException,
    );
  }
}
