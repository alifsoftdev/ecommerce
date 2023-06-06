import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../states/controller/home_controller.dart';
import '../../widgets/custom_app_titlebar.dart';
import '../../widgets/helper.dart';

import '../home/category_item.dart';

class ShopByDepartmentPage extends StatefulWidget {
  static String routeName = '/shop_by_department';

  const ShopByDepartmentPage({Key? key}) : super(key: key);

  @override
  State<ShopByDepartmentPage> createState() => _ShopByDepartmentPageState();
}

class _ShopByDepartmentPageState extends State<ShopByDepartmentPage> {
  final HomeController _homeController = Get.find<HomeController>();
  bool isFromTitleBar = false;

  @override
  void initState() {
    super.initState();
    _homeController.getDepartmentList();
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
                const AppTitleBar(
                  title: 'Shop By Department',
                ),

                addH(30.h),

                Obx(
                  () {
                    if (_homeController.departmentListLoadingFlag.value) {
                      return const Center(
                        child: CircularProgressIndicator(
                            //  color: Colors.yellow,
                            ),
                      );
                    } else {
                      if (_homeController.departmentModelList != null) {
                        return SizedBox(
                          height: Get.height - 100,
                          width: double.infinity,
                          child: Stack(
                            children: [
                              GridView.count(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 4.0,
                                  mainAxisSpacing: 2.0,
                                  childAspectRatio:
                                      MediaQuery.of(context).size.height /
                                          (8.h * 100.h),
                                  children: List.generate(
                                      _homeController.departmentModelList!
                                          .length, (index) {
                                    // _homeController.productList!.items.length, (index) {
                                    return CategoryItem(
                                      model: _homeController
                                          .departmentModelList![index],
                                      // imageUrl: _homeCon.categoryModelList![index].imageUrl,
                                    );
                                  })),
                            ],
                          ),
                        );
                      } else {
                        return const Center(
                          child: Text('No Category Found!'),
                        );
                      }
                    }
                  },
                ),

                //  addH(10.h),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
