import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../constants/strings.dart';
import '../../../helper/helper.dart';

class ContainerGrayBackground extends StatelessWidget {
  String? orderId, date;
  double? amount;

  ContainerGrayBackground(
      {super.key,
      required this.orderId,
      required this.date,
      required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(20.h),
        margin: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: HexColor('#F3F3F3'),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Order # $orderId',
                  style: TextStyle(
                      fontFamily: ConstantStrings.kAppFont,
                      color: Colors.black,
                      fontSize: 22.sp),
                ),
                addH(10.h),
                Text(
                  'Placed on $date',
                  style: TextStyle(
                      fontFamily: ConstantStrings.kAppFont,
                      color: HexColor('#656E72'),
                      fontSize: 11.sp),
                ),
              ],
            ),
            Text(
              'AED $amount',
              style: TextStyle(
                  fontFamily: ConstantStrings.kAppFont,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 16.sp),
            ),
          ],
        ));
  }
}
