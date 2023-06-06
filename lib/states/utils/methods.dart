import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class Methods {
  static void showSnackbar({
    // required BuildContext context,
    String? title,
    required String msg,
    int? duration,
    IconData? icon,
    Color? iconClr,
    SnackPosition? position,
  }) {
    // ScaffoldMessenger.of(context).showSnackBar(snackBar(
    //   title: title,
    //   msg: msg,
    //   icon: icon,
    //   position: position,
    // ));
    Get.snackbar(
      title ?? 'Error',
      msg,
      icon: Icon(
        icon ?? Icons.error,
        color: iconClr ?? Colors.red,
      ),
      snackPosition: position ?? SnackPosition.BOTTOM,
      animationDuration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.only(bottom: 20),
      duration: Duration(seconds: duration ?? 2),
    );
  }

  static void showLoading() {
    if (!EasyLoading.isShow) {
      EasyLoading.show(
        status: 'Loading...',
        dismissOnTap: false,
      );
    }
  }

  static void hideLoading() => EasyLoading.dismiss();
}
