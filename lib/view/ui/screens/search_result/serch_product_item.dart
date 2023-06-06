import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/strings.dart';

import '../../../../states/model/search_model.dart';
import '../../widgets/custom_image_network.dart';
import '../../widgets/helper.dart';

class SearchProductItem extends StatelessWidget {
  final SearchItem searchItem;
  // final VoidCallback totalFn;

  const SearchProductItem({
    Key? key,
    required this.searchItem,
    // required this.totalFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Row(
            children: [
              Container(
                height: 80.h,
                width: 100.w,
                color: Colors.white,
                padding: const EdgeInsets.all(8),
                child:  CustomImageNetwork(
                  imageUrl: searchItem.mediaGalleryEntries.isNotEmpty?ConstantStrings.kImageUrl +
                      searchItem.mediaGalleryEntries[0].file:''
                  /*  imageUrl: ConstantStrings.kImageUrl +
                              productModel.mediaGalleryEntries[0].file*/,
                ),
                // child: Image.asset(
                //   fit: BoxFit.fill,
                //   'assets/images/product_image.png',
                // ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    searchItem.name,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: ConstantStrings.kAppFont,
                    ),
                  ),
                  addH(7.h),
                  Text(
                   'Price: AED ${searchItem.price}',
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontFamily: ConstantStrings.kAppFont,
                    ),
                  ),
                  addH(7.h),
                  Row(
                    children: [
                      const Icon(Icons.favorite_border,size: 15,),
                      addW(20.w),
                      const Icon(Icons.star,size: 15,color: Colors.red,),
                      addW(5.w),
                      Text(
                        '4.5',
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontFamily: ConstantStrings.kAppFont,
                        ),
                      ),

                    ],
                  ),
                  addH(10.h),

                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
