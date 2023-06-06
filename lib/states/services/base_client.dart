import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;

import '../../constants/strings.dart';
import 'app_expections.dart';

class BaseClient {
  static const int TIME_OUT_DURATION = 20;

  //GET
  Future<dynamic> get(String api, String getToken) async {
    var uri = Uri.parse(ConstantStrings.kBaseUrl + api);

    print('Get Url: ');
    print(uri);
    String token = getToken.replaceAll('"', '');
    print('Get Token : ');
    print(token);

    try {
      var response = await http.get(uri, headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        HttpHeaders.authorizationHeader: 'Bearer $token'
      }).timeout(
        const Duration(seconds: TIME_OUT_DURATION),
      );

      log('Get Response: ${response.body.toString()}');
      print(response.statusCode);

      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  Future<dynamic> getApi(String api) async {
    var uri = Uri.parse(ConstantStrings.kBaseUrl + api);

    print('Get Url: ');
    print(uri);

    try {
      var response = await http.get(uri).timeout(
            const Duration(seconds: TIME_OUT_DURATION),
          );

      log('Get Response: ${response.body.toString()}');
      print(response.statusCode);

      return _processResponse(response);
    } on SocketException {
      throw FetchDataException(
        'No Internet connection',
        uri.toString(),
      );
    } on TimeoutException {
      throw ApiNotRespondingException(
        'API not responded in time',
        uri.toString(),
      );
    }
  }

  //POST
  Future<dynamic> post(String api, dynamic payloadObj, String getToken) async {
    var uri = Uri.parse(ConstantStrings.kBaseUrl + api);
    var payload = json.encode(payloadObj);

    print("post url !");
    print(ConstantStrings.kBaseUrl + api);
    print("payload : ! ");
    log(payload);
    String token = getToken.replaceAll('"', '');
    print('Get Token : !');
    print(token);

    try {
      var response = await http.post(
        uri,
        body: payload,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token'
        },
      ).timeout(
        const Duration(seconds: TIME_OUT_DURATION),
      );

      log('PostMethod Response: ${response.body}');
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
        'API not responded in time',
        uri.toString(),
      );
    }
  }

  //PUT
  Future<dynamic> put({
    required String api,
    required String token,
    dynamic payloadObj,
  }) async {
    var uri = Uri.parse(ConstantStrings.kBaseUrl + api);
    var payload = json.encode(payloadObj);
    // token = token.replaceAll('"', '');
    print('Bearer $token');
    log(payload);
    try {
      var response = await http.put(
        uri,
        body: payload,
        headers: {
          'Content-Type': 'application/json',
          HttpHeaders.authorizationHeader: 'Bearer $token'
        },
      ).timeout(
        const Duration(seconds: TIME_OUT_DURATION),
      );
      print("put url : ");
      print(uri);

      log('PutMethod response: ${response.body}');
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
        'API not responded in time',
        uri.toString(),
      );
    }
  }

  Future<dynamic> putCopy({
    required String api,
    dynamic payloadObj,
  }) async {
    var uri = Uri.parse(ConstantStrings.kBaseUrl + api);
    var payload = json.encode(payloadObj);
    // token = token.replaceAll('"', '');
    log(payload);
    try {
      var response = await http.put(
        uri,
        body: payload,
        headers: {
          'Content-Type': 'application/json',
        },
      ).timeout(
        const Duration(seconds: TIME_OUT_DURATION),
      );
      print("put url : ");
      print(uri);

      log('PutMethod response: ${response.body}');
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
        'API not responded in time',
        uri.toString(),
      );
    }
  }

  //
  // static Future<dynamic> uploadImageFile(filePath,api) async {
  //   //jwt authentication token
  //   // var authToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6InNhbTEyM0BnbWFpbC5jb20iLCJzdWIiOiI2MDViOTgxZDRkOTk4YjMxMjRhODEyMDQiLCJyb2xlIjoiY3VzdG9tZXIiLCJpYXQiOjE2MTgyMzQ4NjUsImV4cCI6MTYxODMyMTI2NX0.lYUfZ20TlFZZQO_1JKZbKYZublPRoejqnmxKOAM9CN0';
  //
  //   //user im use to upload image
  //   //Note: this authToken and user id parameter will depend on my backend api structure
  //   //in your case it can be only auth token
  //   // var _userId = '605b981d4d998b3124a81204';
  //
  //   try {
  //     FormData formData =
  //     new FormData.fromMap({
  //       "CustomerId":Preference.getUserIdFlag(),
  //       "image": await MultipartFile.fromFile(filePath, filename: "dp")});
  //
  //     var response =
  //     await Dio().post(
  //         ConstantStrings.kBaseUrl + api,
  //         data: formData,
  //         options: Options(
  //             headers: <String, String>{
  //               'Authorization': 'Bearer /Token',
  //               'Content-Type': 'application/json; charset=UTF-8'
  //             }
  //         )
  //     );
  //     return response;
  //   }on DioError catch (e) {
  //     return e.response;
  //   } catch(e){
  //   }
  // }

  //DELETE
  Future<dynamic> deleteData(String api, String token) async {
    var uri = Uri.parse(ConstantStrings.kBaseUrl + api);
    print("delete url : ");
    print(uri);
    try {
      final http.Response response = await http.delete(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: 'Bearer $token'
        },
      );

      print("delete response: ");
      log(response.body);
      log(response.statusCode.toString());
      return _processResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection', uri.toString());
    } on TimeoutException {
      throw ApiNotRespondingException(
          'API not responded in time', uri.toString());
    }
  }

  //OTHER
  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 201:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 400:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      /*  throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());*/
      case 401:
        var responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      /* throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());*/
      case 403:
        throw UnAuthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 422:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred with code : ${response.statusCode}',
            response.request!.url.toString());
    }
  }
}
