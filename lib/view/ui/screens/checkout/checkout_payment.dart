import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart';
import 'package:kallukoshai/view/ui/screens/checkout/payment_behavior.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/strings.dart';
import '../../../../helper/helper.dart';
import '../../../../states/controller/payment_controller.dart';
import '../../../../states/controller/profile_controller.dart';
import '../../../../states/data/prefs.dart';
import '../../../../states/graphQL/controller/wallet_controller.dart';
import '../../../../states/model/create_order_model.dart';
import '../../../../states/model/payment_info_response_model.dart';
import '../../../../states/model/shipping_address_response_model.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/custom_titlebar.dart';
import '../thank_you/thank_you_page.dart';
import 'card_item.dart';

class CheckoutPayment extends StatefulWidget {
  static String routeName = '/checkout_payment';

  const CheckoutPayment({Key? key}) : super(key: key);

  @override
  State<CheckoutPayment> createState() => _CheckoutPaymentState();
}

class _CheckoutPaymentState extends State<CheckoutPayment>
    with PaymentBehavior {
  final PaymentController _paymentCon = Get.find<PaymentController>();
  final WalletController _walletCon = Get.find<WalletController>();
  final ProfileController _pCon = Get.find<ProfileController>();

  List<ShippingResponseModel> shippingResponseList =
      <ShippingResponseModel>[].obs;
  PaymentInfoResponseModel? paymentInfoObj;
 // profile.Address? _selectedAddress;
  List<dynamic> _cData = [];

  String? amount;
  bool isPayment = false;
  bool isGroupPayment = false;
  String paymentMethod = "cashondelivery";
  bool isOnline = false;
  bool isWalletPayment = false;
  bool isFromWalletPage = false;

  String _usrToken = '';
  bool _loginFlag = false;

  //for online payment
  void createPaymentIntent() async {
    setState(() {
      isProcessing = true;
    });
    try {
      print('_cData.last  ${_cData.last}');
      print('_cData.last*100  ${_cData.last * 100}');
      var response = await dio.post('https://api.stripe.com/v1/payment_intents',
          data: {
            'amount': '${_cData.last * 100}',
            'currency': 'AED',
            'payment_method_types[]': 'card'
          },
          options: Options(headers: {
            //use Stripe account secret key is here after Bearer
            'Authorization':
                'Bearer sk_test_51M4JctDyI9CyAnKqfCpcPM0QWa90xcy0GYvL7LtvZAb10s4HHcJUrW4NoZEzZY2SK91XkeBwCNnLivM6KJvVAwAy00HeHuGl8B',
            'Content-Type': 'application/x-www-form-urlencoded'
          }));

      print('stripe response =>');
      print(response.data.toString());

      initThePaymentSheet(stripeApiResponse: response.data);
    } catch (err) {
      setState(() {
        isProcessing = false;
      });
      debugPrint(
          'error in createPaymentIntent in Dio post API charging user: ${err.toString()}');
    }
  }

  void initThePaymentSheet(
      {required Map<String, dynamic> stripeApiResponse}) async {
    try {
      await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
              paymentIntentClientSecret: stripeApiResponse['client_secret'],
              applePay: true,
              googlePay: true,
              testEnv: true,
              style: ThemeMode.system,
              merchantCountryCode: 'US',
              merchantDisplayName: 'Usama'));

      displayPaymentSheet(stripeApiResponse: stripeApiResponse);
    } catch (e, s) {
      setState(() {
        isProcessing = false;
      });
      debugPrint('exception in initPaymentSheet method:$e$s');
    }
  }

  void displayPaymentSheet({
    required Map<String, dynamic> stripeApiResponse,
  }) async {
    print('display stripe response =>');
    print(stripeApiResponse.toString());
    try {
      await Stripe.instance.presentPaymentSheet();
      setState(() {
        isProcessing = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("paid successfully")));
    } on StripeException catch (e) {
      setState(() {
        isProcessing = false;
      });
      debugPrint(
          ' on StripeException: Exception in displaying payment sheet  ${e.toString()}');
      setState(() {
        isProcessing = false;
      });
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.error.message.toString())));
    } catch (e) {
      setState(() {
        isProcessing = false;
      });
      debugPrint(
          'Exception in displaying payment sheet in general catch ${e.toString()}');
    }
  }

  @override
  void initState() {
    //  shippingResponseList = Get.arguments[0];

    if (Get.arguments != null) {
      _cData = Get.arguments;
      shippingResponseList = _cData.first;
      paymentInfoObj = _cData[1];
      //_selectedAddress = _cData[2];
      amount = paymentInfoObj!.totals.grandTotal.toString();
    }
    _usrToken = Preference.getUserToken();
    _loginFlag = Preference.getLoggedInFlag();

/*    PaymentInfoRequestModel requestModel = PaymentInfoRequestModel(
        addressInformation: AddressInformation(
      shippingAddress: IngAddress(
        region: 'Dubai',
        regionId: 43,
        regionCode: 'AE',
        countryId: 'AE',
        street: ["123 Oak Ave"],
        postcode: '10577',
        city: 'Purchase',
        firstname: 'Jane',
        lastname: 'Doe',
        email: 'ali.russel21@gmail.com',
        telephone: '(512) 555-1111',
      ),
      billingAddress: IngAddress(
        region: 'Dubai',
        regionId: 43,
        regionCode: 'AE',
        countryId: 'AE',
        street: ["123 Oak Ave"],
        postcode: '10577',
        city: 'Purchase',
        firstname: 'Jane',
        lastname: 'Doe',
        email: 'ali.russel21@gmail.com',
        telephone: '(512) 555-1111',
      ),
      shippingCarrierCode: shippingResponseList[0].carrierCode,
      shippingMethodCode: shippingResponseList[0].methodCode,
    ));*/
    Future.delayed(
      const Duration(milliseconds: 400),
      () {
        if (_loginFlag) {
          print('is loggedin $_loginFlag');
          _pCon.getProfileDetails(_usrToken, "", false);
          _walletCon.getCartIDApi();
        }
      },

      //_paymentCon.paymentInfo(requestModel),
    );
    if (!_loginFlag) {
      _pCon.profileLoading.value = false;
      _walletCon.cartIDLoadingFlag.value = false;
      _walletCon.walletOptionsLoadingFlag.value = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*  appBar: AppBar(
        toolbarHeight: 52.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const CustomTopBar(),
      ),*/
      body: Padding(
        padding: const EdgeInsets.only(top: 55, bottom: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomTitleBar(
                title: 'Order Confirm',
                editIcon: '',
              ),
              addH(20.h),
              SizedBox(
                width: double.infinity,
                child: // Row(
                    // children: [
                    Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 110, right: 110),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset('assets/images/gray_tick.png'),
                          const Flexible(
                            child: Divider(
                              thickness: 1,
                              color: Colors.black,
                            ),
                          ),
                          Image.asset('assets/images/orange_tick.png'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 90, right: 40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Shipping',
                            style: TextStyle(
                                fontFamily: ConstantStrings.kAppFont,
                                color: Colors.black,
                                fontSize: 16.sp),
                          ),
                          Text(
                            'Review and Payments',
                            style: TextStyle(
                                fontFamily: ConstantStrings.kAppFont,
                                color: Colors.black,
                                fontSize: 16.sp),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              addH(30.h),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Payable Amount',
                      style: TextStyle(
                          fontFamily: ConstantStrings.kAppFont,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20.sp),
                    ),
                    Text(
                      "AED $amount",
                      style: TextStyle(
                          fontFamily: ConstantStrings.kAppFont,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20.sp),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Payment Method',
                      style: TextStyle(
                          fontFamily: ConstantStrings.kAppFont,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 20.sp),
                    ),
                  ],
                ),
              ),
              //  addH(20.h),

              /*   ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount:
                _paymentCon.paymentInfoObj!.paymentMethods.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return RadioListTile(

                    title: Text(
                      _paymentCon.paymentInfoObj!.paymentMethods[index].title,
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
                    ),
                    value:  _paymentCon.paymentInfoObj!.paymentMethods[index].code,
                    groupValue: paymentMethod,
                    onChanged: (value) {
                      setState(() {
                        paymentMethod = value.toString();
                        isOnline = false;
                      });
                    },

                    //  image: 'assets/images/address.png',
                  );
                },
              ),*/
              getPaymentOptions(),
              /*  Column(
                children: [
                  Obx(() {
                    if (_walletCon.cartIDLoadingFlag.value) {
                      return SizedBox(
                        height: 100.h,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: _walletCon.availablePaymentMethods.length,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return RadioListTile(
                            title: Text(
                              _walletCon.availablePaymentMethods[index].title,
                              //you can separate wallet for this list// how :(
                              //
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17.sp),
                            ),
                            value: _walletCon.availablePaymentMethods[index].code,
                            groupValue: paymentMethod,
                            onChanged: (value) {
                              setState(() {
                                paymentMethod = value.toString();
                                if (paymentMethod == "cashondelivery") {
                                  isOnline = false;
                                  isWalletPayment = false;
                                } else if (paymentMethod == "walletsystem") {
                                  isOnline = false;
                                  isWalletPayment = true;

                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        print("Wallet");
                                        return Dialog(
                                          backgroundColor: Colors.transparent,
                                          child: Obx(() {
                                            if (_pCon.profileLoading.value) {
                                              return SizedBox(
                                                height: 100.h,
                                                child: const Center(
                                                  child:
                                                      CircularProgressIndicator(),
                                                ),
                                              );
                                            } else {
                                              Get.back();
                                              if (_pCon.userProfile != null) {
                                                print(
                                                    'amount ${_cData.last.toDouble()}');

                                                Future.delayed(
                                                  const Duration(milliseconds: 40),
                                                  () {
                                                    _walletCon.getWalletOptionsApi(
                                                        _pCon.userProfile!.id,
                                                        _cData.last.toDouble());
                                                  },
                                                );

                                                return const Center(
                                                    child: Text(''));
                                              } else {
                                                return const Center(
                                                    child: Text(''));
                                              }
                                            }
                                          }),
                                        );
                                      });
                                } else {
                                  isOnline = true;
                                  isWalletPayment = false;
                                }

                                //   isOnline = false;
                              });
                            },

                            //  image: 'assets/images/address.png',
                          );
                        },
                      );
                    }
                  }),
                  Visibility(
                      visible: isWalletPayment,
                      child: Obx(() {
                        if (_walletCon.walletOptionsLoadingFlag.value) {
                          return SizedBox(
                            height: 100.h,
                            child: const Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        } else {
                          if (_walletCon.amountInYourWallet.isEmpty) {
                            return const Center(
                              child: Text('Your wallet is empty!'),
                            );
                          } else {
                            return Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10.0, vertical: 10.0),
                              decoration: BoxDecoration(
                                color: ConstantColors.white,
                                border: Border.all(
                                  width: 1.0,
                                  // assign the color to the border color
                                  color: ConstantColors.lightGray,
                                ),
                              ),
                              //   height: 140,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          'Payment To Be Made',
                                          style: TextStyle(
                                            color: ConstantColors.grayShade,
                                          ),
                                        ),
                                      ),
                                      addH(10),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 5.0),
                                        decoration: BoxDecoration(
                                          color: ConstantColors.lightGray,
                                          border: Border.all(
                                            width: 1.0,
                                            // assign the color to the border color
                                            color: ConstantColors.lightGray,
                                          ),
                                        ),
                                        child: SizedBox(
                                          width: 55,
                                          height: 40,
                                          child: Center(
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              'AED ${_walletCon.paymentToBeMade}',
                                              style: TextStyle(
                                                color: ConstantColors.grayShade,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          'Amount In Your Wallet',
                                          style: TextStyle(
                                            color: ConstantColors.grayShade,
                                          ),
                                        ),
                                      ),
                                      addH(10),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 5.0),
                                        decoration: BoxDecoration(
                                          color: ConstantColors.lightGray,
                                          border: Border.all(
                                            width: 1.0,
                                            // assign the color to the border color
                                            color: ConstantColors.lightGray,
                                          ),
                                        ),
                                        child: SizedBox(
                                          width: 55,
                                          height: 40,
                                          child: Center(
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              'AED ${_walletCon.amountInYourWallet}',
                                              style: TextStyle(
                                                color: ConstantColors.grayShade,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        width: 100,
                                        child: Text(
                                          overflow: TextOverflow.ellipsis,
                                          textAlign: TextAlign.center,
                                          maxLines: 2,
                                          'Left Amount To Be Paid',
                                          style: TextStyle(
                                            color: ConstantColors.grayShade,
                                          ),
                                        ),
                                      ),
                                      addH(10),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0, vertical: 5.0),
                                        decoration: BoxDecoration(
                                          color: ConstantColors.lightGray,
                                          border: Border.all(
                                            width: 1.0,
                                            // assign the color to the border color
                                            color: ConstantColors.lightGray,
                                          ),
                                        ),
                                        child: SizedBox(
                                          width: 55,
                                          height: 40,
                                          child: Center(
                                            child: Text(
                                              overflow: TextOverflow.ellipsis,
                                              maxLines: 2,
                                              'AED ${_walletCon.leftAmountTobePaid}',
                                              style: TextStyle(
                                                color: ConstantColors.grayShade,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }
                        }
                      })),
                  Visibility(
                    ///for card list
                    visible: false,
                    child: SizedBox(
                      child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 2,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (BuildContext context, int index) {
                          return const PaymentCardItem(
                            image: 'assets/images/logo_mastercard.png',
                          );
                        },
                      ),
                      //
                    ),
                  ),
                ],
              ),*/
            ],
          ),
        ),
      ),
      bottomSheet: SizedBox(
        height: 90.h,
        width: double.infinity,
        child: Center(
          child: CustomBtn(
            btnFn: () {
              //for online payment
              if (isOnline) {
                createPaymentIntent();
              } else if (isWalletPayment) {
                //for wallet payment
                _placeWalletOrder();
              } else {
                //for cash on delivery
                _orderCreate();
              }
            },
            btnText: 'Checkout',
            btnBgClr: Colors.red,
            txtColor: Colors.white,
            btnSize: Size(300.w, 50.h),
          ),
        ),
      ),
    );
  }

  void _orderCreate() {
    CreateOrderModel createOrderModel = CreateOrderModel(
      paymentMethod: PaymentInfoMethod(
        method: paymentMethod,
      ),
    );
    /*guest.IngAddress ingAddress = guest.IngAddress(
      region: _selectedAddress!.region.region,
      regionId: _selectedAddress!.regionId,
      regionCode: _selectedAddress!.region.regionCode,
      countryId: _selectedAddress!.countryId,
      street: _selectedAddress!.street,
      postcode: _selectedAddress!.postcode,
      city: _selectedAddress!.city,
      firstname: _selectedAddress!.firstname,
      lastname: _selectedAddress!.lastname,
      email: _selectedAddress!.email,
      telephone: _selectedAddress!.telephone,
    );
    guest.GuestOrderModel guestOrderModel = guest.GuestOrderModel(
        paymentMethod: guest.PaymentMethod(method: paymentMethod),
        email: _selectedAddress!.email,
        shippingAddress: ingAddress,
        billingAddress: ingAddress);*/

    //_paymentCon.createOrder(createOrderModel, guestOrderModel);

    Get.defaultDialog(
        title: 'Processing..',
        content: Obx(() {
          if (_paymentCon.createOrderLoadingFlag.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            if (_paymentCon.orderId != null) {
              Future.delayed(const Duration(seconds: 0), () async {
                // _addressController.getDeliveryAddressList();
                // Get.toNamed(CheckoutPayment.routeName,arguments: [_paymentController.orderId]);

                if (paymentMethod == 'stripe_payments') {
                  createPaymentIntent();
                } else {
                  Get.back();
                  Get.back();
                  Get.back();
                  Get.back();
                  Get.offAndToNamed(ThankYouPage.routeName,
                      arguments: [_paymentCon.orderId]);
                }
              });
              return const Text('Success');
            } else {
              return Column(
                children: [
                  const Text('Loading... failed'),
                  addH(20.h),
                  CustomBtn(
                    btnFn: () {
                      Get.back();
                    },
                    btnText: 'Try Again',
                    btnBgClr: Colors.green,
                    btnSize: Size(120.w, 40.h),
                  )
                ],
              );
            }
          }
        }),
        radius: 10.0);
  }

  void _placeWalletOrder() {
    print("cart ID ${_walletCon.cartID}");
    _walletCon.setWalletPaymentApi(_walletCon.cartID);

    showDialog(
        context: context,
        builder: (context) {
          print("Wallet");
          return Dialog(
            backgroundColor: Colors.transparent,
            child: Obx(() {
              if (_walletCon.walletPaymentLoadingFlag.value) {
                return SizedBox(
                  height: 100.h,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                if (_walletCon.orderNumber.isNotEmpty) {
                  Get.back();
                  Future.delayed(const Duration(seconds: 1), () async {
                    Get.offAndToNamed(ThankYouPage.routeName,
                        arguments: ' ${_walletCon.orderNumber}');

                    Get.offAndToNamed(ThankYouPage.routeName,
                        arguments: [_walletCon.orderNumber]);
                  });

                  print('order number ${_walletCon.orderNumber}');

                  return const Center(
                      child: Text('Order has been placed successfully'));
                } else {
                  return const Center(child: Text('Some error has occurred'));
                }
              }
            }),
          );
        });
  }

  Widget getPaymentOptions() {
    if (!_loginFlag) {
      return Column(
        children: [
          //  Obx(() {
          /*    if (_walletCon.cartIDLoadingFlag.value) {
              return SizedBox(
                height: 100.h,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {*/
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: paymentInfoObj!.paymentMethods.length,
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return RadioListTile(
                title: Text(
                  paymentInfoObj!.paymentMethods[index].title,
                  //you can separate wallet for this list// how :(
                  //
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
                ),
                value: paymentInfoObj!.paymentMethods[index].code,
                groupValue: paymentMethod,
                onChanged: (value) {
                  setState(() {
                    paymentMethod = value.toString();
                    if (paymentMethod == "cashondelivery") {
                      isOnline = false;
                      isWalletPayment = false;
                    } else if (paymentMethod == "walletsystem") {
                      isOnline = false;
                      isWalletPayment = true;
/*
                          showDialog(
                              context: context,
                              builder: (context) {
                                print("Wallet");
                                return Dialog(
                                  backgroundColor: Colors.transparent,
                                  child: Obx(() {
                                    if (_pCon.profileLoading.value) {
                                      return SizedBox(
                                        height: 100.h,
                                        child: const Center(
                                          child:
                                          CircularProgressIndicator(),
                                        ),
                                      );
                                    } else {
                                      Get.back();
                                      if (_pCon.userProfile != null) {
                                        print(
                                            'amount ${_cData.last.toDouble()}');

                                        Future.delayed(
                                          const Duration(milliseconds: 40),
                                              () {
                                            _walletCon.getWalletOptionsApi(
                                                _pCon.userProfile!.id,
                                                _cData.last.toDouble());
                                          },
                                        );

                                        return const Center(
                                            child: Text(''));
                                      } else {
                                        return const Center(
                                            child: Text(''));
                                      }
                                    }
                                  }),
                                );
                              });*/
                    } else {
                      isOnline = true;
                      isWalletPayment = false;
                    }

                    //   isOnline = false;
                  });
                },

                //  image: 'assets/images/address.png',
              );
            },
          ),
          // }
          //}),
          /*   Visibility(
              visible: isWalletPayment,
              child: Obx(() {
                if (_walletCon.walletOptionsLoadingFlag.value) {
                  return SizedBox(
                    height: 100.h,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  if (_walletCon.amountInYourWallet.isEmpty) {
                    return const Center(
                      child: Text('Your wallet is empty!'),
                    );
                  } else {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: ConstantColors.white,
                        border: Border.all(
                          width: 1.0,
                          // assign the color to the border color
                          color: ConstantColors.lightGray,
                        ),
                      ),
                      //   height: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: 100,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  'Payment To Be Made',
                                  style: TextStyle(
                                    color: ConstantColors.grayShade,
                                  ),
                                ),
                              ),
                              addH(10),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5.0),
                                decoration: BoxDecoration(
                                  color: ConstantColors.lightGray,
                                  border: Border.all(
                                    width: 1.0,
                                    // assign the color to the border color
                                    color: ConstantColors.lightGray,
                                  ),
                                ),
                                child: SizedBox(
                                  width: 55,
                                  height: 40,
                                  child: Center(
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      'AED ${_walletCon.paymentToBeMade}',
                                      style: TextStyle(
                                        color: ConstantColors.grayShade,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: 100,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  'Amount In Your Wallet',
                                  style: TextStyle(
                                    color: ConstantColors.grayShade,
                                  ),
                                ),
                              ),
                              addH(10),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5.0),
                                decoration: BoxDecoration(
                                  color: ConstantColors.lightGray,
                                  border: Border.all(
                                    width: 1.0,
                                    // assign the color to the border color
                                    color: ConstantColors.lightGray,
                                  ),
                                ),
                                child: SizedBox(
                                  width: 55,
                                  height: 40,
                                  child: Center(
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      'AED ${_walletCon.amountInYourWallet}',
                                      style: TextStyle(
                                        color: ConstantColors.grayShade,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: 100,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  'Left Amount To Be Paid',
                                  style: TextStyle(
                                    color: ConstantColors.grayShade,
                                  ),
                                ),
                              ),
                              addH(10),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5.0),
                                decoration: BoxDecoration(
                                  color: ConstantColors.lightGray,
                                  border: Border.all(
                                    width: 1.0,
                                    // assign the color to the border color
                                    color: ConstantColors.lightGray,
                                  ),
                                ),
                                child: SizedBox(
                                  width: 55,
                                  height: 40,
                                  child: Center(
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      'AED ${_walletCon.leftAmountTobePaid}',
                                      style: TextStyle(
                                        color: ConstantColors.grayShade,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                }
              })),*/
          Visibility(
            ///for card list
            visible: false,
            child: SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return const PaymentCardItem(
                    image: 'assets/images/logo_mastercard.png',
                  );
                },
              ),
              //
            ),
          ),
        ],
      );
    } else {
      return Column(
        children: [
          Obx(() {
            if (_walletCon.cartIDLoadingFlag.value) {
              return SizedBox(
                height: 100.h,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else {
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _walletCon.availablePaymentMethods.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return RadioListTile(
                    title: Text(
                      _walletCon.availablePaymentMethods[index].title,
                      //you can separate wallet for this list// how :(
                      //
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17.sp),
                    ),
                    value: _walletCon.availablePaymentMethods[index].code,
                    groupValue: paymentMethod,
                    onChanged: (value) {
                      setState(() {
                        paymentMethod = value.toString();
                        if (paymentMethod == "cashondelivery") {
                          isOnline = false;
                          isWalletPayment = false;
                        } else if (paymentMethod == "walletsystem") {
                          isOnline = false;
                          isWalletPayment = true;

                          showDialog(
                              context: context,
                              builder: (context) {
                                print("Wallet");
                                return Dialog(
                                  backgroundColor: Colors.transparent,
                                  child: Obx(() {
                                    if (_pCon.profileLoading.value) {
                                      return SizedBox(
                                        height: 100.h,
                                        child: const Center(
                                          child: CircularProgressIndicator(),
                                        ),
                                      );
                                    } else {
                                      Get.back();
                                      if (_pCon.userProfile != null) {
                                        print(
                                            'amount ${paymentInfoObj!.totals.grandTotal.toDouble()}');

                                        Future.delayed(
                                          const Duration(milliseconds: 40),
                                          () {
                                            _walletCon.getWalletOptionsApi(
                                                _pCon.userProfile!.id,
                                                paymentInfoObj!
                                                    .totals.grandTotal
                                                    .toDouble());
                                          },
                                        );

                                        return const Center(child: Text(''));
                                      } else {
                                        return const Center(child: Text(''));
                                      }
                                    }
                                  }),
                                );
                              });
                        } else {
                          isOnline = true;
                          isWalletPayment = false;
                        }

                        //   isOnline = false;
                      });
                    },

                    //  image: 'assets/images/address.png',
                  );
                },
              );
            }
          }),
          Visibility(
              visible: isWalletPayment,
              child: Obx(() {
                if (_walletCon.walletOptionsLoadingFlag.value) {
                  return SizedBox(
                    height: 100.h,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  if (_walletCon.amountInYourWallet.isEmpty) {
                    return const Center(
                      child: Text('Your wallet is empty!'),
                    );
                  } else {
                    return Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      decoration: BoxDecoration(
                        color: ConstantColors.white,
                        border: Border.all(
                          width: 1.0,
                          // assign the color to the border color
                          color: ConstantColors.lightGray,
                        ),
                      ),
                      //   height: 140,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              SizedBox(
                                width: 100,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  'Payment To Be Made',
                                  style: TextStyle(
                                    color: ConstantColors.grayShade,
                                  ),
                                ),
                              ),
                              addH(10),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5.0),
                                decoration: BoxDecoration(
                                  color: ConstantColors.lightGray,
                                  border: Border.all(
                                    width: 1.0,
                                    // assign the color to the border color
                                    color: ConstantColors.lightGray,
                                  ),
                                ),
                                child: SizedBox(
                                  width: 55,
                                  height: 40,
                                  child: Center(
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      'AED ${_walletCon.paymentToBeMade}',
                                      style: TextStyle(
                                        color: ConstantColors.grayShade,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: 100,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  'Amount In Your Wallet',
                                  style: TextStyle(
                                    color: ConstantColors.grayShade,
                                  ),
                                ),
                              ),
                              addH(10),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5.0),
                                decoration: BoxDecoration(
                                  color: ConstantColors.lightGray,
                                  border: Border.all(
                                    width: 1.0,
                                    // assign the color to the border color
                                    color: ConstantColors.lightGray,
                                  ),
                                ),
                                child: SizedBox(
                                  width: 55,
                                  height: 40,
                                  child: Center(
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      'AED ${_walletCon.amountInYourWallet}',
                                      style: TextStyle(
                                        color: ConstantColors.grayShade,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              SizedBox(
                                width: 100,
                                child: Text(
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  'Left Amount To Be Paid',
                                  style: TextStyle(
                                    color: ConstantColors.grayShade,
                                  ),
                                ),
                              ),
                              addH(10),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 5.0),
                                decoration: BoxDecoration(
                                  color: ConstantColors.lightGray,
                                  border: Border.all(
                                    width: 1.0,
                                    // assign the color to the border color
                                    color: ConstantColors.lightGray,
                                  ),
                                ),
                                child: SizedBox(
                                  width: 55,
                                  height: 40,
                                  child: Center(
                                    child: Text(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      'AED ${_walletCon.leftAmountTobePaid}',
                                      style: TextStyle(
                                        color: ConstantColors.grayShade,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                }
              })),
          Visibility(
            ///for card list
            visible: false,
            child: SizedBox(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 2,
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return const PaymentCardItem(
                    image: 'assets/images/logo_mastercard.png',
                  );
                },
              ),
              //
            ),
          ),
        ],
      );
    }
  }
}
