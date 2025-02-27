import 'dart:convert';
import 'dart:io';

import 'package:flutter_dev/State_Management/Data/App_Exception.dart';
import 'package:flutter_dev/State_Management/Data/Network/BaseApi_response.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class NetworkapiServices extends BaseapiServices {
  @override
  Future getGetapiResponse(String url) async {
    dynamic responseJson;
    try {
      final response = await http
          .get(Uri.parse(url))
          .timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostapiResponse(String url, dynamic data) async {
    dynamic responseJson;
    try {
      Response response = await post(
        Uri.parse(url),
        body: data,
      ).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    return responseJson;
  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;

      case 400:
        throw BadRequestException(response.body.toString());

      case 404:
        throw UnAuthException(response.body.toString());
      default:
        throw FetchDataException(
          'Error occurded in communicatinig with server ' +
              'with status code ' +
              response.statusCode.toString(),
        );
    }
  }
}
