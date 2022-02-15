import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:playlist_duration/utils/app_exceptions.dart';

class ApiBaseHelper {
  static Future<dynamic> get(Uri url, {Map<String, String> headers}) async {
    var responseJson;
    try {
      final response = await http.get(url, headers: headers);
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  static dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
