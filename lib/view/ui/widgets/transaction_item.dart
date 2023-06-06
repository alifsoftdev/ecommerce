import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../constants/strings.dart';
import '../../../helper/helper.dart';
import '../../../states/model/transaction_list_response_model.dart';

class TransactionItem extends StatelessWidget {
  final Lasttransaction lasttransaction;

  const TransactionItem({
    super.key,
    required this.lasttransaction,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        /* Get.toNamed(
          OrderDetailsScreen.routeName,
        );*/
      },
      child: Container(
        width: double.infinity,
        height: 100,
        margin: const EdgeInsets.only(
          left: 10.0,
          top: 5.0,
        ),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // addH(10.h),

                SizedBox(
                  width: Get.width - 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        maxLines: 2,
                        // supplierCurrentOrders.productName??'',
                        '${lasttransaction.referenceNote} #${lasttransaction.reference}',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            fontFamily: ConstantStrings.kAppFont),
                      ),
                      // Text(
                      //   'Use wallet #4',
                      //   style: TextStyle(
                      //       color: Colors.grey,
                      //       fontSize: 14.sp,
                      //       fontWeight: FontWeight.bold,
                      //       fontFamily: ConstantStrings.kAppFont),
                      // ),
                      // Spacer(),
                    ],
                  ),
                ),
                addH(5.h),
                SizedBox(
                  width: Get.width - 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Debit: ${lasttransaction.debit}',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal,
                                fontFamily: ConstantStrings.kAppFont),
                          ),
                          addH(5.h),
                          Text(
                            'Credit:   ${lasttransaction.credit}',
                            style: TextStyle(
                                color: Colors.green,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal,
                                fontFamily: ConstantStrings.kAppFont),
                          ),
                        ],
                      ),
                      //  Spacer(),
                      Container(
                        padding: const EdgeInsets.all(8.0),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          //   borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Text(
                          lasttransaction.status,
                          style: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
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
      ),
    );
  }
}
