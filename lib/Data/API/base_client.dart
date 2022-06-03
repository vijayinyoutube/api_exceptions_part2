import 'dart:async';
import 'dart:convert';
import 'dart:io';

import '../../Business_Logic/Exceptions/exception_handlers.dart';
import 'package:http/http.dart' as http;

class BaseClient {
  static const int timeOutDuration = 35;

  //GET
  Future<dynamic> get(String url) async {
    var uri = Uri.parse(url);
    try {
      var response =
          await http.get(uri).timeout(const Duration(seconds: timeOutDuration));
      return _processResponse(response);
    } on SocketException {
      throw const SocketException('Socket exception');
    } on TimeoutException {
      throw ApiNotRespondingException('Server not responding.');
    } on FormatException {
    } on HttpException {
    } catch (e) {
      throw e.toString();
    }
  }

  //POST
  Future<dynamic> post(String url, dynamic payloadObj) async {
    var uri = Uri.parse(url);
    var payload = jsonEncode(payloadObj);
    try {
      var response = await http
          .post(uri, body: payload)
          .timeout(const Duration(seconds: timeOutDuration));

      return _processResponse(response);
    } on SocketException {
    } on TimeoutException {
      throw ApiNotRespondingException('Server not responding.');
    } on FormatException {
    } on HttpException {}
  }

  //DELETE
  //OTHERS

//----------------------ERROR STATUS CODES----------------------

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = response.body;
        return responseJson;
      case 400: //Bad request
        throw BadRequestException(response.body);
      case 401: //Unauthorized
        throw UnAuthorizedException(response.body);
      case 403: //Forbidden
        throw UnAuthorizedException(response.body);
      case 404: //Resource Not Found
        throw NotFoundException(response.body);
      case 500: //Internal Server Error
      default:
        throw FetchDataException(
            'Something went wrong! ${response.statusCode}');
    }
  }
}
