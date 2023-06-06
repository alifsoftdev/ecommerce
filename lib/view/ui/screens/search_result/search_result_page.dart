import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kallukoshai/view/ui/screens/search_result/serch_product_item.dart';
import '../../../../constants/strings.dart';
import '../../../../helper/helper.dart';
import '../../../../states/controller/home_controller.dart';
import '../../widgets/custom_local_search_box.dart';
import '../my_cart/my_cart_page.dart';

class SearchResultPage extends StatefulWidget {
  static String routeName = '/searchResult';

  const SearchResultPage({Key? key}) : super(key: key);

  @override
  State<SearchResultPage> createState() => _SearchResultPageState();
}

class _SearchResultPageState extends State<SearchResultPage> {
  final HomeController _homeCon = Get.find<HomeController>();

  @override
  void initState() {
    String queryText = Get.arguments[0];
    _homeCon.searchProduct(queryText: queryText);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            addH(30.h),
            SizedBox(
              height: 60.h,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: 50.h,
                    width: 50.w,
                    child: IconButton(
                      onPressed: () {},
                      icon: SvgPicture.asset(
                        'assets/svg/menu.svg',
                        height: 50.h,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50.h,
                    width: 200.w,
                    child: SvgPicture.asset(
                      'assets/svg/logo.svg',
                      height: 40.h,
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                    width: 20.w,
                    child: SvgPicture.asset(
                      'assets/svg/favorite.svg',
                      height: 20.h,
                      width: 20.w,
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                    width: 30.w,
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(MyCartPage.routeName);
                      },
                      child: SvgPicture.asset(
                        'assets/svg/cart.svg',
                        height: 30.h,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomLocalSearchBox(
                searchFn: (value) => _homeCon.filterProduct(value),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  const Icon(
                    Icons.tune,
                    size: 20,
                  ),
                  addW(10.w),
                  Text(
                    'Filter',
                    style: TextStyle(
                      fontFamily: ConstantStrings.kAppFont,
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 670.h,
              width: double.infinity,
              child: Obx(() {
                if (_homeCon.searchProductLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.yellow,
                    ),
                  );
                } else {
                  if (_homeCon.searchModel != null) {
                    return ListView.builder(
                        scrollDirection: Axis.vertical,
                        physics: const ClampingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: _homeCon.searchProductItems.value.length,
                        itemBuilder: (context, index) {
                          return SearchProductItem(
                            searchItem:
                                _homeCon.searchProductItems.value[index],
                          );
                        });
                  } else {
                    return const Center(
                      child: Text('No product found!'),
                    );
                  }
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}
