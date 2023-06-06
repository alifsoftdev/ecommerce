import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../constants/strings.dart';
import '../../../states/controller/wishlist_controller.dart';
import '../../../states/model/cart_id_response_model.dart';
import '../screens/product_details/product_details_page.dart';
import 'custom_favourite_icon.dart';
import 'custom_image_network.dart';
import 'helper.dart';

class CustomProductItem extends StatelessWidget {
  final Item productModel;
  // VoidCallback? addToWishlist;
  WishlistController wishlistController;
  String userToken;

  CustomProductItem({
    Key? key,
    required this.productModel,
    // this.addToWishlist,
    required this.wishlistController,
    required this.userToken,
  }) : super(key: key);

  // final StoreController _storeController=Get.put(StoreController());
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {},
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10.w),
          width: 168.w,
          height: 260.h,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addH(30.h),
                  Center(
                    child: SizedBox(
                        height: 120.h,
                        width: 130.w,
                        child: CustomImageNetwork(
                          imageUrl: ''
                          /*  imageUrl: ConstantStrings.kImageUrl +
                              productModel.mediaGalleryEntries[0].file*/
                          ,
                        )),
                  ),
                  Center(
                    child: Text(
                      "productModel.name",
                      style: TextStyle(
                        fontFamily: ConstantStrings.kAppFont,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.0.sp,
                      ),
                    ),
                  ),
                  addH(5.h),
                  Center(
                    child: Text(
                      "AED ",
                      style: TextStyle(
                        color: HexColor("#838383"),
                        fontFamily: ConstantStrings.kAppFont,
                        fontSize: 12.sp,
                      ),
                    ),
                  ),
                  Center(
                    child: RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemSize: 15,
                      itemCount: 5,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        // print(rating);
                      },
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 5,
                right: 0,
                child: FavouriteIcon(
                  onTapFn: () {
                    /*print("initial ${productModel.isWishlisted}");
                    if (productModel.isWishlisted) {
                      // remove the item from wishlist
                      wishlistController.removeFromWishlist(
                          productModel.id, userToken);
                      productModel.isWishlisted = false;
                      /*  if (wishlistController.isFavourite) {
                            productModel.isWishlisted = false;
                          }
*/
                      print("after removal ${productModel.isWishlisted}");
                    } else {
                      wishlistController.addToWishlist(
                          productModel.id.toString(), userToken);
                      productModel.isWishlisted = true;
                      /* if (wishlistController.isFavourite) {
                            productModel.isWishlisted = true;
                          }*/
                      print("after addition ${productModel.isWishlisted}");
                    }
                    //productModel.isWishlisted = !productModel.isWishlisted;*/
                  },
                  initialValue: false,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
