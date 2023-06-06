import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../constants/strings.dart';
import '../../../../helper/helper.dart';
import '../../../../states/model/rewards_history_response_model.dart';

class RewardsHistoryItem extends StatelessWidget {
  final RewardsHistoryResponseModel rewardsHistoryItem;

  const RewardsHistoryItem({
    super.key,
    required this.rewardsHistoryItem,
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
                  width: Get.width - 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: Get.width - 60,
                        child: Text(
                          maxLines: 2,
                          '${rewardsHistoryItem.comment} ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: ConstantStrings.kAppFont),
                        ),
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
                          Row(
                            children: [
                              Text(
                                'Points:',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: ConstantStrings.kAppFont),
                              ),
                              getPointsText(),
                              /*    Text(
                                ' ${rewardsHistoryItem.amount}',
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: ConstantStrings.kAppFont),
                              ),*/
                            ],
                          ),
                          addH(5.h),
                          Text(
                            'Created at:   ${getCreatedDateDifference(rewardsHistoryItem.createdAt)}',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal,
                                fontFamily: ConstantStrings.kAppFont),
                          ),
                          Text(
                            rewardsHistoryItem.expiresAt != null
                                ? 'Status description:   ${getExpiryDateDifference(rewardsHistoryItem.expiresAt)}'
                                : '',
                            style: TextStyle(
                              fontSize: 16.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.normal,
                              fontFamily: ConstantStrings.kAppFont,
                            ),
                          ),
                        ],
                      ),
                      //  Spacer(),
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

  String getCreatedDateDifference(String dateString) {
    String diff = '';
    var parsedDate = DateTime.parse(dateString);
    final currentDate = DateTime.now();
    final difference = daysBetween(parsedDate, currentDate);
    diff = '$difference days ago ';
    return diff;
  }

  String getExpiryDateDifference(String dateString) {
    String diff = '';
    var parsedDate = DateTime.parse(dateString);
    final currentDate = DateTime.now();
    final difference = daysBetween(currentDate, parsedDate);
    if (difference < 0) {
      diff = "Expired";
    } else {
      diff = 'Will expire in $difference days ';
    }
    return diff;
  }

  int daysBetween(DateTime from, DateTime to) {
    from = DateTime(from.year, from.month, from.day);
    to = DateTime(to.year, to.month, to.day);
    return (to.difference(from).inHours / 24).round();
  }

  Widget getPointsText() {
    if (rewardsHistoryItem.amount < 0) {
      return Text(
        ' ${rewardsHistoryItem.amount}',
        style: TextStyle(
            color: Colors.red,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
            fontFamily: ConstantStrings.kAppFont),
      );
    } else {
      return Text(
        ' +${rewardsHistoryItem.amount}',
        style: TextStyle(
            color: Colors.green,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
            fontFamily: ConstantStrings.kAppFont),
      );
    }
  }
}
