import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../helper/helper.dart';

class FooterText extends StatelessWidget {
  final String normalTxt;
  final String navigatingTxt;
  final VoidCallback onTapFn;
  const FooterText({
    Key? key,
    required this.normalTxt,
    required this.navigatingTxt,
    required this.onTapFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          normalTxt,
          style: TextStyle(
            fontSize: 14.sp,
          ),
        ),
        addW(2.w),
        InkWell(
          onTap: onTapFn,
          child: Text(
            navigatingTxt,
            style: TextStyle(
              color: Colors.amber.shade800,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ],
    );
  }
}
