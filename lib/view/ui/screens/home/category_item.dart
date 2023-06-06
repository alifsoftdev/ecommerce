import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constants/strings.dart';
import '../../../../helper/helper.dart';
import '../../../../states/model/category_model.dart';
import '../product_by_category/product_by_category_page.dart';

class CategoryItem extends StatelessWidget {
  //final CategoryListModel model;
  final CategoryModel model;

  //final String imageUrl;

  const CategoryItem({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 15, top: 10),
      child: InkWell(
        onTap: () {
          Get.toNamed(ProductByCategoryPage.routeName,
              arguments: [int.parse(model.id)]);
        },
        child: Column(
          children: [
            ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  fit: BoxFit.fill,
                  width: 53.w,
                  height: 52.h,
                  model.imageUrl,
                )

                // child: Image.asset(
                //   fit: BoxFit.fill,
                //   width: 50.w,
                //   height: 50.h,
                //   'assets/images/cat_img.png',
                // ),
                ),
            addH(5.h),
            Text(
              model.name,
              style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: ConstantStrings.kAppFont,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
