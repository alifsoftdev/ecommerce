import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/strings.dart';
import '../../../../states/model/category_list.dart';
import '../../widgets/helper.dart';

class ProductCategoryItem extends StatefulWidget {
  final CategoryListModel model;

  const ProductCategoryItem({Key? key, required this.model}) : super(key: key);

  @override
  State<ProductCategoryItem> createState() => _ProductCategoryItemState();
}

class _ProductCategoryItemState extends State<ProductCategoryItem> {
  String? imageUrl;

  @override
  void initState() {
    for (int i = 0; i < widget.model.customAttributes.length; i++) {
      if (widget.model.customAttributes[i].attributeCode == "image") {
        print("attributes== ${widget.model.customAttributes.length}");

        imageUrl = ConstantStrings.kSubCategoryImageUrl +
            widget.model.customAttributes[i].value;
        print("sub category image url $imageUrl");
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        height: 100.h,
        width: 100.w,
        decoration: BoxDecoration(
          border: Border.all(
            color: ConstantColors.lightGray, // red as border color
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: imageUrl == null
                  ? SvgPicture.asset(
                      'assets/svg/icon.svg',
                      height: 30.h,
                    )
                  : SizedBox(
                      height: 30.h,
                      child: Image.network(imageUrl!),
                    ),
              /* child: SvgPicture.asset(
                'assets/svg/icon.svg',
                height: 30.h,
              ),*/
            ),
            addH(3.h),
            Center(
              child: Text(
                widget.model.name,
                style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: ConstantStrings.kAppFont,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
