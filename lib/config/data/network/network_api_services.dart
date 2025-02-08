import 'dart:convert';
import 'dart:io';
import 'package:clean_code_bloc/config/data/exceptions/app_exceptions.dart';
import 'package:clean_code_bloc/config/data/network/base_api_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices implements BaseApiServices {
  @override
  Future deleteApi(String url) async {
    dynamic responseJson;
    try {
      // Make the HTTP GET request with a timeout of 30 seconds
      final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 30));

      // Process the response
      responseJson = returnResponse(response);

      // Handle the response data (if needed)
      if (kDebugMode) {
        print('Response: $responseJson');
      }
    } on SocketException {
      // Handle no internet connection
      throw NoInternetException('No internet connection. Please check your network and try again.');
    } on TimeoutException {
      // Handle request timeout
      throw TimeoutException('The request took too long to respond. Please try again later.');
    } on http.ClientException {
      // Handle HTTP client errors (e.g., connection issues)
      throw FetchDataException('There was an issue retrieving the data. Please try again.');
    } on FormatException {
      // Handle JSON parsing errors
      throw InvalidInputException('The response data is invalid. Please check the server response.');
    } on AppException {
      // Re-throw custom exceptions from returnResponse
      rethrow;
    } catch (e) {
      // Handle any other unexpected errors
      throw FetchDataException('An unexpected error occurred: ${e.toString()}');
    }
  }

  @override
  Future getApi(String url) async {
    dynamic responseJson;
    try {
      // Make the HTTP GET request with a timeout of 30 seconds
      final response = await http.get(Uri.parse(url)).timeout(Duration(seconds: 30));

      // Process the response
      responseJson = returnResponse(response);

      // Handle the response data (if needed)
      if (kDebugMode) {
        print('Response: $responseJson');
      }
    } on SocketException {
      // Handle no internet connection
      throw NoInternetException('No internet connection. Please check your network and try again.');
    } on TimeoutException {
      // Handle request timeout
      throw TimeoutException('The request took too long to respond. Please try again later.');
    } on http.ClientException {
      // Handle HTTP client errors (e.g., connection issues)
      throw FetchDataException('There was an issue retrieving the data. Please try again.');
    } on FormatException {
      // Handle JSON parsing errors
      throw InvalidInputException('The response data is invalid. Please check the server response.');
    } on AppException {
      // Re-throw custom exceptions from returnResponse
      rethrow;
    } catch (e) {
      // Handle any other unexpected errors
      throw FetchDataException('An unexpected error occurred: ${e.toString()}');
    }
  }

  // Sends a POST request to the specified [url] with the provided [data]
  /// and returns the response.
  ///
  /// Throws a [NoInternetException] if there is no internet connection.
  /// Throws a [FetchDataException] if the network request times out.
  @override
  Future postApi(String url, dynamic data) async {
    dynamic postResponse;
    try {
      final http.Response response = await http.post(Uri.parse(url), body: data).timeout(const Duration(seconds: 10));
      postResponse = returnResponse(response);
    } on SocketException {
      // Handle no internet connection
      throw NoInternetException('No internet connection. Please check your network and try again.');
    } on TimeoutException {
      // Handle request timeout
      throw TimeoutException('The request took too long to respond. Please try again later.');
    } on http.ClientException {
      // Handle HTTP client errors (e.g., connection issues)
      throw FetchDataException('There was an issue retrieving the data. Please try again.');
    } on FormatException {
      // Handle JSON parsing errors
      throw InvalidInputException('The response data is invalid. Please check the server response.');
    } on AppException {
      // Re-throw custom exceptions from returnResponse
      rethrow;
    } catch (e) {
      // Handle any other unexpected errors
      throw FetchDataException('An unexpected error occurred: ${e.toString()}');
    }
  }

  @override
  Future updateApi(String url) {
    throw UnimplementedError();
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 201:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 204:
        return null; // No content
      case 400:
        dynamic responseJson = jsonDecode(response.body);
        throw BadRequestException(responseJson['message'] ?? 'Bad Request');
      case 401:
        dynamic responseJson = jsonDecode(response.body);
        throw UnauthorizedException(responseJson['message'] ?? 'Unauthorized');
      case 403:
        dynamic responseJson = jsonDecode(response.body);
        throw ForbiddenException(responseJson['message'] ?? 'Forbidden');
      case 404:
        dynamic responseJson = jsonDecode(response.body);
        throw NotFoundException(responseJson['message'] ?? 'Not Found');
      case 409:
        dynamic responseJson = jsonDecode(response.body);
        throw ConflictException(responseJson['message'] ?? 'Conflict');
      case 412:
        dynamic responseJson = jsonDecode(response.body);
        throw PreconditionFailedException(responseJson['message'] ?? 'Precondition Failed');
      case 500:
        dynamic responseJson = jsonDecode(response.body);
        throw ServerException(responseJson['message'] ?? 'Internal Server Error');
      case 503:
        dynamic responseJson = jsonDecode(response.body);
        throw ServerException(responseJson['message'] ?? 'Service Unavailable');
      default:
        throw FetchDataException('An unexpected error occurred: ${response.statusCode}');
    }
  }
}
