import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/strings.dart';
import '../../../../states/model/cart_item_list_model.dart';
import '../../widgets/custom_image_network.dart';
import '../../widgets/helper.dart';

class CartItem extends StatefulWidget {
  final CartItemsListModel cartItem;
  final VoidCallback deleteFn;
  final void Function(bool) updateFn;

  const CartItem({
    Key? key,
    required this.cartItem,
    required this.deleteFn,
    required this.updateFn,
  }) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 110.h,
                width: 110.w,
                color: Colors.white,
                child: CustomImageNetwork(
                    imageUrl: widget.cartItem.extensionAttributes.imageUrl),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 20.h,
                    width: 210.w,
                    child: Text(
                      widget.cartItem.name,
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: ConstantStrings.kAppFont,
                      ),
                      maxLines: 1,
                    ),
                  ),
                  addH(10.h),
                  Text(
                    widget.cartItem.price.toString(),
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.bold,
                      fontFamily: ConstantStrings.kAppFont,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:
                              ConstantColors.lightGray, // red as border color
                        ),
                      ),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if (widget.cartItem.qty > 1) {
                                widget.updateFn(false);
                              }
                            },
                            child: SizedBox(
                              height: 30.h,
                              width: 30.w,
                              child: Center(
                                child: Text(
                                  '-',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    color: Colors.black26,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          addW(5.h),
                          const VerticalDivider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.cartItem.qty.toString(),
                              style: TextStyle(fontSize: 16.sp),
                            ),
                          ),
                          const VerticalDivider(),
                          InkWell(
                            onTap: () {
                              widget.updateFn(true);
                            },
                            child: SizedBox(
                              height: 30.h,
                              width: 30.w,
                              child: Center(
                                child: Text(
                                  '+',
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    color: Colors.black26,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      widget.deleteFn();
                    },
                    child: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                  addH(20.h),
                  InkWell(
                    onTap: () {
                      // DialogHelper.showConfirmDialog(
                      //     rightBtnPressed: () {
                      //       _addToCartController.removeFromCart(widget.cartItem.cartId);
                      //
                      //       Get.defaultDialog(
                      //           title: 'Processing..',
                      //           content:  Obx(() {
                      //             if (_addToCartController.removeFromCartLoadingFlag.value) {
                      //               return const Center(child: CircularProgressIndicator());
                      //             } else {
                      //               if (_addToCartController.response != null) {
                      //                 Future.delayed(const Duration(seconds: 1), () async {
                      //                   _storeController.getCartList(Preference.getUserIdFlag().toString());
                      //                   Get.back();
                      //                   Get.back();
                      //                 });
                      //                 return const Text('Successfully Deleted');
                      //               } else {
                      //                 return Column(
                      //                   children: [
                      //                     const Text('Loading... failed'),
                      //                     addH(20.h),
                      //                     CustomBtn(
                      //                       btnFn: () {
                      //                         Get.back();
                      //                         _storeController.getCartList(Preference.getUserIdFlag().toString());
                      //                       },
                      //                       btnText: 'Try Again',
                      //                       btnBgClr: Colors.green,
                      //                       btnSize: Size(120.w, 40.h),
                      //                     )
                      //                   ],
                      //                 );
                      //               }
                      //             }
                      //           }),
                      //           radius: 10.0);
                      //     }, leftBtnPressed: () {
                      //   if (Get.isDialogOpen!) Get.back();
                      // });
                    },
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.black26,
                    ),
                  ),
                  addH(20.h),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
