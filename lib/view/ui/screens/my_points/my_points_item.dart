import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/strings.dart';
import '../../../../helper/helper.dart';


class MyPointsItem extends StatelessWidget {
  const MyPointsItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h, left: 20.w, right: 20.w),
      height: 110.h,
      width: double.infinity.w,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          // assign the color to the border color
          color: ConstantColors.lightGray,
        ),
      ),
      child: Row(
        children: [
          addW(10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 60.h,
                width: 310.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.green.shade200, //<-- SEE HERE
                      ),
                      padding: EdgeInsets.all(10.h),
                      child: Text(
                        ' 5% \n OFF ',
                        style: TextStyle(
                          color: ConstantColors.green,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: ConstantStrings.kAppFont,
                        ),
                      ),
                    ),
                    addW(10.w),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Get 5% off on any products ',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: ConstantStrings.kAppFont,
                          ),
                        ),
                        addH(10.h),
                        Text(
                          '6000 points',
                          style: TextStyle(
                            color: ConstantColors.grayShade,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.normal,
                            fontFamily: ConstantStrings.kAppFont,
                          ),
                        ),
                      ],
                    ),
                    addW(10.w),
                    Container(
                      decoration: BoxDecoration(
                        color: ConstantColors.lightRed, //<-- SEE HERE
                      ),
                      padding: EdgeInsets.all(15.h),
                      child: Text(
                        'Claim',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: ConstantStrings.kAppFont,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
