import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants/colors.dart';
import '../../../constants/strings.dart';

class DrawerItem extends StatelessWidget {
  final String name;
  final VoidCallback onClick;

  const DrawerItem({
    Key? key,
    required this.name,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Text(
          name,
          style: TextStyle(
            color: ConstantColors.grayShade,
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            fontFamily: ConstantStrings.kAppFont,
          ),
        ),
      ),
    );
  }
}
