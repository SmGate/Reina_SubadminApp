import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../Data/App Exceptions/app_exception.dart';

abstract class BaseNetworkServices {
  Future<dynamic> getReq(url);
  Future<dynamic> postReq(url, var data);
}

class NetworkServices implements BaseNetworkServices {
  @override
  Future<dynamic> getReq(url, {String? bearerToken}) async {
    var futureData;
    print("getreq func");

    print(url);
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $bearerToken',
        },
      );
      print(response.body.toString());
      log("------");
      futureData = getApiResponse(response);
    } on SocketException {
      throw InternetException;
    } on TimeoutException {
      throw RequestTimeOutException;
    }

    return futureData;
  }

  dynamic getApiResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var data = jsonDecode(response.body);
        return data;
      case 500:
        throw ServerException(response.statusCode);
      case 401:
        throw UnAuthorizedException(response.statusCode);
    }
  }

  @override
  Future postReq(url, data) async {
    dynamic futureData;

    try {
      final response = await http.post(
        Uri.parse(url),
        body: data,
      );
      futureData = getApiResponse(response);
    } on SocketException {
      throw InternetException;
    } on TimeoutException {
      throw RequestTimeOutException;
    }

    return futureData;
  }
}
