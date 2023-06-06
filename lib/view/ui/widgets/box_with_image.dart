import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';

class CustomContainer extends StatelessWidget {
  String? imgUrl;

  CustomContainer({super.key, this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65.w,
      height: 45.h,
      decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: ConstantColors.lightGray,
          width: 1,
        ),
      ),
      /*
          image: DecorationImage(
            image: AssetImage(imgUrl!,),

            fit: BoxFit.fitHeight,

          )),
*/
      alignment: Alignment.center,
      // use aligment
      // color: Color.fromRGBO(0, 96, 91, 1),
      child: Image.asset(imgUrl!, height: 20, width: 20, fit: BoxFit.cover),
      /*   BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.black,
            width: 1.0,
          ),
          top: BorderSide(
            color: Colors.black,
            width: 1.0,
          ),
        ),
      ),*/
    );
  }
}
