import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'helper.dart';

class DialogHelper {
  //show error dialog
  static void showErroDialog(
      {String title = 'Error', String? description = 'Something went wrong'}) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Get.textTheme.headlineMedium,
              ),
              Text(
                description ?? '',
                style: Get.textTheme.titleLarge,
              ),
              ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen!) Get.back();
                },
                child: const Text('Okay'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //show error dialog
  static void showConfirmDialog(
      {String? title,
      String? description,
      VoidCallback? rightBtnPressed,
      VoidCallback? leftBtnPressed}) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title ?? 'Are you sure?',
                style: Get.textTheme.titleLarge,
              ),
              addH(10.h),
              Text(
                description ?? 'You won\'t be able to revert this!',
                style: TextStyle(fontSize: 16.sp),
              ),
              addH(10.h),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: leftBtnPressed,
                      child: const Text('No, Cancel!'),
                    ),
                    ElevatedButton(
                      onPressed: rightBtnPressed,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.red),
                      ),
                      child: const Text('Yes, Delete it'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  //show toast
  //show snack bar
  //show loading
  static void showLoading([String? message]) {
    Get.dialog(
      Dialog(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CircularProgressIndicator(),
              addH(10.h),
              Text(message ?? 'Loading...'),
            ],
          ),
        ),
      ),
    );
  }

  //show loading
  static void showToast([String? message]) {
    Fluttertoast.showToast(
        msg: message ?? "This is Center Short Toast",
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  //show loading
  static void showSnackBar([String? message]) {
    Get.snackbar('Alert!',message!,
        backgroundColor: Colors.white,
        margin: const EdgeInsets.only(top: 5,left: 10,right: 10));
  }

  //hide loading
  static void hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }
}
