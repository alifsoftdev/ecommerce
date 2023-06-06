import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kallukoshai/view/ui/screens/order/track_order.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/strings.dart';
import '../../../../helper/helper.dart';
import '../../../../states/model/my_oders.dart' as order;

class OrderItem extends StatelessWidget {
  //final String? image;
  order.MyOrdersModelItem? ordersItem;

  OrderItem({Key? key, required this.ordersItem}) : super(key: key);
  String? orderId;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h, left: 20.w, right: 20.w),
      height: 130.h,
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
          GestureDetector(
            onTap: () {
              if (ordersItem!.status == 'complete' ||
                  ordersItem!.status == 'processing' ||
                  ordersItem!.status == 'pending' ||
                  ordersItem!.status == 'shipped') {
                //Get.to(AddPet(petModel: widget.petModel,));
                //   Navigator.push(context, MaterialPageRoute(builder: (context) => TrackOrder(ordersItem: ordersItem,)));
                Get.offAndToNamed(TrackOrder.routeName,
                    arguments: [ordersItem!.items.first.orderId]);

                // Navigator.pushNamed(context, "myRoute");
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40.h,
                  width: 300.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          /* Image.asset(
                          image!,
                        ),*/
                          addW(10.w),
                          Text(
                            'Order Id: ${ordersItem!.incrementId} ',
                            //    addressModel!.street[0],
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
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(TrackOrder.routeName,
                                  arguments: [ordersItem!.items.first.orderId]);

                              // Navigator.pushNamed(context, "myRoute");
                            },
                            child: Text(
                              ' ${ordersItem!.baseGrandTotal} ',
                              // ' ${ordersItem!.items.first.basePriceInclTax} ',
                              style: TextStyle(
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
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addH(10.h),
                      Text(
                        "  ${ordersItem!.items.first.name}",
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
                            'Status:  ${ordersItem!.status}',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: ConstantStrings.kAppFont,
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                          ),
                          addW(10.w),
                          /*  Text(
                          addressModel!.telephone,
                          // '+966 01-2050876 ',
                          style: TextStyle(
                            color: Colors.black,
                            fontFamily: ConstantStrings.kAppFont,
                            fontSize: 14.sp,
                          ),
                        ),*/
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
