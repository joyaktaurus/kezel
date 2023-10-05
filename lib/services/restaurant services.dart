import 'dart:developer';

import 'package:dio/dio.dart';

import '../models/api_msg.dart';
import '../models/api_resp.dart';
import '../presets/api_paths.dart';
import '../utils/err_m.dart';
import '../utils/mydio.dart';


abstract class RestaurantServices {
  static Future<ApiResp> fetchMarketing({
    required String url,
    required Map<String, dynamic> parameters,
    required String method,
  }) async {
    dynamic resp;
    await errMAsync(
          () async {
        resp = await MyDio().Post(
          ApiPaths.baseUrl,
          data: parameters,
        );
      },
      //  title: 'Marketing Failed',
    );
    if (resp is DioError) {
      if (resp.response?.statusCode == 400) {
        log('400 >> ${resp.response}');
        showMsg("Invalid Details", "Marketing Failed");
      }
      if (resp.type == DioErrorType.connectTimeout) {
        showMsg(
            'Connection timed-out. Check internet connection.', "Marketing Failed");
      }
      if (resp.type == DioErrorType.receiveTimeout) {
        showMsg('Unable to connect to the server', "Marketing Failed");
      }
      if (resp.type == DioErrorType.other) {
        showMsg(
            'Something went wrong with server communication', "Marketing Failed");
      }
    } else {
      respNew = resp != null
          ? ApiResp(
        ok: true,
        rdata: resp,
        msgs: [
          ApiMsg(
            msg: "",
            msgType: "",
            title: "Success",
          )
        ],
      )
          : ApiResp(
        ok: false,
        rdata: "",
        msgs: [
          ApiMsg(
            msg: "Server response failed",
            msgType: "0",
            title: "Failed",
          )
        ],
      );
    }
    return respNew;
  }
}