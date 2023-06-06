import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/strings.dart';
import '../../../helper/helper.dart';

class CustomBtn extends StatelessWidget {
  final VoidCallback btnFn;
  final String btnText;
  final String? textFontFamily;
  double? txtSize;
  Color? txtColor;
  Color? borderColor;
  Size? btnSize;
  final Color btnBgClr;
  BorderRadiusGeometry? btnRadius;
  String? imgUrl;
  double? imgHeight;

  CustomBtn({
    Key? key,
    required this.btnFn,
    required this.btnText,
    this.txtSize,
    this.txtColor,
    this.borderColor,
    this.btnSize,
    required this.btnBgClr,
    this.btnRadius,
    this.textFontFamily,
    this.imgUrl,
    this.imgHeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: btnFn,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(0),
        backgroundColor: MaterialStateProperty.all(btnBgClr),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            side: BorderSide(color: borderColor ?? Colors.transparent),
            borderRadius: btnRadius ?? BorderRadius.zero,
          ),
        ),
        fixedSize: MaterialStateProperty.all(btnSize ?? Size(348.w, 52.h)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (imgUrl != null)
            SvgPicture.asset(
              imgUrl!,
              height: imgHeight,
            ),
          addW(5.w),
          Text(
            btnText,
            style: TextStyle(
              color: txtColor,
              fontSize: txtSize,
              fontFamily: ConstantStrings.kAppFont,
            ),
          ),
        ],
      ),
    );
  }
}
