import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kallukoshai/view/ui/screens/product_by_category/product_category_item.dart';

import '../../../../constants/colors.dart';
import '../../../../states/controller/home_controller.dart';
import '../../../../states/controller/store_controller.dart';
import '../../../../states/controller/wishlist_controller.dart';
import '../../../../states/data/prefs.dart';
import '../../../../states/model/product_model.dart';
import '../../widgets/custom_app_titlebar.dart';
import '../../widgets/custom_product_item.dart';
import '../../widgets/helper.dart';

class ProductByCategoryPage extends StatefulWidget {
  static String routeName = '/productByCategory';

  const ProductByCategoryPage({Key? key}) : super(key: key);

  @override
  State<ProductByCategoryPage> createState() => _ProductByCategoryPageState();
}

class _ProductByCategoryPageState extends State<ProductByCategoryPage> {
  final HomeController _homeController = Get.find<HomeController>();
  final StoreController _storeController = Get.find<StoreController>();
  final WishlistController _wishlistController = Get.find<WishlistController>();
  late String _usrToken;
  late String _adminToken;
  bool isFromTitleBar = false;
  List<Item> productItemList = [];

  @override
  void initState() {
    super.initState();
    int id = Get.arguments[0];
    _usrToken = Preference.getUserToken();
    _adminToken = Preference.getAdminToken();
    if (_adminToken.isNotEmpty) {
      print("admin token : $_adminToken");

      _homeController.getProductCategoryListByID(_adminToken, id);
      _homeController.getCategoryDetailsByID(_adminToken, id);
    }
    _storeController.getProductListByFurniture(id);
    print("category id : $id");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addH(10.h),
                Row(
                  children: [
                    Flexible(
                      flex: 6,
                      child: Container(
                        height: 60.h,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:
                                ConstantColors.lightGray, // red as border color
                          ),
                        ),
                        child: ListTile(
                          leading: const Icon(Icons.search),
                          title: TextField(
                            decoration: const InputDecoration(
                                hintStyle: TextStyle(
                                  fontSize: 12,
                                ),
                                hintText: 'I’m Looking for...',
                                border: InputBorder.none),
                            onChanged: (value) =>
                                _storeController.filterProduct(value),
                          ),
                          trailing: const Icon(Icons.tune),
                        ),
                      ),
                    ),
                    // addW(5.w),
                    // Flexible(
                    //   flex: 1,
                    //   child: InkWell(
                    //     onTap: (){
                    //       print('productItemList: ${productItemList.length}');
                    //     },
                    //     child: Container(
                    //       height: 60.h,
                    //       width: 70.w,
                    //       decoration: BoxDecoration(
                    //         border: Border.all(
                    //           color:
                    //               ConstantColors.lightGray, // red as border color
                    //         ),
                    //       ),
                    //       child: Padding(
                    //         padding: const EdgeInsets.all(12.0),
                    //         child: SvgPicture.asset(
                    //           'assets/svg/camera_enhance.svg',
                    //         ),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
                addH(30.h),
                Obx(() {
                  if (_homeController.pCategoryDetailsLoading.value) {
                    return const Center(child: Text(''));
                  } else {
                    if (_homeController.categoryDetailsResponseModel != null) {
                      return AppTitleBar(
                        title:
                            'Shop By ${_homeController.categoryDetailsResponseModel!.name}',
                      );
                    }

                    return const Center(child: Text(''));
                  }
                }),
                //  addH(10.h),
              ],
            ),
          ),
          addH(10.h),
          Obx(() {
            if (_homeController.pCategoryListLoading.value) {
              return const Center(child: Text(''));
            } else {
              if (_homeController.categoryList.isNotEmpty) {
                return SizedBox(
                  width: double.infinity,
                  height: 110.h,
                  child: ListView.builder(
                    itemCount: _homeController.categoryList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                          onTap: () {
                            setState(() {
                              /* _storeController.productListByLoadingFlag.value =
                                  false;*/
                              print(
                                  "sub category id ${_homeController.categoryList[index].id}");
                              Future.delayed(const Duration(milliseconds: 30),
                                  () async {
                                _storeController.getProductListByFurniture(
                                    _homeController.categoryList[index].id);
                                // Get.toNamed(LoginScreen.routeName);
                              });
                            });
                          },
                          child: ProductCategoryItem(
                            model: _homeController.categoryList[index],
                          ));
                    },
                  ),
                );
              } else {
                return const Center(child: Text(''));
              }
            }
          }),
          SizedBox(
            width: double.infinity,
            child: Obx(() {
              if (_storeController.productListByLoadingFlag.value) {
                return const Center(child: CircularProgressIndicator());
              } else {
                if (_storeController.productItems.value.isEmpty) {
                  return const Center(child: Text('No data found'));
                } else {
                  productItemList = _storeController.productItems.value;
                  return GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    crossAxisSpacing: 4.0,
                    mainAxisSpacing: 2.0,
                    childAspectRatio:
                        MediaQuery.of(context).size.height / (16.h * 100.h),
                    children: List.generate(productItemList.length, (index) {
                      return SizedBox(child: Text("CustomProductItem"),);
                        /*CustomProductItem(
                        productModel: productItemList[index],
                        wishlistController: _wishlistController,
                        userToken: _usrToken,
                      );*/
                    }),
                  );
                }
              }
            }),
          ),
        ],
      ),
    );
  }
}
