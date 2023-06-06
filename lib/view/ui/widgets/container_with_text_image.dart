import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../constants/colors.dart';
import '../../../helper/helper.dart';

class CustomBoxWithTextAndImage extends StatelessWidget {
  String? imgUrl, title, number;

  CustomBoxWithTextAndImage(
      {super.key,
      required this.imgUrl,
      required this.title,
      required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 100.w,
        padding: EdgeInsets.all(10.h),
        decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: ConstantColors.lightGray,
            width: 1,
          ),
        ),
        // alignment: Alignment.center,

        // use aligment
        // color: Color.fromRGBO(0, 96, 91, 1),
        child: Column(
          children: [
            addH(5.h),
            Image.asset(imgUrl!, height: 20, width: 20, fit: BoxFit.cover),
            addH(5.h),
            Text(
              title!,
              style: TextStyle(
                  //  fontFamily: ConstantStrings.kAppFont,
                  color: HexColor('#656E72'),
                  fontSize: 12.sp),
            ),
            addH(5.h),
            Text(
              number!,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 17.sp),
            ),
          ],
        ));
  }
}
