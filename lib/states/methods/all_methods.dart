import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../helper/helper.dart';

class AllMethods {

  //for custom dropdown
  static DropdownMenuItem<dynamic> getDDMenuItem({
    required dynamic item,
    required String txt,
  }) {
    return DropdownMenuItem(
      value: item,
      child: Row(
        children: [
          addW(15.w),
          Image.asset('assets/images/map_pin.png'),
          addW(20.w),
          Text(
            txt,
            style: TextStyle(
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }

  // Image Uploading Methods
  static Widget buildDPAlertDialog({
    required Future<void> Function(bool) onPressedFn,
    required BuildContext ctx,
  }) {
    return AlertDialog(
      alignment: Alignment.bottomCenter,
      insetPadding: const EdgeInsets.all(0),
      titlePadding: EdgeInsets.symmetric(horizontal: 10.w),
      contentPadding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 30.h),
      backgroundColor: Colors.transparent,
      title: Container(
        height: 140.h,
        width: MediaQuery.of(ctx).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Column(
          children: [
            buildImgSelectBtn(
              onPressedFn: onPressedFn,
              title: "Camera",
              galleryFlag: false,
            ),
            Divider(indent: 20.w, endIndent: 20.w, thickness: 1),
            buildImgSelectBtn(
              onPressedFn: onPressedFn,
              title: "Choose from gallery",
              galleryFlag: true,
            ),
          ],
        ),
      ),
      content: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          backgroundColor:
          MaterialStateProperty.all(Colors.red),
          fixedSize: MaterialStateProperty.all(Size(354.w, 60.h)),
        ),
        onPressed: () {
          Get.back();
        },
        child: Text(
          "Cancel",
          style: TextStyle(fontSize: 18.sp),
        ),
      ),
    );
  }

  static TextButton buildImgSelectBtn({
    required Future<void> Function(bool) onPressedFn,
    required String title,
    required bool galleryFlag,
  }) {
    return TextButton(
      onPressed: () async {
        onPressedFn(galleryFlag);
        Get.back();
      },
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size(354.w, 54.h)),
        overlayColor: MaterialStateProperty.all(Colors.transparent),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 17.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

