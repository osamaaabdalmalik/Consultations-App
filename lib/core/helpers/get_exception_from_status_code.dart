import 'dart:convert';

import 'package:consultations_app/core/constants/app_strings.dart';
import 'package:consultations_app/core/helpers/exception.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart';

Unit getExceptionStatusCode(Response response) {
  switch (response.statusCode) {
    case 200:
    case 201:
      return unit;
    case 400:
    case 422:
      Map body = json.decode(response.body);
      String message = body.containsKey('message') ? body['message'] : AppStrings.unexpectedException;
      throw BadRequestException(message: message);
    case 403:
      throw UnAuthorizedException();
    case 401:
      throw UnAuthenticatedException();
    case 404:
      throw NotFoundException();
    case 500:
      throw InternalServerErrorException();
    default:
      throw UnexpectedException();
  }
}
