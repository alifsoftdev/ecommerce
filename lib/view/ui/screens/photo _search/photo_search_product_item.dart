import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/strings.dart';
import '../../../../states/model/image_search_model.dart';
import '../../widgets/custom_image_network.dart';
import '../../widgets/helper.dart';

class PhotoSearchProductItem extends StatelessWidget {
  PhotoSearchItem item;


  PhotoSearchProductItem( {super.key, required this.item,});

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
                  imageUrl: item.image.url,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 260,
                    child: Text(
                      item.name,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: ConstantStrings.kAppFont,
                      ),
                    ),
                  ),
                  addH(7.h),
                  Text(
                    'Price: AED ${item.priceRange.minimumPrice.finalPrice.value}',
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
