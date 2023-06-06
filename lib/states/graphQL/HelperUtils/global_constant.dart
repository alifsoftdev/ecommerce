import 'dart:convert';

import 'package:get/get.dart';


class HelperUtils {


    String getPrettyJSONString(Object? jsonObject) {
    String response = const JsonEncoder.withIndent(' ').convert(jsonObject);
    return response;
  }

  static void showToast(String msg) {

    Get.snackbar("error", msg);
  }




}
