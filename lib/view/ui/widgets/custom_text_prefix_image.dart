import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helper/helper.dart';

class TextWithPrefixIcon extends StatelessWidget {
  String? imgUrl, title;

  TextWithPrefixIcon({
    super.key,
    required this.imgUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100.w,
        padding: EdgeInsets.all(10.h),

        // alignment: Alignment.center,

        // use aligment
        // color: Color.fromRGBO(0, 96, 91, 1),
        child: Column(
          children: [
            Row(
              children: [
                addH(5.h),
                Image.asset(imgUrl!, height: 20, width: 20, fit: BoxFit.cover),
                addH(5.h),
                Text(
                  title!,
                  style: TextStyle(
                      //  fontFamily: ConstantStrings.kAppFont,
                      color: Colors.white,
                      fontSize: 14.sp),
                ),
              ],
            ),
          ],
        ));
  }
}
