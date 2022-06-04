import 'package:flutter/material.dart';

import '../../Presentation/Components/snack_bar.dart';

enum ExceptionTypes {
  socketException,
  httpException,
  formatException,
  timeoutException
}

class ExceptionHandlers {
  String typeOfException(ExceptionTypes exceptionTypes) {
    switch (exceptionTypes) {
      case ExceptionTypes.socketException:
        return 'No internet connection.';
      case ExceptionTypes.httpException:
        return 'HTTP error occured.';
      case ExceptionTypes.formatException:
        return 'Invalid data format.';
      case ExceptionTypes.timeoutException:
        return 'Request timeout.';
    }
  }
}

class AppException implements Exception {
  final String? message;
  final String? prefix;
  final String? url;

  AppException([this.message, this.prefix, this.url]);
}

class BadRequestException extends AppException {
  BadRequestException([String? message, String? url])
      : super(message, 'Bad request', url);
}

class FetchDataException extends AppException {
  FetchDataException([String? message, String? url])
      : super(message, 'Unable to process the request', url);
}

class ApiNotRespondingException extends AppException {
  ApiNotRespondingException([String? message, String? url])
      : super(message, 'Api not responding', url);
}

class UnAuthorizedException extends AppException {
  UnAuthorizedException([String? message, String? url])
      : super(message, 'Unauthorized request', url);
}

class NotFoundException extends AppException {
  NotFoundException([String? message, String? url])
      : super(message, 'Page not found', url);
}

