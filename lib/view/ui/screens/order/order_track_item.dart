import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../constants/strings.dart';
import '../../../../helper/helper.dart';

class OrderTrackItem extends StatelessWidget {
  final String? image, title, status, date, dividerColor, stauts;

  const OrderTrackItem(
      {Key? key,
      this.image,
      this.title,
      this.status,
      this.date,
      this.dividerColor,
      required this.stauts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: double.infinity.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              addW(25.w),
              Column(
                children: [
                  Image.asset(image!),
                  Flexible(
                    child: VerticalDivider(
                      color: HexColor(dividerColor!),
                      thickness: 1,
                    ),
                  ),
                ],
              ),
              addW(10.w),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '$title',
                        style: TextStyle(
                            fontFamily: ConstantStrings.kAppFont,
                            color: Colors.black,
                            fontSize: 22.sp),
                      ),
                      addH(10.h),
                      SizedBox(
                        width: 230,
                        child: Text(
                          '$status',
                          style: TextStyle(
                            fontFamily: ConstantStrings.kAppFont,
                            color: HexColor('#656E72'),
                            fontSize: 14.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                  addW(10.w),
                  Text(
                    '$date',
                    style: TextStyle(
                      fontFamily: ConstantStrings.kAppFont,
                      fontWeight: FontWeight.bold,
                      color: HexColor('#656E72'),
                      fontSize: 10.sp,
                    ),
                  ),
                ],
              )
            ],
          ),
          //    ),
        ],
      ),
    );
  }
}
