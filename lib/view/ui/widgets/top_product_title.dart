import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../constants/strings.dart';
import '../screens/product_by_category/product_by_category_page.dart';
import '../screens/product_page/product_page.dart';

class TopProductTitle extends StatelessWidget {
 final String title;
 int? id;
  TopProductTitle({Key? key, required this.title, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity.w,
      height: 50.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
                fontFamily: ConstantStrings.kAppFont,
                fontWeight: FontWeight.bold,
                fontSize: 20.sp),
          ),
          TextButton(
            onPressed: () {
              if(id  !=null){
                Get.toNamed(
                    ProductByCategoryPage.routeName,
                    arguments: [
                     id
                    ]);
              }
              else{
                Get.toNamed(ProductPage.routeName,arguments: [title]);
              }
            },
            child: Text(
              'View all',
              style: TextStyle(
                fontSize: 13.sp,
                color: Colors.amber.shade800,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
