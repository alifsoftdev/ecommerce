import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';

class CustomBoxWithImage extends StatelessWidget {
  String? imgUrl;

  CustomBoxWithImage({
    super.key,
    required this.imgUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50.h,
        height: 50.w,
        decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: ConstantColors.lightGray,
            width: 1,
          ),
        ),

        // use aligment
        // color: Color.fromRGBO(0, 96, 91, 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imgUrl!),
          ],
        ));
  }
}
