import 'dart:convert';
import 'package:flutter_html/flutter_html.dart';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/strings.dart';
import '../../../../states/controller/home_controller.dart';
import '../../../../states/controller/my_cart_controller.dart';
import '../../../../states/controller/store_controller.dart';
import '../../../../states/controller/wishlist_controller.dart';
import '../../../../states/data/prefs.dart';
import '../../../../states/model/add_to_cart_model.dart';
import '../../../../states/model/sample_product_status_model.dart';
import '../../widgets/custom_bottom_navigation.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/custom_drawer.dart';
import '../../widgets/custom_favourite_icon.dart';
import '../../widgets/custom_product_item.dart';
import '../../widgets/helper.dart';
import '../../widgets/html_text.dart';
import '../../widgets/top_product_title.dart';
import '../login/login.dart';
import '../my_cart/my_cart_page.dart';

class ProductDetailsPage extends StatefulWidget {
  static String routeName = '/productDetails';

  const ProductDetailsPage({Key? key}) : super(key: key);

  @override
  State<ProductDetailsPage> createState() => _ProductDetailsPageState();
}

class _ProductDetailsPageState extends State<ProductDetailsPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  final HomeController _homeController = Get.find<HomeController>();
  final StoreController _storeController = Get.find<StoreController>();
  final MyCartController _myCartController = Get.find<MyCartController>();
  final WishlistController _wishlistController = Get.find<WishlistController>();

  late String _usrToken;
  late String _guestToken;
  late String _adminToken;
  bool _loginFlag = false;

  var sku;
  var productId;
  late bool isWishlisted;
  String sampleProductName = '';
  String sampleProductSku = '';
  String? features;
  String? description;
  String? specifications;

  //late Item productModel;

  late PageController _pageController;
  int activePage = 1;

  bool isDes = false;
  bool isSpec = false;
  bool isSampleAvailable = false;
  var result;

  var responseString;
  final int _selectedNavIndex = 2;
  dynamic argumentData;

  @override
  void initState() {
    super.initState();
    _usrToken = Preference.getUserToken();
    _adminToken = Preference.getAdminToken();

    sku = Get.arguments[0];
    isWishlisted = Get.arguments[1];
    productId = Get.arguments[2];

    //call product details api
    _storeController.getProductDetails(sku);
    _pageController = PageController(viewportFraction: 0.8, initialPage: 1);
    _loginFlag = Preference.getLoggedInFlag();

    if (_usrToken.isNotEmpty) {
      _myCartController.getCartQuoteCode(_usrToken);
      _myCartController.getMyCartItems(_usrToken, _loginFlag);
    }
    Product product = Product(id: productId,);

    SampleProductStatusModel sampleProductStatusModel =
        SampleProductStatusModel(product: product);
    _storeController.getSampleProductStatus(
        sampleProductStatusModel, _adminToken);

    _myCartController.addToCartLoadingFlag.listen((value) {
      if (!value && _myCartController.isAddedToCart) {
        if (_myCartController.cartItem != null) {
          Get.toNamed(
            MyCartPage.routeName,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: scaffoldKey,
      drawerEnableOpenDragGesture: true,
      drawer: CustomDrawer(
        scaffoldKey: scaffoldKey,
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 45.0),
          child: DefaultTabController(
            length: 3,
            child: Obx(() {
              if (_storeController.productDetailsLoadingFlag.value) {
                return const SizedBox(
                  height: 700,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                if (_storeController.productDetails == null) {
                  return const Text('No data found');
                } else {
                  var details = _storeController
                      .productDetails!.customAttributes
                      .firstWhere(
                          (product) => product.attributeCode == 'description');
                  for (int i = 0;
                      i <
                          _storeController
                              .productDetails!.customAttributes.length;
                      i++) {
                    if (_storeController.productDetails!.customAttributes[i]
                            .attributeCode ==
                        'short_description') {
                      features = _storeController
                          .productDetails!.customAttributes[i].value
                          .toString();
                    } else if (_storeController.productDetails!
                            .customAttributes[i].attributeCode ==
                        'description') {
                      description = _storeController
                          .productDetails!.customAttributes[i].value
                          .toString();
                    } else if (_storeController.productDetails!
                            .customAttributes[i].attributeCode ==
                        'specification') {
                      specifications = _storeController
                          .productDetails!.customAttributes[i].value
                          .toString();
                    }
                  }

                  if (!_storeController.sampleProductStatusLoadingFlag.value &&
                      _storeController.statusResponseModel != null) {
                    if (_storeController.statusResponseModel!.success) {
                      isSampleAvailable = true;
                      responseString = jsonEncode(
                          _storeController.statusResponseModel!.responseData);
                      String formattedString =
                          responseString.toString().replaceAll("\\", "");
                      formattedString = formattedString.substring(
                          1, formattedString.length - 1);

                      print("formatted string $formattedString");

                      StatusResponseDataModel object =
                          statusResponseDataModelFromJson(formattedString);
                      sampleProductName = object.productName;
                      sampleProductSku = object.sku;

                      // StatusResponseDataModel object = statusResponseDataModelFromJson(formattedString);
                      print("formatted string name ${object.productName}");
                      // responseString= jsonEncode(_storeController.statusResponseModel!.responseData).replaceAll("\", "");
                      // object = objectFromJson(processedString);
                    }
                  }

                  return Center(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///impl image slider
                              SizedBox(
                                height: 250.h,
                                width: double.infinity,
                                child: Stack(
                                  children: [
                                    SizedBox(
                                      height: 250.h,
                                      width: MediaQuery.of(context).size.width,
                                      child: PageView.builder(
                                          itemCount: _storeController
                                              .productDetails!
                                              .mediaGalleryEntries
                                              .length,
                                          pageSnapping: true,
                                          controller: _pageController,
                                          onPageChanged: (page) {
                                            setState(() {
                                              activePage = page;
                                            });
                                          },
                                          itemBuilder: (context, pagePosition) {
                                            bool active =
                                                pagePosition == activePage;
                                            return slider(
                                                _storeController.productDetails!
                                                    .mediaGalleryEntries,
                                                pagePosition,
                                                active);
                                          }),
                                    ),
                                    Positioned(
                                      top: 10.h,
                                      child: InkWell(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: const Icon(
                                            Icons.arrow_back,
                                            size: 20,
                                          )),
                                    ),
                                    Positioned(
                                      top: 5,
                                      right: 0,
                                      child: FavouriteIcon(
                                        onTapFn: () {
                                          if (isWishlisted) {
                                            // remove the item from wishlist
                                            _wishlistController
                                                .removeFromWishlist(
                                                    _storeController
                                                        .productDetails!.id,
                                                    _usrToken);
                                            if (_wishlistController
                                                .isFavourite) {
                                              isWishlisted = false;
                                            }
                                          } else {
                                            _wishlistController.addToWishlist(
                                                productId, _usrToken);
                                            if (_wishlistController
                                                .isFavourite) {
                                              isWishlisted = true;
                                            }
                                          }
                                        },
                                        initialValue: isWishlisted,
                                      ),
                                    ),
                                    Positioned(
                                      right: 20.w,
                                      bottom: 20.h,
                                      child: const Row(
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.red,
                                            size: 15,
                                          ),
                                          Text('4.5')
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      right: 0.w,
                                      left: 0,
                                      bottom: 20.h,
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: indicators(
                                              _storeController.productDetails!
                                                  .mediaGalleryEntries.length,
                                              activePage)),
                                    ),
                                  ],
                                ),
                              ),

                              addH(10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: 40.h,
                                    width: 260.w,
                                    child: Text(
                                      _storeController.productDetails!.name,
                                      style: TextStyle(
                                          fontFamily: ConstantStrings.kAppFont,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp),
                                    ),
                                  ),
                                  Container(
                                    height: 30.h,
                                    width: 100.w,
                                    color: Colors.red,
                                    child: Center(
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Text(
                                          _storeController.productDetails!.price
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily:
                                                ConstantStrings.kAppFont,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              RatingBar.builder(
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
                                  print(rating);
                                },
                              ),

                              addH(20.h),
                              Container(
                                width: double.infinity,
                                margin: const EdgeInsets.all(10.0),
                                color: Colors.white,
                                child: Column(
                                  children: [
                                    TabBar(
                                        indicatorColor: Colors.black,
                                        indicator: const UnderlineTabIndicator(
                                            borderSide: BorderSide(width: 1.0),
                                            insets: EdgeInsets.symmetric(
                                                horizontal: 1.0)),
                                        labelColor: Colors.black,
                                        padding: EdgeInsets.zero,
                                        labelStyle: TextStyle(
                                          fontFamily: ConstantStrings.kAppFont,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        //For Selected tab
                                        unselectedLabelStyle: TextStyle(
                                          fontFamily: ConstantStrings.kAppFont,
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        //For Un-selected Tabs
                                        indicatorPadding: EdgeInsets.zero,
                                        isScrollable: true,
                                        labelPadding: EdgeInsets.zero,
                                        tabs: [
                                          Container(
                                              width: width * 0.30,
                                              // padding: const EdgeInsets.symmetric(horizontal: 80.0),
                                              child: const Tab(
                                                  text: "Description")),
                                          Container(
                                            width: width * 0.40,
                                            child: const Tab(
                                              text: "About This Item",
                                            ),
                                          ),
                                          Container(
                                              width: width * 0.30,
                                              child: const Tab(
                                                  text: "Specifications")),
                                        ]),
                                    Container(
                                      height: 120.0,
                                      margin: const EdgeInsets.all(10.0),
                                      child: TabBarView(
                                        children: [
                                          getDescriptionWidget(features,
                                              'No features available!'),
                                          getDescriptionWidget(description,
                                              'No information available!'),
                                          getDescriptionWidget(specifications,
                                              'No specifications available!'),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              addH(10.h),
                              Visibility(
                                visible: isDes,
                                child: Column(
                                  children: [
                                    CustomHtmlText(
                                      text: details.value,
                                    ),
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: isSpec,
                                child: const Text("Specification"),
                              ),

                              Visibility(
                                visible: isSampleAvailable,
                                child: CustomBtn(
                                  btnFn: () {
                                    _addSampleToCart();
                                  },
                                  btnText: sampleProductName,
                                  btnBgClr: Colors.red,
                                  txtColor: Colors.white,
                                  btnSize: Size(double.infinity, 40.h),
                                ),
                              ),

                              TopProductTitle(
                                title: 'Cross selling products',
                              ),

                              addH(10.h),
                              SizedBox(
                                width: double.infinity,
                                height: 240.h,
                                child: Obx(() {
                                  if (_homeController.pListLoading.value) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else {
                                    if (_homeController
                                        .homeProductList!.items.isEmpty) {
                                      return const Text('No data found');
                                    } else {
                                      return ListView.builder(
                                        itemCount: _homeController
                                            .homeProductList!.items.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return SizedBox(child: Text("CustomProductItem"),);
                                            /*CustomProductItem(
                                            productModel: _homeController
                                                .homeProductList!.items[index],
                                            wishlistController:
                                                _wishlistController,
                                            userToken: _usrToken,
                                          );*/
                                        },
                                      );
                                    }
                                  }
                                }),
                              ),
                              addH(10.h),

                              TopProductTitle(
                                title: 'Similar Products',
                              ),

                              addH(10.h),
                              SizedBox(
                                width: double.infinity,
                                height: 240.h,
                                child: Obx(() {
                                  if (_homeController.pListLoading.value) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else {
                                    if (_homeController
                                        .homeProductList!.items.isEmpty) {
                                      return const Text('No data found');
                                    } else {
                                      return ListView.builder(
                                        itemCount: _homeController
                                            .homeProductList!.items.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return SizedBox(child: Text("CustomProductItem"),);
                                            /*CustomProductItem(
                                            productModel: _homeController
                                                .homeProductList!.items[index],
                                            wishlistController:
                                                _wishlistController,
                                            userToken: _usrToken,
                                          );*/
                                        },
                                      );
                                    }
                                  }
                                }),
                              ),
                              addH(10.h),

                              TopProductTitle(
                                title: 'Last five items you looked at',
                              ),

                              addH(10.h),
                              SizedBox(
                                width: double.infinity,
                                height: 240.h,
                                child: Obx(() {
                                  if (_homeController.pListLoading.value) {
                                    return const Center(
                                        child: CircularProgressIndicator());
                                  } else {
                                    if (_homeController.homeProductList ==
                                            null ||
                                        _homeController
                                            .homeProductList!.items.isEmpty) {
                                      return const Text('No data found');
                                    } else {
                                      return ListView.builder(
                                        itemCount: _homeController
                                            .homeProductList!.items.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return SizedBox(child: Text("CustomProductItem"),);
                                            /*CustomProductItem(
                                            productModel: _homeController
                                                .homeProductList!.items[index],
                                            wishlistController:
                                                _wishlistController,
                                            userToken: _usrToken,
                                          );*/
                                        },
                                      );
                                    }
                                  }
                                }),
                              ),
                              addH(90.h),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }
              }
            }),
          ),
        ),
      ),
      bottomSheet: Obx(() {
        if (_storeController.productDetailsLoadingFlag.value) {
          return const Text('');
        } else {
          if (_storeController.productDetails != null) {
            return SizedBox(
              height: 100.h,
              width: double.infinity.w,
              child: Column(
                children: [
                  Card(
                    child: Container(
                      color: Colors.white70,
                      height: 80.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 20.0.h),
                            child: Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ConstantColors
                                      .lightGray, // red as border color
                                ),
                              ),
                              child: Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      _storeController.decrease();
                                      setState(() {});
                                    },
                                    child: SizedBox(
                                      height: 30.h,
                                      width: 30.w,
                                      child: Center(
                                          child: Text(
                                        '-',
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            color: Colors.black26),
                                      )),
                                    ),
                                  ),
                                  addW(5.h),
                                  const VerticalDivider(),
                                  Padding(
                                    padding: EdgeInsets.all(8.0.h),
                                    child: Text(
                                      _storeController.counter.toString(),
                                      style: TextStyle(fontSize: 16.sp),
                                    ),
                                  ),
                                  const VerticalDivider(),
                                  InkWell(
                                    onTap: () {
                                      _storeController.increment();
                                      setState(() {});
                                    },
                                    child: SizedBox(
                                      height: 30.h,
                                      width: 30.w,
                                      child: Center(
                                          child: Text(
                                        '+',
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            color: Colors.black26),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Text(
                            _storeController.totalPrice().toString(),
                            style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: ConstantStrings.kAppFont,
                            ),
                          ),
                          CustomBtn(
                            btnFn: () {
                              _usrToken = Preference.getUserToken();
                              _guestToken = Preference.getGuestUserToken();
                              print('_guestToken $_guestToken');

                              if (Preference.getLoggedInFlag() &&
                                  _usrToken.isNotEmpty) {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return SizedBox(
                                        height: 100.h,
                                        child: Dialog(
                                          backgroundColor: Colors.transparent,
                                          child: Obx(() {
                                            if (_myCartController
                                                .myCartItemLoadingFlag.value) {
                                              return SizedBox(
                                                height: 100.h,
                                                child: const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              );
                                            } else {
                                              Future.delayed(
                                                  const Duration(seconds: 1),
                                                  () async {
                                                Get.back();
                                              });

                                              if (_myCartController
                                                  .cartList.isNotEmpty) {
                                                if (_myCartController
                                                            .cartList[0]
                                                            .productType ==
                                                        "virtual" &&
                                                    _myCartController
                                                            .cartList[0].sku ==
                                                        'wk_wallet_amount') {
                                                  print(
                                                      "list size ${_myCartController.cartList.length}");

                                                  return Container(
                                                    height: 100.h,
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: Border.all(
                                                        width: 1.0,
                                                        // assign the color to the border color
                                                        color: ConstantColors
                                                            .lightGray,
                                                      ),
                                                    ),
                                                    child: const Center(
                                                        child: Text(
                                                            'Cart has wallet money')),
                                                  );
                                                } else {
                                                  if (Preference
                                                          .getLoggedInFlag() ||
                                                      _guestToken.isNotEmpty) {
                                                    _addToCart();
                                                  } else {
                                                    Get.toNamed(
                                                      LoginScreen.routeName,
                                                    );
                                                  }
                                                }

                                                return Container(
                                                  height: 100.h,
                                                  decoration: BoxDecoration(
                                                    color: Colors.transparent,
                                                    border: Border.all(
                                                      width: 1.0,
                                                      // assign the color to the border color
                                                      color: ConstantColors
                                                          .lightGray,
                                                    ),
                                                  ),
                                                  child: const Center(
                                                      child: Text('')),
                                                );
                                              } else {
                                                if (Preference
                                                        .getLoggedInFlag() ||
                                                    _guestToken.isNotEmpty) {
                                                  print("guest add to cart");

                                                  _addToCart();
                                                } else {
                                                  Get.toNamed(
                                                    LoginScreen.routeName,
                                                  );
                                                }
                                                return const Center(
                                                    child: Text(''));
                                              }
                                            }
                                          }),
                                        ),
                                      );
                                    });
                              } else {
                                if (Preference.getGuestUserToken().isNotEmpty) {
                                  _addToCart();
                                } else {
                                  Get.toNamed(LoginScreen.routeName);
                                }
                              }
                            },
                            btnText: 'Add to Cart',
                            btnBgClr: Colors.red,
                            txtColor: Colors.white,
                            btnSize: Size(140.w, 40.h),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: Text('Could not load product details'));
          }
        }
      }),
      bottomNavigationBar: CustomBottomNavigation(
        selectedNavIndex: _selectedNavIndex,
      ),
    );
  }

  void _addToCart() {
    print("guest add to cart");

    AddToCartModel addToCartModel;
    String token = _usrToken;
    bool loginflag = Preference.getLoggedInFlag();
    //if(_isCartIsEmpty()){
    if (loginflag) {
      _myCartController.getCartQuoteCode(_usrToken);
      //add to cart model
      addToCartModel = AddToCartModel(
        cartItem: CartItem(
          sku: sku,
          qty: _storeController.counter.toInt(),
          quoteId: _myCartController.quote.toString(),
        ),
      );
    } else {
      token = _guestToken;
      //add to cart model
      print("guest add to cart");
      print("guest token ${Preference.getGuestUserToken()}");

      addToCartModel = AddToCartModel(
          cartItem: CartItem(
        sku: sku,
        qty: _storeController.counter.toInt(),
        quoteId: token.replaceAll('"', ''),
      ));
    }

    _myCartController.addToCart(addToCartModel, token, loginflag);
  }

  void _addSampleToCart() {
    AddToCartModel addToCartModel;
    String token = _usrToken;
    bool loginflag = Preference.getLoggedInFlag();
    if (loginflag) {
      addToCartModel = AddToCartModel(
        cartItem: CartItem(
          sku: sampleProductSku,
          qty: 1,
        ),
      );
    } else {
      token = _guestToken;
      addToCartModel = AddToCartModel(
        cartItem: CartItem(
          sku: sampleProductSku,
          qty: 1,
        ),
      );
    }
    _myCartController.addToCart(addToCartModel, token, loginflag);
  }

  AnimatedContainer slider(images, pagePosition, active) {
    double margin = active ? 10 : 20;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(ConstantStrings.kImageUrl +
                  _storeController.productDetails!
                      .mediaGalleryEntries[pagePosition].file))),
    );
  }

  imageAnimation(PageController animation, images, pagePosition) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, widget) {
        print(pagePosition);
        return SizedBox(
          width: 300.h,
          height: 300.w,
          child: widget,
        );
      },
      child: Container(
        margin: const EdgeInsets.all(10),
        child: InteractiveViewer(
          panEnabled: false,
          // Set it to false
          boundaryMargin: const EdgeInsets.all(100),
          minScale: 0.5,
          maxScale: 2,
          child: Obx(() {
            if (_storeController.productDetailsLoadingFlag.value) {
              return const Text('');
            } else {
              if (_storeController.productDetails != null) {
                return Image.network(ConstantStrings.kImageUrl +
                    _storeController.productDetails!
                        .mediaGalleryEntries[pagePosition].file);
              } else {
                return const Text('');
              }
            }
          }),
        ),
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

  Widget getDescriptionWidget(String? data, String text) {
    print("htmlll  ${specifications}");
    if (data == null) {
      return Center(
        child: Text(
          text,
          style: TextStyle(
              color: ConstantColors.grayShade,
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              fontFamily: ConstantStrings.kAppFont),
        ),
      );
    } else {
      return SingleChildScrollView(
        child: Html(
          data: data,
          style: {
            "body": Style(
              fontFamily: ConstantStrings.kAppFont,
              color: ConstantColors.grayShade,
              fontSize: FontSize(13.0),
              fontWeight: FontWeight.normal,
            ),
          },
        ),
      );
    }
  }
}
