import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/strings.dart';
import '../../../../helper/helper.dart';
import '../../../../states/model/customer_registration_model.dart';
import 'add_address.dart';

class AddressItem extends StatelessWidget {
  //final String? image;
  Address? addressModel;
  final bool isSelectFlag;

  AddressItem(
      {Key? key, required this.addressModel, required this.isSelectFlag})
      : super(key: key);

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
          color:
              isSelectFlag ? ConstantColors.lightRed : ConstantColors.lightGray,
        ),
      ),
      child: Row(
        children: [
          addW(10.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
                width: 360.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${addressModel!.firstname} ${addressModel!.lastname} ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: ConstantStrings.kAppFont,
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/edit_address.png',
                        ),
                        addW(5.w),
                        GestureDetector(
                          /*onTap: () => Get.toNamed(
                            AddAddress.routeName,
                            arguments: [null, addressModel],
                          ),*/
                          child: Text(
                            'Change ',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: Colors.black,
                              fontFamily: ConstantStrings.kAppFont,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${addressModel!.street.join(', ')},${addressModel!.city}", //this street is a list..so not possible to get items like this?
                    //'Ulaya Dist., P.O.Box: 974, Riyadh, Saudi Arabia',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontFamily: ConstantStrings.kAppFont,
                    ),
                  ),
                  addH(10.h),
                  Row(
                    children: [
                      Text(
                        'Phone Number:',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: ConstantStrings.kAppFont,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.sp,
                        ),
                      ),
                      addW(10.w),
                      Text(
                        addressModel!.telephone,
                        // '+966 01-2050876 ',
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: ConstantStrings.kAppFont,
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
