import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import '../app.dart';
import '../models/api_resp.dart';
import '../presets/api_paths.dart';

ApiResp respNew = ApiResp(
  ok: false,
  rdata: null,
  msgs: [],
);

class MyDio {
  static String baseUrl = ApiPaths.baseUrl;

  late Dio _dio;

  MyDio() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: 60 * 500,
      // 30 seconds
      receiveTimeout: 60 * 1000,
      // 60 seconds

      responseType: ResponseType.plain,
      headers: {
        Headers.contentTypeHeader: "application/json",
      },
    );

    _dio = Dio(options);

    (_dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return null;
    };
  }


  Future<dynamic>Post(
      String path, {
        data,
        Map<String, dynamic>? queryParameters,
        Options? options,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceivedProgress,
      }) async {
    try {
      // Ensure there's a forward slash between baseUrl and path
      Response resp = await _dio.post(baseUrl + '/' + path,
        data: data,
        queryParameters: queryParameters,
        options: Options(
          responseType: ResponseType.plain,
          headers: {
            Headers.contentTypeHeader: "application/json",
          },
        ),
      );
      debugPrint("!!!!!!!!!!!!!! Request Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${resp.statusCode}] => PATH: ${resp.requestOptions.path}");
      debugPrint("ResMethodType : [${resp.requestOptions.method}]");
      resp.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      resp.requestOptions.queryParameters
          .forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(resp.requestOptions.queryParameters.toString());

      if (resp.requestOptions.data != null) {
        debugPrint("Body: ${jsonEncode(resp.requestOptions.data)}");
      }
      log('resp >>>${resp.data}');
      debugPrint("************** Response End ************************");
      dynamic apiResp = jsonDecode(resp.data);
      return apiResp;
    } on DioError catch (ex) {
      // nav.Get.to(MAErrorScreenWidget(onRetry: () {}));
      debugPrint("!!!!!!!!!!!!!! Error Begin !!!!!!!!!!!!!!!!!!!!!");
      debugPrint(
          "REQUEST[${ex.response?.statusCode}] => PATH: ${ex.requestOptions.path}");
      debugPrint("ResMethodType : [${ex.requestOptions.method}]");
      ex.requestOptions.headers.forEach((k, v) => debugPrint('$k: $v'));

      debugPrint("QueryParameters:");
      ex.requestOptions.queryParameters.forEach((k, v) => debugPrint('$k: $v'));
      debugPrint(ex.requestOptions.queryParameters.toString());

      if (ex.requestOptions.data != null) {
        debugPrint("Body: ${jsonEncode(ex.requestOptions.data)}");
      }
      log('error type >>>${ex.type}');
      debugPrint("************** Error End ************************");
      if (ex.type == DioErrorType.connectTimeout) {
        throw Exception(ex.message);
      } else {
        return ex;
      }
    }
  }
}