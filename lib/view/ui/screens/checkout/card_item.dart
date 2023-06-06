import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/strings.dart';
import '../../../../helper/helper.dart';
import '../../widgets/container_with_image.dart';

class PaymentCardItem extends StatelessWidget {
  final String? image;

  const PaymentCardItem({Key? key, this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h, left: 20.w, right: 20.w),
      height: 80.h,
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
          addH(20.h),
          addW(10.w),
          SizedBox(
            height: 40.h,
            width: 350.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    /* Flexible(
                          flex: 1,
                          child: */
                    Radio(
                        activeColor: Colors.orange,
                        value: 2,
                        groupValue: 2,
                        onChanged: (value) {
                          print(value); //selected value
                        }),
                    // ),

                    addH(10.h),
                    CustomBoxWithImage(
                      imgUrl: image,
                    ),

                    addW(10.w),
                    Text(
                      'Home',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: ConstantStrings.kAppFont,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      'assets/images/edit_address.png',
                    ),
                    addW(5.w),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
