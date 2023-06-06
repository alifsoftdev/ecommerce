import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../constants/strings.dart';
import '../../../constants/colors.dart';
import '../../../helper/helper.dart';
import '../../../states/model/payee_list_response_model.dart';

class PayeeItem extends StatefulWidget {
  Addedpayeeslist payeeItem;
  VoidCallback deleteTap;

  PayeeItem({
    required this.payeeItem,
    required this.deleteTap,
    super.key,
  });

  @override
  State<StatefulWidget> createState() => _PayeeItemState();
}

class _PayeeItemState extends State<PayeeItem> {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      width: double.infinity,
      height: 93,
      margin: const EdgeInsets.only(
        left: 2.0,
        top: 5.0,
      ),
      decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(5.0),
        border: Border.all(
          color: ConstantColors.lightGray,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // addH(10.h),

              SizedBox(
                width: Get.width * 0.48,
                //  height: 30,
                child: Text(
                  maxLines: 2,
                  // supplierCurrentOrders.productName??'',
                  widget.payeeItem.nickName,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: ConstantStrings.kAppFont),
                ),
              ),
              addH(15.h),
              SizedBox(
                width: Get.width * 0.48,
                //  height: 30,
                child: Text(
                  widget.payeeItem.emailAddress,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                      fontFamily: ConstantStrings.kAppFont),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /*  Image.asset(
                    'assets/images/edit_address.png',
                  ),*/
                  Container(
                    padding: const EdgeInsets.all(6.0),
                    child: const Icon(
                      Icons.edit,
                      size: 18,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      widget.deleteTap();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(6.0),
                      child: const Icon(
                        Icons.delete,
                        size: 18,
                        //  color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
              addH(5.h),
              Container(
                padding: const EdgeInsets.all(8.0),
                decoration: const BoxDecoration(
                  color: Colors.red,
                  //   borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  widget.payeeItem.status,
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
        ],
      ),
    );
  }
}
