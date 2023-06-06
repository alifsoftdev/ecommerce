import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/strings.dart';
import '../../../../states/controller/my_cart_controller.dart';
import '../../../../states/data/prefs.dart';
import '../../../../states/model/create_order_model.dart';
import '../../../../states/model/shipping_address_response_model.dart';
import '../../widgets/custom_app_titlebar.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/helper.dart';
import '../add_address/add_address.dart';
import '../checkout/checkout_payment.dart';
import '../home/home.dart';
import '../login/login.dart';
import 'cart_item.dart';

class MyCartPage extends StatefulWidget {
  static String routeName = '/myCart';

  const MyCartPage({Key? key}) : super(key: key);

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  final MyCartController _cCon = Get.find<MyCartController>();
  final TextEditingController _couponCodeCon = TextEditingController();
  final TextEditingController _redeemPointsCon = TextEditingController();
  bool _loginFlag = false;
  late String userToken;

  @override
  void initState() {
    userToken = Preference.getGuestUserToken();
    _loginFlag = Preference.getLoggedInFlag();
    print('userToken $userToken');
    print('_loginFlag $_loginFlag');

    if (_loginFlag || userToken.isNotEmpty) {
      if (_loginFlag) {
        userToken = Preference.getUserToken();
      }
      _cCon.getMyCartDetails(userToken, _loginFlag);
      _cCon.getMyCartItems(userToken, _loginFlag);
      _cCon.getCartId(
        customerId: Preference.getUserIdFlag(),
        userToken: Preference.getAdminToken(),
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*    appBar: AppBar(
        toolbarHeight: 52.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const CustomTopBar(),
      ),*/
      body: userToken.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: Text("You must login first!"),
                ),
                addH(20.h),
                CustomBtn(
                  btnFn: () => Get.toNamed(LoginScreen.routeName),
                  btnText: 'Login',
                  btnBgClr: Colors.amber,
                ),
              ],
            )
          : SingleChildScrollView(
              child: Obx(() {
                if (_cCon.myCartLoadingFlag.value) {
                  return Padding(
                    padding: EdgeInsets.only(top: 350.h),
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  if (_cCon.myCartObj != null) {
                    // _subTotal = _cCon.myCartObj!.subtotal;
                    // _vat = _cCon.myCartObj!.subtotalInclTax -
                    //     _cCon.myCartObj!.subtotal;
                    // _orderTotal = _cCon.myCartObj!.grandTotal;
                    // _total = _orderTotal;
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              addH(10.h),
                              const AppTitleBar(title: 'My Cart'),
                              addH(10.h),
                              SizedBox(
                                height: 400.h,
                                width: double.infinity,
                                child: Obx(
                                  () {
                                    if (_cCon.myCartItemLoadingFlag.value) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    } else {
                                      if (_cCon.cartList.isNotEmpty) {
                                        return ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            physics:
                                                const ClampingScrollPhysics(),
                                            shrinkWrap: true,
                                            itemCount: _cCon.cartList.length,
                                            itemBuilder: (context, index) {
                                              return CartItem(
                                                cartItem: _cCon.cartList[index],
                                                deleteFn: () async {
                                                  // bool deleteFlag = await
                                                  _cCon.deleteCartItem(
                                                    _cCon.cartList[index],
                                                    userToken.replaceAll(
                                                      '"',
                                                      '',
                                                    ),
                                                    _loginFlag,
                                                  );
                                                },
                                                updateFn: (bool isInceasing) =>
                                                    _cCon.updateCartItem(
                                                  itemId: _cCon
                                                      .cartList[index].itemId,
                                                  userToken: userToken,
                                                  skuNumber:
                                                      _cCon.cartList[index].sku,
                                                  qty: isInceasing
                                                      ? _cCon.cartList[index]
                                                              .qty +
                                                          1
                                                      : _cCon.cartList[index]
                                                              .qty -
                                                          1,
                                                  isLogin: _loginFlag,
                                                ),
                                              );
                                            });
                                      } else {
                                        return const Center(
                                          child: Text(
                                            'Cart list empty',
                                          ),
                                        );
                                      }
                                    }
                                  },
                                ),
                              ),
                              addH(10.h),
                              Text(
                                'Add items from wish list',
                                style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: ConstantStrings.kAppFont,
                                ),
                              ),
                              addH(20.h),
                              Text(
                                'Summary',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: ConstantStrings.kAppFont,
                                ),
                              ),
                              addH(10.h),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Sub Total',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: ConstantStrings.kAppFont,
                                    ),
                                  ),
                                  Text(
                                    "${_cCon.myCartObj!.baseCurrencyCode} ${_cCon.myCartObj!.subtotal}",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: ConstantStrings.kAppFont,
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Vat',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: ConstantStrings.kAppFont,
                                    ),
                                  ),
                                  Text(
                                    "${_cCon.myCartObj!.baseCurrencyCode} ${_cCon.myCartObj!.taxAmount}",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: ConstantStrings.kAppFont,
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Order Total',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: ConstantStrings.kAppFont,
                                    ),
                                  ),
                                  Text(
                                    "${_cCon.myCartObj!.baseCurrencyCode} ${_cCon.myCartObj!.subtotal}",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: ConstantStrings.kAppFont,
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total Products',
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: ConstantStrings.kAppFont,
                                    ),
                                  ),
                                  Text(
                                    _cCon.myCartObj!.itemsQty.toString(),
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: ConstantStrings.kAppFont,
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 50.h,
                                    width: 280.w,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: ConstantColors
                                            .lightGray, // red as border color
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10.0, top: 10),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10.0, top: 10),
                                        child: TextField(
                                          maxLines: 1,
                                          style: TextStyle(
                                            fontFamily:
                                                ConstantStrings.kAppFont,
                                            color: Colors.black,
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          controller: _couponCodeCon,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'Apply Code',
                                            hintStyle: TextStyle(
                                              fontFamily:
                                                  ConstantStrings.kAppFont,
                                              // color: ConstantColors.k999999,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  CustomBtn(
                                    btnFn: () {
                                      _cCon.applyCouponCode(
                                          code: _couponCodeCon.text,
                                          userToken: Preference.getUserToken(),
                                          loginFlag: _loginFlag);
                                      Get.defaultDialog(
                                        title: '',
                                        content: Obx(
                                          () {
                                            if (_cCon
                                                .couponCodeLoadingFlag.value) {
                                              return SizedBox(
                                                height: 100.h,
                                                child: const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              );
                                            } else {
                                              if (_cCon.isCouponApply ==
                                                  false) {
                                                Future.delayed(
                                                  const Duration(seconds: 2),
                                                  () {
                                                    Get.back();
                                                  },
                                                );
                                                return Center(
                                                  child: Text(
                                                    'Coupon code is not available!',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontFamily:
                                                            ConstantStrings
                                                                .kAppFont),
                                                  ),
                                                );
                                              } else {
                                                Future.delayed(
                                                  const Duration(seconds: 2),
                                                  () {
                                                    setState(() {
                                                      if (_loginFlag ||
                                                          userToken
                                                              .isNotEmpty) {
                                                        if (_loginFlag) {
                                                          userToken = Preference
                                                              .getUserToken();
                                                        }
                                                        _cCon.getMyCartDetails(
                                                            userToken,
                                                            _loginFlag);
                                                        _cCon.getMyCartItems(
                                                            userToken,
                                                            _loginFlag);
                                                      }
                                                    });
                                                    _couponCodeCon.clear();
                                                    Get.back();
                                                  },
                                                );
                                                return Center(
                                                  child: Text(
                                                    'Coupon Code Successfully Applied',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 18.sp,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontFamily:
                                                            ConstantStrings
                                                                .kAppFont),
                                                  ),
                                                );
                                              }
                                            }
                                          },
                                        ),
                                      );
                                    },
                                    btnText: 'Apply',
                                    btnBgClr: Colors.red,
                                    txtColor: Colors.white,
                                    btnSize: Size(90.w, 50.h),
                                  )
                                ],
                              ),
                              addH(10.h),
                              Preference.getUserToken() != ''
                                  ? Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          height: 50.h,
                                          width: 280.w,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: ConstantColors
                                                  .lightGray, // red as border color
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10.0, top: 10),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0, top: 10),
                                              child: TextField(
                                                maxLines: 1,
                                                style: TextStyle(
                                                  fontFamily:
                                                      ConstantStrings.kAppFont,
                                                  color: Colors.black,
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                controller: _redeemPointsCon,
                                                keyboardType:
                                                    TextInputType.text,
                                                decoration: InputDecoration(
                                                  border: InputBorder.none,
                                                  hintText: 'Redeem Points',
                                                  hintStyle: TextStyle(
                                                    fontFamily: ConstantStrings
                                                        .kAppFont,
                                                    // color: ConstantColors.k999999,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        CustomBtn(
                                          btnFn: () {
                                            _cCon.applyRedeemPoints(
                                              points: _redeemPointsCon.text,
                                            );
                                            Get.defaultDialog(
                                              title: '',
                                              content: Obx(
                                                () {
                                                  if (_cCon
                                                      .redeemPointsLoadingFlag
                                                      .value) {
                                                    return SizedBox(
                                                      height: 100.h,
                                                      child: const Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ),
                                                    );
                                                  } else {
                                                    if (_cCon
                                                            .isRedeemPointsApply ==
                                                        false) {
                                                      Future.delayed(
                                                        const Duration(
                                                            seconds: 2),
                                                        () {
                                                          Get.back();
                                                        },
                                                      );
                                                      return Center(
                                                        child: Text(
                                                          'Redeem Points is not available!',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontFamily:
                                                                  ConstantStrings
                                                                      .kAppFont),
                                                        ),
                                                      );
                                                    } else {
                                                      Future.delayed(
                                                        const Duration(
                                                            seconds: 2),
                                                        () {
                                                          setState(() {
                                                            if (_loginFlag ||
                                                                userToken
                                                                    .isNotEmpty) {
                                                              if (_loginFlag) {
                                                                userToken =
                                                                    Preference
                                                                        .getUserToken();
                                                              }
                                                              _cCon.getMyCartDetails(
                                                                  userToken,
                                                                  _loginFlag);
                                                              _cCon.getMyCartItems(
                                                                  userToken,
                                                                  _loginFlag);
                                                            }
                                                          });
                                                          _redeemPointsCon
                                                              .clear();
                                                          Get.back();
                                                        },
                                                      );
                                                      return Center(
                                                        child: Text(
                                                          'Redeem Points Successfully Applied',
                                                          textAlign:
                                                              TextAlign.center,
                                                          style: TextStyle(
                                                              fontSize: 18.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w700,
                                                              fontFamily:
                                                                  ConstantStrings
                                                                      .kAppFont),
                                                        ),
                                                      );
                                                    }
                                                  }
                                                },
                                              ),
                                            );
                                          },
                                          btnText: 'Apply',
                                          btnBgClr: Colors.red,
                                          txtColor: Colors.white,
                                          btnSize: Size(90.w, 50.h),
                                        )
                                      ],
                                    )
                                  : const SizedBox(),
                              const Divider(),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total Payable Amount',
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: ConstantStrings.kAppFont,
                                    ),
                                  ),
                                  Text(
                                    "${_cCon.myCartObj!.baseCurrencyCode} ${_cCon.myCartObj!.grandTotal}",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: ConstantStrings.kAppFont,
                                    ),
                                  ),
                                ],
                              ),
                              addH(80.h),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Padding(
                      padding: EdgeInsets.only(top: 300.h),
                      child: const Center(
                        child: Text('No data found'),
                      ),
                    );
                  }
                }
              }),
            ),
      bottomSheet: Obx(() {
        if (_cCon.myCartLoadingFlag.value) {
          return const Text('');
        } else {
          if (_cCon.myCartObj != null) {
            return SizedBox(
              height: 70.h,
              width: double.infinity,
              child: Column(
                children: [
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  //   child: Container(
                  //     height: 50.h,
                  //     color: Colors.white70,
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Text(
                  //           'Total Payable Amount',
                  //           style: TextStyle(
                  //             fontSize: 15.sp,
                  //             fontWeight: FontWeight.bold,
                  //             fontFamily: ConstantStrings.kAppFont,
                  //           ),
                  //         ),
                  //         Text(
                  //           "${_myCartController.myCartObj!.baseCurrencyCode} ${_myCartController.myCartObj!.grandTotal}",
                  //           style: TextStyle(
                  //             fontSize: 15.sp,
                  //             fontWeight: FontWeight.bold,
                  //             fontFamily: ConstantStrings.kAppFont,
                  //           ),
                  //         ),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  Card(
                    child: Container(
                      color: Colors.white70,
                      height: 58.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () => Get.offNamed(HomeScreen.routeName),
                            child: Container(
                              height: 40.h,
                              width: 150.w,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: ConstantColors
                                      .lightGray, // red as border color
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Center(
                                  child: Text(
                                    'Continue Shopping',
                                    style: TextStyle(
                                      fontSize: 12.sp,
                                      color: Colors.black,
                                      fontFamily: ConstantStrings.kAppFont,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          CustomBtn(
                            btnFn: () {
                              if (_cCon.cartList[0].productType == "virtual") {
                                Get.toNamed(CheckoutPayment.routeName,
                                    arguments: [
                                      <ShippingResponseModel>[],
                                      _cCon.cartList[0].price,
                                      null
                                    ]);
                              } else {
                                print(
                                    "_cCon.myCartObj!.subtotal ${_cCon.myCartObj!.subtotal}");
                                if (!_loginFlag) {
                                  print(
                                      "_cCon.myCartObj!.subtotal ${_cCon.myCartObj!.subtotal}");
                                 /* Get.toNamed(AddAddress.routeName, arguments: [
                                    _cCon.myCartObj!.subtotal,
                                    null
                                  ]);*/
                                  /*   Get.toNamed(
                                    AddAddress.routeName,
                                      arguments: [
                                        _cCon.myCartObj!.subtotal,null
                                      ]);*/
                                } else {
                                  // Get.toNamed(BillingAddress.routeName,
                                  //     arguments: [
                                  //       _cCon.myCartObj!.subtotal,
                                  //     ]);
                                }
                              }
                            },
                            btnText: 'Checkout',
                            btnBgClr: Colors.red,
                            txtColor: Colors.white,
                            btnSize: Size(130.w, 40.h),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Text('');
          }
        }
      }),
    );
  }

  void _applyCode() {}

  int totalAmount(int quantity, int unitPrice) {
    int price;
    price = quantity * unitPrice;
    return price;
  }
}
