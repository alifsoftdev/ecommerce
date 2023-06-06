import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constants/strings.dart';
import '../../../helper/helper.dart';

class AppTitleBar extends StatelessWidget {
  final String title;
  const AppTitleBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_outlined,
            )),
        addW(10.w),
        SizedBox(
          width: Get.width - 100,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 25.sp,
                fontFamily: ConstantStrings.kAppFont,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
