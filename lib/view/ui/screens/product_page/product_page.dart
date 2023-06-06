import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../states/controller/home_controller.dart';
import '../../../../states/controller/wishlist_controller.dart';
import '../../../../states/data/prefs.dart';
import '../../widgets/custom_app_titlebar.dart';
import '../../widgets/custom_local_search_box.dart';
import '../../widgets/custom_product_item.dart';
import '../../widgets/helper.dart';

class ProductPage extends StatefulWidget {
  static String routeName = '/product';

  const ProductPage({
    Key? key,
  }) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final HomeController _homeController = Get.find<HomeController>();
  final WishlistController _wishlistController = Get.find<WishlistController>();

  late String _userToken;
  String categoryTitle = 'Products';
  List<String> _cData = [];

  @override
  void initState() {
    super.initState();
    if (Get.arguments != null) {
      _cData = Get.arguments;
    }
    _userToken = Preference.getUserToken();
    if (_cData.isEmpty) {
      _homeController.getProductList(false);
    } else {
      categoryTitle = _cData.last;
      _homeController.getProductsByCategoryId(_cData.first);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addH(30.h),

                ///impl image slider
                SizedBox(
                  height: 150.h,
                  width: double.infinity.w,
                  child: Image.asset(
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: 180.h,
                    'assets/images/banner_img.png',
                  ),
                ),
                addH(10.h),
                CustomLocalSearchBox(
                  searchFn: (value) => _homeController.filterProductBS(value),
                ),
                addH(10.h),
                AppTitleBar(
                  title: categoryTitle,
                ),
                addH(10.h),
              ],
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 500.h,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
              ),
              child: Obx(() {
                if (_homeController.productByCategoryLoadingFlag.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (_homeController.productList == null ||
                      _homeController.searchItems.value.isEmpty) {
                    return const SizedBox(
                      height: 200,
                      child: Center(
                        child: Text('No data found'),
                      ),
                    );
                  } else {
                    return GridView.count(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 2.0,
                        childAspectRatio:
                            MediaQuery.of(context).size.height / (11 * 100),
                        children: List.generate(
                            _homeController.searchItems.value.length, (index) {
                          return SizedBox(child: Text("CustomProductItem"),);
                            /*CustomProductItem(
                            productModel:
                                _homeController.searchItems.value[index],
                            wishlistController: _wishlistController,
                            userToken: _userToken,
                          );*/
                        }));
                  }
                }
              }),
            ),
          ),
        ],
      ),
    );
  }
}
