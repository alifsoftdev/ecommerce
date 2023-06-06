import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../../constants/colors.dart';
import '../../../../states/controller/wishlist_controller.dart';
import '../../../../states/data/prefs.dart';
import '../../widgets/custom_app_titlebar.dart';
import '../../widgets/helper.dart';

class WishlistScreen extends StatefulWidget {
  static String routeName = '/wishlist';

  String? title;

  WishlistScreen({Key? key, this.title}) : super(key: key);

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final WishlistController _wishlistController = Get.find<WishlistController>();

  late String _userToken;

  @override
  void initState() {
    super.initState();
    _userToken = Preference.getUserToken();
    _wishlistController.getWishlist(_userToken);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      /*    appBar: AppBar(
        toolbarHeight: 52.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const CustomTopBar(),
      ),*/
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 20.0,
            top: 30.0,
          ),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 180.h,
                    width: double.infinity.w,
                    child: Image.asset(
                      fit: BoxFit.fill,
                      width: double.infinity,
                      height: 180.h,
                      'assets/images/banner_img.png',
                    ),
                  ),
                  addH(10.h),
                  Row(
                    children: [
                      Flexible(
                        flex: 6,
                        child: Container(
                          height: 60.h,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: ConstantColors
                                  .lightGray, // red as border color
                            ),
                          ),
                          child: ListTile(
                            leading: const Icon(Icons.search),
                            title: TextField(
                                // controller: _editingController,
                                decoration: const InputDecoration(
                                    hintStyle: TextStyle(
                                      fontSize: 12,
                                    ),
                                    hintText: 'I’m Looking for...',
                                    border: InputBorder.none),
                                onChanged: (value) {}),
                            trailing: const Icon(Icons.tune),
                          ),
                        ),
                      ),
                      addW(5.w),
                      Flexible(
                        flex: 1,
                        child: Container(
                            height: 60.h,
                            width: 70.w,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: ConstantColors
                                    .lightGray, // red as border color
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: SvgPicture.asset(
                                'assets/svg/camera_enhance.svg',
                              ),
                            )),
                      ),
                    ],
                  ),
                  addH(10.h),
                  const AppTitleBar(
                    title: 'MY WISH LIST',
                  ),
                  addH(10.h),
                ],
              ),
              Obx(() {
                if (_wishlistController.getWishlistLoadingFlag.value) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (_wishlistController.wishlistModel == null ||
                      _wishlistController.wishlistModel!.items.isEmpty) {
                    return const Text('No data found');
                  } else {
                    return SizedBox(
                      height: 500.h,
                      child: GridView.count(
                          shrinkWrap: true,
                          primary: false,
                          crossAxisCount: 2,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 2.0,
                          childAspectRatio:
                              MediaQuery.of(context).size.height / (11 * 100),
                          children: List.generate(
                              _wishlistController.wishlistModel!.items.length,
                              (index) {
                            return SizedBox(child: Text("CustomProductItem"),);
                              /*CustomWishlistItem(
                              wishlistModel: _wishlistController
                                  .wishlistModel!.items[index],
                              userToken: _userToken,
                              wishlistController: _wishlistController,
                            );*/
                          })),
                    );
                  }
                }
              }),
/*
            SizedBox(
                width: double.infinity,
                height: 800.h,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Obx(() {
                    if (_homeController.pListLoading.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      if (_homeController.productList == null ||
                          _homeController.productList!.items.isEmpty) {
                        return const Text('No data found');
                      } else {
                        return GridView.count(
                            crossAxisCount: 2,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 2.0,
                            childAspectRatio:
                                MediaQuery.of(context).size.height / (11 * 100),
                            children: List.generate(
                                _homeController.productList!.items.length, (index) {
                              return CustomProductItem(
                                productModel:
                                    _homeController.productList!.items[index], wishlistController: _wishlistController, userToken:_userToken,
                              );
                            }));
                      }
                    }
                  }),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
