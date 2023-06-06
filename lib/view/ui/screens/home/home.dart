import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kallukoshai/view/ui/screens/home/select_photo_options_screen.dart';
import '../../../../constants/colors.dart';
import '../../../../states/controller/home_controller.dart';
import '../../../../states/controller/login_controller.dart';
import '../../../../states/controller/my_cart_controller.dart';
import '../../../../states/controller/profile_controller.dart';
import '../../../../states/controller/store_controller.dart';
import '../../../../states/controller/wishlist_controller.dart';
import '../../../../states/data/prefs.dart';
import '../../../../states/utils/methods.dart';
import '../../widgets/custom_bottom_navigation.dart';
import '../../widgets/custom_drawer.dart';
import '../../widgets/custom_product_item.dart';
import '../../widgets/helper.dart';
import '../../widgets/top_product_title.dart';
import '../my_cart/my_cart_page.dart';
import '../photo _search/photo_search_result.dart';
import '../product_by_category/product_by_category_page.dart';
import '../wish_list/wish_list_screen.dart';
import 'dart:io';
import 'category_item.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  final int _selectedNavIndex = 2;
  final MyCartController myCartController = Get.put(MyCartController());
  final HomeController _homeCon = Get.put(HomeController());
  final LoginController _loginController = Get.put(LoginController());
  final MyCartController _myCartController = Get.find<MyCartController>();
  final WishlistController _wishlistController = Get.put(WishlistController());
  final StoreController _storeController = Get.put(StoreController());
  final ProfileController _pCon = Get.put(ProfileController());
  final TextEditingController searchCon = TextEditingController();

  late String _usrToken;

  late PageController _pageController;
  int activePage = 1;

  @override
  void initState() {
    super.initState();
    _usrToken = Preference.getUserToken();

    Future.delayed(Duration.zero, () {
      _homeCon.getProductList(true);
      _homeCon.getBannerList();
      _homeCon.getCategoriesList();
      _storeController.getBestSellerProductList();
      _storeController.getRecommendedProductList();
      _storeController.getNewItemsList();
      _storeController.getTrendyItemsList();
      _storeController.getSameDayProductList();
    });

    if (_usrToken.isNotEmpty) {
      _myCartController.getCartQuoteCode(_usrToken);
      _pCon.getProfileDetails(_usrToken, "", false);
    }
    _pageController = PageController(
      viewportFraction: 0.8,
      initialPage: 1,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawerEnableOpenDragGesture: true,
      drawer: CustomDrawer(
        scaffoldKey: scaffoldKey,
      ),
      body: ListView(
        children: [
          openDrawer(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    searchBar(context),
                    addH(15.h),

                    sliderMethod(context),

                     //indicator

                    //slider(activePage)
                  ],
                ),
                // categories

                //categoriesObx(),

                TopProductTitle(
                  title: 'Best Seller',
                  id: 259,
                ),
                addH(10.h),
                SizedBox(
                  width: double.infinity,
                  height: 250.h,
                  /*child: Obx(
                    () {
                      if (_storeController.bestSellerLoadingFlag.value) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {
                        if (_storeController.bestSellerItemsList == null ||
                            _storeController
                                .bestSellerItemsList!.items.isEmpty) {
                          return const Center(child: Text('No data found'));
                        } else {
                          return ListView.builder(
                            itemCount: _storeController
                                .bestSellerItemsList!.items.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return SizedBox(child: Text("CustomProductItem"),);
                                /*CustomProductItem(
                                productModel: _storeController
                                    .bestSellerItemsList!.items[index],
                                wishlistController: _wishlistController,
                                userToken: _usrToken,
                              );*/
                            },
                          );
                        }
                      }
                    },
                  ),*/
                ),
                addH(10.h),
                // image slider
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
                addH(15.h),

                TopProductTitle(
                  title: 'Recommended for you',
                  id: 257,
                ),

                addH(10.h),
                SizedBox(
                  width: double.infinity,
                  height: 250.h,
                  /* child: Obx(() {
                      if (_storeController
                          .recommendedProductsLoadingFlag.value) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if (_storeController.recommendedProductList != null) {
                          if (_storeController
                              .recommendedProductList!.items.isEmpty) {
                            return const Center(child: Text('No data found'));
                          } else {
                            return ListView.builder(
                              itemCount: _storeController
                                  .recommendedProductList!.items.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return SizedBox(child: Text("CustomProductItem"),);
                                  /*CustomProductItem(
                                  productModel: _storeController
                                      .recommendedProductList!.items[index],
                                  wishlistController: _wishlistController,
                                  userToken: _usrToken,
                                );*/
                              },
                            );
                          }
                        } else {
                          return const Center(child: Text('No data found'));
                        }
                      }
                    }
                    )*/
                ),
                TopProductTitle(
                  title: 'Same Day Delivery',
                  id: 260,
                ),
                addH(10.h),
                SizedBox(
                  width: double.infinity,
                  height: 250.h,
                  /*child: Obx(() {
                      if (_storeController.sameDayDeliveryLoadingFlag.value) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if (_storeController.sameDayProductList == null ||
                            _storeController
                                .sameDayProductList!.items.isEmpty) {
                          return const Center(child: Text('No data found'));
                        } else {
                          return ListView.builder(
                            itemCount: _storeController
                                .sameDayProductList!.items.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (BuildContext context, int index) {
                              return SizedBox(child: Text("CustomProductItem"),);
                                /*CustomProductItem(
                                productModel: _storeController
                                    .sameDayProductList!.items[index],
                                wishlistController: _wishlistController,
                                userToken: _usrToken,
                              );*/
                            },
                          );
                        }
                      }
                    })*/
                ),

                addH(10.h),

                ///impl image slider
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
                addH(15.h),

                TopProductTitle(
                  title: 'Trendy Items',
                  id: 258,
                ),

                addH(10.h),
                SizedBox(
                  width: double.infinity,
                  height: 250.h,
                  /*child: Obx(() {
                      if (_storeController.trendyItemsLoadingFlag.value) {
                        return const Center(child: CircularProgressIndicator());
                      } else {
                        if (_storeController.trendyItemsList != null) {
                          if (_storeController.trendyItemsList!.items.isEmpty) {
                            return const Center(child: Text('No data found'));
                          } else {
                            return ListView.builder(
                              itemCount: _storeController
                                  .trendyItemsList!.items.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return SizedBox(child: Text("CustomProductItem"),);
                                  /*CustomProductItem(
                                  productModel: _storeController
                                      .trendyItemsList!.items[index],
                                  wishlistController: _wishlistController,
                                  userToken: _usrToken,
                                );*/
                              },
                            );
                          }
                        } else {
                          return const Center(child: Text('No data found'));
                        }
                      }
                    })*/
                ),

                TopProductTitle(
                  title: 'New In Store',
                  id: 78,
                ),

                addH(10.h),

                SizedBox(
                  width: double.infinity,
                  height: 250.h,
                  /*child: Obx(() {
                    if (_storeController.newItemsLoadingFlag.value) {
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      if (_storeController.newItemsList == null ||
                          _storeController.newItemsList!.items.isEmpty) {
                        return const Center(child: Text('No data found'));
                      } else {
                        return ListView.builder(
                          itemCount:
                              _storeController.newItemsList!.items.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return SizedBox(child: Text("CustomProductItem"),);
                              /*CustomProductItem(
                              productModel:
                                  _storeController.newItemsList!.items[index],
                              wishlistController: _wishlistController,
                              userToken: _usrToken,
                            );*/
                          },
                        );
                      }
                    }
                  }),*/
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigation(
        selectedNavIndex: _selectedNavIndex,
      ),
    );
  }

  Obx categoriesObx() {
    return Obx(
      () {
        if (_homeCon.categoriesListLoadingFlag.value) {
          return SizedBox(
            height: 100.h,
            child: const Center(
              child: CircularProgressIndicator(
                  //  color: Colors.yellow,
                  ),
            ),
          );
        } else {
          if (_homeCon.categoryModelList != null) {
            return SizedBox(
              height: 100.h,
              width: double.infinity,
              child: Stack(
                children: [
                  ListView.builder(
                    itemCount: _homeCon.categoryModelList!.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) {
                      return CategoryItem(
                        model: _homeCon.categoryModelList![index],
                        // imageUrl: _homeCon.categoryModelList![index].imageUrl,
                      );
                    },
                  ),
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
    );
  }

  Obx sliderMethod(BuildContext context) {
    return Obx(() {
      if (_homeCon.bannerListLoading.value) {
        return SizedBox(
          height: 180.h,
          child: const Center(
            // child: Text(''),
            child: CircularProgressIndicator(
                // color: Colors.yellow,
                ),
          ),
        );
      } else {
        if (_homeCon.bannerModelList != null) {
          return Column(
            children: [
              SizedBox(
                height: 180.h,
                width: MediaQuery.of(context).size.width,
                child: PageView.builder(
                    itemCount: _homeCon.bannerModelList!.length,
                    // itemCount: images.length,
                    pageSnapping: true,
                    controller: _pageController,
                    onPageChanged: (page) {
                      setState(() {
                        activePage = page;
                      });
                    },
                    itemBuilder: (context, pagePosition) {
                      bool active = pagePosition == activePage;
                      // return slider(images,pagePosition,active);
                      return InkWell(
                        onTap: () {
                          Get.toNamed(ProductByCategoryPage.routeName,
                              arguments: [
                                int.parse(
                                    _homeCon.bannerModelList![pagePosition].id)
                              ]);
                        },
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          child: Image.network(
                            _homeCon.bannerModelList![pagePosition].imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:
                    indicators(_homeCon.bannerModelList!.length, activePage),
              ),
            ],
          );
        } else {
          return const Center(
            child: Text('No banners found!'),
          );
        }
      }
    });
  }

  Widget searchBar(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: ConstantColors.lightGray)),
        child: InkWell(
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: SizedBox(
                  width: 180.w,
                  child: TextField(
                    controller: searchCon,
                    style: TextStyle(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.normal,
                    ),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "search your product",
                      // hintText: '${LocaleKeys.app_bar.tr}',
                    ),
                    onChanged: (value) {
                      /*  if (value == '') {
                                  setState(() {
                                    searchValue = value;
                                  });
                                } else {
                                  setState(() {
                                    searchValue = value;
                                    Get.toNamed(SearchScreen.routeName,
                                        arguments: [searchValue]);
                                    widget.productCon.getSearchProduct(value);
                                    searchValue = '';
                                  });
                                }*/
                      searchCon.clear();
                      // showSearch(
                      //     context: context,
                      //     // delegate to customize the search bar
                      //     delegate: CustomSearchDelegate()
                      // );
                      /// widget.productCon.getSearchAllProducts( q: "cool");
                    },
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  /* Get.toNamed(SearchScreen.routeName,
                                arguments: [searchValue]);*/
                  searchCon.clear();
                  // method to show the search bar
                  ///  widget.productCon.getSearchAllProducts( q: "cool");

                  // showSearch(
                  //     context: context,
                  //     // delegate to customize the search bar
                  //     delegate: CustomSearchDelegate()
                  // );
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: const BorderRadius.only(
                        topRight: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0)),
                    color: Colors.black,
                  ),
                  height: 52.h,
                  width: 53.h,
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  SizedBox openDrawer() {
    return SizedBox(
      height: 60.h,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 50.h,
            width: 50.w,
            child: IconButton(
              onPressed: () {
                scaffoldKey.currentState!.openDrawer();
              },
              icon: SvgPicture.asset(
                'assets/svg/menu.svg',
                height: 50.h,
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
            width: 200.w,
            child: Image.asset(
              'assets/images/home_icon.png',
              scale: 2,
            ),
          ),
          SizedBox(
            height: 20.h,
            width: 20.w,
            child: InkWell(
              onTap: () {
                if (_usrToken.isNotEmpty) {
                  Get.toNamed(
                    WishlistScreen.routeName,
                  );
                } else {
                  Methods.showSnackbar(
                    msg: 'You must login first!',
                  );
                }

                /*  Get.toNamed(ProductPage.routeName,
                        arguments: ["Favourite"]);*/
              },
              child: SvgPicture.asset(
                'assets/svg/favorite.svg',
                height: 20.h,
                width: 20.w,
              ),
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
    );
  }

  AnimatedContainer slider(images, pagePosition, active) {
    double margin = active ? 10 : 20;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(images[pagePosition]))),
    );
  }

  imageAnimation(PageController animation, images, pagePosition) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, widget) {
        print(pagePosition);

        return SizedBox(
          width: 200,
          height: 200,
          child: widget,
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        child: Image.network(images[pagePosition]),
      ),
    );
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: const EdgeInsets.all(3),
        width: 10,
        height: 10,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.black : Colors.black26,
            shape: BoxShape.circle),
      );
    });
  }

  void _addToWishlist(int index) {
    if (_usrToken.isNotEmpty) {
      _wishlistController.addToWishlist(
          _homeCon.homeProductList!.items[index].id.toString(), _usrToken);
    } else {
      Methods.showSnackbar(
        msg: 'You must login first!',
      );
    }
  }

  ImagetoBase64() async {
    // path of image
    String imagePath = "assets/gfglogo.png";
    File imageFile = File(imagePath);

    // Read bytes from the file object
    Uint8List bytes = await imageFile.readAsBytes();

    // base64 encode the bytes
    String base64String = base64.encode(bytes);
    setState(() {});
  }

  Future _pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;
      File? img = File(image.path);
      img = await _cropImage(imageFile: img);

      Uint8List bytes = await img!.readAsBytes();

      // base64 encode the bytes
      String base64String = base64.encode(bytes);

      setState(() {
        Get.offNamed(PhotoSearchResult.routeName, arguments: [base64String]);
      });
    } on PlatformException catch (e) {
      print(e);
      Navigator.of(context).pop();
    }
  }

  Future<File?> _cropImage({required File imageFile}) async {
    CroppedFile? croppedImage =
        await ImageCropper().cropImage(sourcePath: imageFile.path);
    if (croppedImage == null) return null;
    return File(croppedImage.path);
  }

  void _showSelectPhotoOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(25.0),
        ),
      ),
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.28,
          maxChildSize: 0.4,
          minChildSize: 0.28,
          expand: false,
          builder: (context, scrollController) {
            return SingleChildScrollView(
              controller: scrollController,
              child: SelectPhotoOptionsScreen(
                onTap: _pickImage,
              ),
            );
          }),
    );
  }
}
