/// Base class for custom application exceptions.
class AppException implements Exception {
  final String? _message; // Message associated with the exception
  final String? _prefix; // Prefix for the exception

  /// Constructor for creating an [AppException] instance.
  ///
  /// The [message] parameter represents the message associated with the exception,
  /// and the [prefix] parameter represents the prefix for the exception.
  AppException([this._message, this._prefix]);

  @override
  String toString() {
    return '$_prefix: $_message'; // Returns the formatted error message
  }
}

/// Exception class representing a fetch data error during communication.
class FetchDataException extends AppException {
  FetchDataException([String? message]) : super(message, 'There was an issue retrieving the data. Please try again.');
}

/// Exception class representing an unauthorized access error.
class UnauthorizedException extends AppException {
  UnauthorizedException([String? message]) : super(message, 'You are not authorized to perform this action.');
}

/// Exception class representing a bad request error.
class BadRequestException extends AppException {
  BadRequestException([String? message]) : super(message, 'The request could not be processed. Please check your input and try again.');
}

/// Exception class representing an invalid input error.
class InvalidInputException extends AppException {
  InvalidInputException([String? message]) : super(message, 'The input provided is invalid. Please correct it and try again.');
}

/// Exception class representing a no internet connection error.
class NoInternetException extends AppException {
  NoInternetException([String? message]) : super(message, 'No internet connection. Please check your network and try again.');
}

/// Exception class representing a timeout error.
class TimeoutException extends AppException {
  TimeoutException([String? message]) : super(message, 'The request took too long to respond. Please try again later.');
}

/// Exception class representing a server error.
class ServerException extends AppException {
  ServerException([String? message]) : super(message, 'Something went wrong on our end. Please try again later.');
}

/// Exception class representing a forbidden access error.
class ForbiddenException extends AppException {
  ForbiddenException([String? message]) : super(message, 'You do not have permission to access this resource.');
}

/// Exception class representing a resource not found error.
class NotFoundException extends AppException {
  NotFoundException([String? message]) : super(message, 'The requested resource could not be found.');
}

/// Exception class representing a conflict error (e.g., duplicate entries).
class ConflictException extends AppException {
  ConflictException([String? message]) : super(message, 'There is a conflict with the current state of the resource.');
}

/// Exception class representing a precondition failure.
class PreconditionFailedException extends AppException {
  PreconditionFailedException([String? message]) : super(message, 'A required condition was not met. Please check and try again.');
}
