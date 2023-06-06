import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/strings.dart';
import '../screens/home/home.dart';

class CustomTitleBar extends StatefulWidget {
  final String editIcon;
  final String title;

  // String? editIcon;

  const CustomTitleBar({
    Key? key,
    required this.title,
    required this.editIcon,
  }) : super(key: key);

  @override
  State<CustomTitleBar> createState() => _CustomTitleBarState();
}

class _CustomTitleBarState extends State<CustomTitleBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              if (Get.previousRoute.isNotEmpty) {
                Get.back();
              } else {
                Get.offAllNamed(HomeScreen.routeName);
              }
            },
            child: Image.asset(
              'assets/images/back.png',
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            //apply padding to all four sides
            child: Text(
              widget.title,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 26.sp,
                  fontWeight: FontWeight.bold,
                  fontFamily: ConstantStrings.kAppFont),
            ),
          ),
        ],
      ),
    );
  }
}
