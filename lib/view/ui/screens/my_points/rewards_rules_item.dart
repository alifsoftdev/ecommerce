import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../constants/strings.dart';
import '../../../../helper/helper.dart';

class RewardsRulesItem extends StatelessWidget {
  String frontName;
  RewardsRulesItem(
      {Key? key, required this.frontName, })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Row(
     // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
                shape: BoxShape.circle, color: Colors.black),
            padding: const EdgeInsets.all(40.0),
          ),
        ),
        addW(10.w),
        SizedBox(
          width: Get.width - 80,
          child: Text(
            frontName,
            //   'Get 10 point by making order',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              fontFamily: ConstantStrings.kAppFont,
            ),
          ),
        ),
      ],
    );
  }
}