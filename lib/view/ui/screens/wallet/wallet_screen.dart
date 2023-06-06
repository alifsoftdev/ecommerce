import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/strings.dart';
import '../../../../states/controller/my_cart_controller.dart';
import '../../../../states/controller/profile_controller.dart';
import '../../../../states/data/prefs.dart';
import '../../../../states/graphQL/controller/wallet_controller.dart';
import '../../../../states/utils/methods.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/custom_dropdown.dart';
import '../../widgets/custom_field.dart';
import '../../widgets/custom_titlebar.dart';
import '../../widgets/helper.dart';
import '../../widgets/payee_list_item.dart';
import '../../widgets/transaction_item.dart';
import '../my_points/rewards_rules_item.dart';
import 'add_payee_dialog.dart';

class WalletScreen extends StatefulWidget {
  static String routeName = '/my_wallet';

  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  String _usrToken = '';
  final TextEditingController _amountCon = TextEditingController();
  final WalletController _walletCon = Get.find<WalletController>();
  final ProfileController _pCon = Get.find<ProfileController>();
  final TextEditingController _transferAmountCon = TextEditingController();
  final TextEditingController _notesCon = TextEditingController();

  List<String> steps = [
    "Enter your desired amount in the above text box.",
    "Press the button " "\"Add Money to Wallet.\"",
    "A Wallet product will be added to your cart with your desired amount.",
    "Go to Cart and Checkout."
  ];
  String _initialValue = 'Please select a payee';
  bool _loginFlag = false;
  final MyCartController _cCon = Get.find<MyCartController>();

  @override
  void initState() {
    super.initState();
    _usrToken = Preference.getUserToken();
    _pCon.getProfileDetails(_usrToken, "", false);
    _loginFlag = Preference.getLoggedInFlag();
    if (_loginFlag || _usrToken.isNotEmpty) {
      _cCon.getMyCartItems(_usrToken, _loginFlag);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 100.h,
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        automaticallyImplyLeading: false,
        title: const CustomTitleBar(
          title: 'My Wallet',
          editIcon: '',
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.black,
                  indicator: UnderlineTabIndicator(
                      borderSide: BorderSide(width: 1.0),
                      insets: EdgeInsets.symmetric(horizontal: 10.0)),
                  tabs: [
                    Tab(text: "Manage Wallet Amount"),
                    Tab(
                      text: "Transfer Wallet Amount",
                    ),
                  ]),
              SizedBox(
                height: Get.height - 200,
                // margin: const EdgeInsets.all(10.0),
                child: TabBarView(
                  children: [
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    'assets/images/wallet.png',
                                  ),
                                  addW(10.w),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Wallet Details',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: ConstantStrings.kAppFont,
                                        ),
                                      ),
                                      addH(10.h),
                                      Row(
                                        children: [
                                          Obx(() {
                                            if (_walletCon
                                                .walletBalanceLoadingFlag
                                                .value) {
                                              return const Center(
                                                  child: Text(''));
                                            } else if (_walletCon
                                                .walletBalance.isEmpty) {
                                              return const Center(
                                                  child: Text(''));
                                            } else {
                                              return Text(
                                                'AED ${(double.parse(_walletCon.walletBalance).toStringAsFixed(2))}',
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily:
                                                      ConstantStrings.kAppFont,
                                                ),
                                              );
                                            }
                                          }),
                                          Text(
                                            '(AED)',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.normal,
                                              fontFamily:
                                                  ConstantStrings.kAppFont,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        'Your wallet balance',
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: ConstantStrings.kAppFont,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              addH(20.h),
                              Container(
                                padding: EdgeInsets.all(15.h),
                                decoration: BoxDecoration(
                                  //   borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                    color: ConstantColors.lightGray,
                                    width: 1,
                                  ),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Enter amount to be added in wallet',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: ConstantStrings.kAppFont,
                                      ),
                                    ),
                                    addH(10.h),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: TextField(
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                                //fontFamily: ConstantStrings.kAppRobotoFont,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              controller: _amountCon,
                                              keyboardType:
                                                  TextInputType.number,
                                              obscureText: false,
                                              textAlignVertical:
                                                  TextAlignVertical.center,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          '[AED]',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.normal,
                                            fontFamily:
                                                ConstantStrings.kAppFont,
                                          ),
                                        ),
                                        addW(5.w),
                                        GestureDetector(
                                          onTap: () {
                                            if (_amountCon.text.isEmpty) {
                                              Methods.showSnackbar(
                                                msg: 'Please add amount!',
                                              );
                                              return;
                                            }

                                            _checkIfCartIsEmpty(
                                                double.parse(_amountCon.text));
                                            /*
                                            _addMoneyToWallet(
                                                double.parse(_amountCon.text));*/
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(8.0),
                                            decoration: const BoxDecoration(
                                              color: Colors.red,
                                              //   borderRadius: BorderRadius.circular(5.0),
                                            ),
                                            child: Text(
                                              'Add Money To Wallet',
                                              style: TextStyle(
                                                fontSize: 16.sp,
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                                fontFamily:
                                                    ConstantStrings.kAppFont,
                                              ),
                                            ),
                                          ),
                                        ),

                                        /*  CustomBtn(
                                          btnFn: () {},
                                          btnText: 'Add Money To Wallet',
                                          btnBgClr: Colors.red,
                                          txtColor: Colors.white,
                                          btnSize: Size(220.h, 50.h),
                                        ),*/
                                      ],
                                    ),
                                    addH(30.h),
                                    Text(
                                      'Steps to add an amount to Wallet',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: ConstantStrings.kAppFont,
                                      ),
                                    ),
                                    addH(10.h),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: 3,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return RewardsRulesItem(
                                          frontName: steps[index],

                                          //  image: 'assets/images/address.png',
                                        );
                                      },
                                    ),
                                    addH(20.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Please note: ',
                                          style: TextStyle(
                                            fontSize: 16.sp,
                                            fontWeight: FontWeight.bold,
                                            fontFamily:
                                                ConstantStrings.kAppFont,
                                          ),
                                        ),
                                        SizedBox(
                                          width: Get.width - 130,
                                          child: Text(
                                            'Do not add any other products along with the Wallet product.',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.normal,
                                              fontFamily:
                                                  ConstantStrings.kAppFont,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              addH(30.h),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text(
                                  'Last Transactions',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: ConstantStrings.kAppFont,
                                  ),
                                ),
                              ),
                              addH(10.h),
                              Obx(() {
                                if (_pCon.profileLoading.value) {
                                  return const Center(child: Text(''));
                                  /*return const Center(
                                    child: CircularProgressIndicator(),
                                  );*/
                                } else {
                                  if (_pCon.userProfile != null) {
                                    Future.delayed(
                                      const Duration(milliseconds: 30),
                                      () {
                                        _walletCon.getWalletBalanceApi(
                                            _pCon.userProfile!.id);
                                        _walletCon.getPayeeListApi(
                                            _pCon.userProfile!.id);
                                        _walletCon.getTransactionListApi(
                                            _pCon.userProfile!.id);
                                      },
                                    );

                                    return const Center(child: Text(''));
                                  } else {
                                    return const Center(child: Text(''));
                                  }
                                }
                              }),
                              Obx(() {
                                if (_walletCon
                                    .transactionListLoadingFlag.value) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  if (_walletCon.transactionList != null) {
                                    return SizedBox(
                                      height: 400.h,
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        /* shrinkWrap: true,
                                  physics:
                                  const NeverScrollableScrollPhysics(),*/
                                        itemCount:
                                            _walletCon.transactionList.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return TransactionItem(
                                            lasttransaction: _walletCon
                                                .transactionList[index],

                                            //  image: 'assets/images/address.png',
                                          );
                                        },
                                      ),
                                    );
                                  } else {
                                    return const Center(
                                        child:
                                            Text('No transactions available'));
                                  }
                                }
                              }),
                            ],
                          ),
                        ),
                      ),
                    ),

                    // second tab bar view widget
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        'assets/images/wallet.png',
                                        //width: double.infinity,
                                        //  height: 260.h,
                                        //fit: BoxFit.fill,
                                      ),
                                      addW(10.w),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Wallet Details',
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.bold,
                                              fontFamily:
                                                  ConstantStrings.kAppFont,
                                            ),
                                          ),
                                          addH(10.h),
                                          Row(
                                            children: [
                                              Obx(() {
                                                if (_walletCon
                                                    .walletBalanceLoadingFlag
                                                    .value) {
                                                  return const Center(
                                                      child: Text(''));
                                                } else if (_walletCon
                                                    .walletBalance.isEmpty) {
                                                  return const Center(
                                                      child: Text(''));
                                                } else {
                                                  return Text(
                                                    'AED ${(double.parse(_walletCon.walletBalance).toStringAsFixed(2))}',
                                                    style: TextStyle(
                                                      fontSize: 16.sp,
                                                      color: Colors.green,
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontFamily:
                                                          ConstantStrings
                                                              .kAppFont,
                                                    ),
                                                  );
                                                }
                                              }),
                                              Text(
                                                '(AED)',
                                                style: TextStyle(
                                                  fontSize: 16.sp,
                                                  fontWeight: FontWeight.normal,
                                                  fontFamily:
                                                      ConstantStrings.kAppFont,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            'Your wallet balance',
                                            style: TextStyle(
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.normal,
                                              fontFamily:
                                                  ConstantStrings.kAppFont,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(8.0),
                                    decoration: const BoxDecoration(
                                      color: Colors.red,
                                      //   borderRadius: BorderRadius.circular(5.0),
                                    ),
                                    child: InkWell(
                                      onTap: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return StatefulBuilder(builder:
                                                  (context, setStateForDialog) {
                                                return Dialog(
                                                  child: SizedBox(
                                                    height: Get.height * 0.5,
                                                    child:
                                                        const AddPayeeDialog(),
                                                  ),
                                                );
                                              });
                                            });
                                      },
                                      child: Text(
                                        'Add Payee',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.white,
                                          fontWeight: FontWeight.normal,
                                          fontFamily: ConstantStrings.kAppFont,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              addH(20.h),
                              Container(
                                padding: EdgeInsets.all(15.h),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: ConstantColors.lightGray,
                                    width: 1,
                                  ),
                                ),
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Select payee to whom you want to transfer amount ',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: ConstantStrings.kAppFont,
                                      ),
                                    ),
                                    addH(20.h),
                                    Container(
                                      height: 50.h,
                                      width: double.infinity,
                                      padding: EdgeInsets.all(15.h),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: ConstantColors.lightGray,
                                          width: 1,
                                        ),
                                      ),
                                      child: Obx(() {
                                        if (_walletCon
                                            .getPayeeListLoadingFlag.value) {
                                          /* return const Center(
                                        child: CircularProgressIndicator(),
                                      );*/
                                          return // Padding(
                                              // padding: const EdgeInsets.all(8.0),
                                              //    child:
                                              Text(
                                            'Please select a payee',
                                            style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.normal,
                                              fontFamily:
                                                  ConstantStrings.kAppFont,
                                            ),
                                            //   ),
                                          );
                                        } else {
                                          if (_walletCon.payeeList != null) {
                                            List<String> payeeList = [
                                              'Please select a payee'
                                            ];

                                            for (int i = 0;
                                                i < _walletCon.payeeList.length;
                                                i++) {
                                              payeeList.add(
                                                  '${_walletCon.payeeList[i].nickName} (${_walletCon.payeeList[i].emailAddress})');
                                            }
                                            return CustomDropDown(
                                              initialValue: _initialValue,
                                              itemList: payeeList,
                                              onChangedFn: (value) => setState(
                                                  () => _initialValue = value),
                                            );
                                          } else {
                                            return const Center(
                                                child: Text('No payees added'));
                                          }
                                        }
                                      }),
                                    ),
                                    addH(20.h),
                                    Text(
                                      'Amount (AED)',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: ConstantStrings.kAppFont,
                                      ),
                                    ),
                                    addH(20.h),
                                    CustomField(
                                      hintText: '',
                                      textCon: _transferAmountCon,
                                      inputType: TextInputType.number,
                                      //   prefixIcon: 'assets/images/mail.png',
                                      fillClr: Colors.white,
                                      brdrClr: Colors.grey.shade200,
                                      brdrRadius: 0,
                                    ),
                                    addH(20.h),
                                    Text(
                                      'Notes',
                                      style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: ConstantStrings.kAppFont,
                                      ),
                                    ),
                                    addH(20.h),
                                    Container(
                                      width: 388.w,
                                      height: 100.h,
                                      padding: EdgeInsets.all(15.h),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: ConstantColors.lightGray,
                                          width: 1,
                                        ),
                                      ),
                                      child: TextField(
                                        maxLines: 5,
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          fontWeight: FontWeight.normal,
                                        ),
                                        controller: _notesCon,
                                        keyboardType: TextInputType.text,
                                        textAlignVertical:
                                            TextAlignVertical.center,
                                        decoration: InputDecoration(
                                          filled: true,
                                          fillColor: Colors.white,
                                          contentPadding:
                                              EdgeInsets.only(left: 15.w),
                                          disabledBorder: getInputBorder(),
                                          border: getInputBorder(),
                                          enabledBorder: getInputBorder(),
                                          focusedBorder: getInputBorder(),
                                        ),
                                      ),
                                    ),
                                    addH(20.h),
                                    Center(
                                      child: CustomBtn(
                                        btnFn: () {
                                          if (_checkValidity(_initialValue)) {
                                            print(
                                                'is valid ${_checkValidity(_initialValue)}');

                                            _transferWalletMoney(_initialValue);
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return Dialog(
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    child: Obx(() {
                                                      if (_walletCon
                                                          .transferMoneyLoadingFlag
                                                          .value) {
                                                        return SizedBox(
                                                          height: 100.h,
                                                          child: const Center(
                                                            child:
                                                                CircularProgressIndicator(),
                                                          ),
                                                        );
                                                      } else {
                                                        Future.delayed(
                                                            const Duration(
                                                                seconds: 1),
                                                            () async {
                                                          Get.back();
                                                          _walletCon
                                                              .getWalletBalanceApi(
                                                                  _pCon
                                                                      .userProfile!
                                                                      .id);
                                                        });

                                                        return Container(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10.0,
                                                                  vertical:
                                                                      5.0),
                                                          decoration:
                                                              BoxDecoration(
                                                            color:
                                                                ConstantColors
                                                                    .lightGray,
                                                            border: Border.all(
                                                              width: 1.0,
                                                              // assign the color to the border color
                                                              color:
                                                                  ConstantColors
                                                                      .lightGray,
                                                            ),
                                                          ),
                                                          height: 50,
                                                          child: Center(
                                                              child: Text(
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            maxLines: 2,
                                                            _walletCon
                                                                .transferMessage,
                                                            style:
                                                                const TextStyle(
                                                              color:
                                                                  Colors.black,
                                                            ),
                                                          )),
                                                        );
                                                      }
                                                    }),
                                                  );
                                                });
                                          }
                                        },
                                        btnText: 'Transfer Money To Customer',
                                        btnBgClr: Colors.red,
                                        txtColor: Colors.white,
                                        btnSize: Size(300.w, 50.h),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              addH(30.h),
                              Text(
                                'Added Payees',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: ConstantStrings.kAppFont,
                                ),
                              ),
                              addH(10.h),
                              Obx(() {
                                if (_pCon.profileLoading.value) {
                                  return const Center(child: Text(''));
                                  /*return const Center(
                                    child: CircularProgressIndicator(),
                                  );*/
                                } else {
                                  if (_pCon.userProfile != null) {
                                    Future.delayed(
                                      const Duration(milliseconds: 30),
                                      () {
                                        _walletCon.getPayeeListApi(
                                            _pCon.userProfile!.id);
                                      },
                                    );

                                    return const Center(child: Text(''));
                                  } else {
                                    return const Center(child: Text(''));
                                  }
                                }
                              }),
                              Obx(() {
                                if (_walletCon.getPayeeListLoadingFlag.value) {
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                } else {
                                  if (_walletCon.payeeList != null) {
                                    return SizedBox(
                                      height: 400.h,
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        itemCount: _walletCon.payeeList.length,
                                        scrollDirection: Axis.vertical,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return PayeeItem(
                                              payeeItem:
                                                  _walletCon.payeeList[index],
                                              deleteTap: () {
                                                _walletCon.deletePayeeApi(
                                                    _walletCon.payeeList[index]
                                                        .payeeId,
                                                    _pCon.userProfile!.id);

                                                showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return Dialog(
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        child: Obx(() {
                                                          if (_walletCon
                                                              .deletePayeeLoadingFlag
                                                              .value) {
                                                            return SizedBox(
                                                              height: 100.h,
                                                              child:
                                                                  const Center(
                                                                child:
                                                                    CircularProgressIndicator(),
                                                              ),
                                                            );
                                                          } else {
                                                            Future.delayed(
                                                                const Duration(
                                                                    milliseconds:
                                                                        80),
                                                                () async {
                                                              Get.back();
                                                            });
                                                            return Container(
                                                              padding: const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10.0,
                                                                  vertical:
                                                                      5.0),
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: ConstantColors
                                                                    .lightGray,
                                                                border:
                                                                    Border.all(
                                                                  width: 1.0,
                                                                  // assign the color to the border color
                                                                  color: ConstantColors
                                                                      .lightGray,
                                                                ),
                                                              ),
                                                              height: 50,
                                                              child: Center(
                                                                  child: Text(
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 2,
                                                                _walletCon
                                                                    .deleteMessage
                                                                    .value,
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              )),
                                                            );
                                                          }
                                                        }),
                                                      );
                                                    });

                                                // });
                                                //   });
                                              }
                                              //  image: 'assets/images/address.png',
                                              );
                                        },
                                      ),
                                    );
                                  } else {
                                    return const Center(
                                        child: Text('No payees added'));
                                  }
                                }
                              }),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setState(() {
        _pCon.getProfileDetails(_usrToken, "", false);
      });
    }
  }

  bool _checkValidity(String selectedPayee) {
    print('selected payee $selectedPayee');
    if (_transferAmountCon.text.isEmpty || _notesCon.text.isEmpty) {
      Methods.showSnackbar(
        msg: 'Please fill all the empty fields!',
      );
      return false;
    } else if (_initialValue == 'Please select a payee') {
      Methods.showSnackbar(
        msg: 'Please select a payee!',
      );
      return false;
    } else {
      return true;
    }
  }

  void _transferWalletMoney(String selectedPayee) {
    int payeeID = _getPayeeID(selectedPayee);
    if (payeeID != -1) {
      print('payee ID $payeeID');
    }
    Future.delayed(const Duration(seconds: 1), () async {
      _walletCon.getTransferCodeApi(_pCon.userProfile!.id, payeeID,
          double.parse(_transferAmountCon.text), _notesCon.text);
    });
  }

  int _getPayeeID(String selectedPayee) {
    int payeeID = -1;
    int idx = selectedPayee.indexOf(" (");
    List parts = [
      selectedPayee.substring(0, idx).trim(),
      selectedPayee.substring((idx + 2), (selectedPayee.length - 1)).trim()
    ];
    print("parts 0 ${parts[0]}");
    print("parts 1 ${parts[1]}");
    for (int i = 0; i < _walletCon.payeeList.length; i++) {
      if (_walletCon.payeeList[i].nickName == parts[0] &&
          (_walletCon.payeeList[i].emailAddress == parts[1])) {
        payeeID = _walletCon.payeeList[i].payeeId;
      }
    }
    print("Payee ID $payeeID");
    return payeeID;
  }

  void _checkIfCartIsEmpty(double amount) {
    showDialog(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 100.h,
            child: Dialog(
              backgroundColor: Colors.transparent,
              child: Obx(() {
                if (_cCon.myCartItemLoadingFlag.value) {
                  return SizedBox(
                    height: 100.h,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  Future.delayed(const Duration(seconds: 1), () async {
                    Get.back();
                  });
                  if (_cCon.cartList.isNotEmpty) {
                    return Container(
                        height: 100.h,
                        decoration: BoxDecoration(
                          color: ConstantColors.white,
                          border: Border.all(
                            width: 1.0,
                            // assign the color to the border color
                            color: ConstantColors.lightGray,
                          ),
                        ),
                        child: Center(
                            child: Text(
                          'Cart must be empty to add money to wallet',
                          style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.normal,
                            fontFamily: ConstantStrings.kAppFont,
                          ),
                        )));
                  } else {
                    Future.delayed(const Duration(seconds: 1), () async {
                      _addMoneyToWallet(amount);
                    });
                    return const Center(child: Text(''));
                  }
                }
              }),
            ),
          );
        });
  }

  void _addMoneyToWallet(double amount) {
    /* if (_amountCon.text.isEmpty) {
      Methods.showSnackbar(
        msg: 'Please add amount!',
      );
      return;
    }
*/
    // Future.delayed(const Duration(seconds: 1), () async {
    _walletCon.addMoneyToWallet(amount);
    // });
    showDialog(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 100.h,
            child: Dialog(
              backgroundColor: Colors.transparent,
              child: Obx(() {
                if (_walletCon.addMoneyToWalletLoadingFlag.value) {
                  return SizedBox(
                    height: 100.h,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else {
                  if (_walletCon.addMoneyMessage.isNotEmpty) {
                    Future.delayed(const Duration(seconds: 1), () async {
                      Get.back();
                      Get.back();
                      Get.back();
                    });
                    return Container(
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
                      height: 50,
                      child: Center(
                          child: Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        _walletCon.addMoneyMessage,
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      )),
                    );
                  } else {
                    return const Center(child: Text(''));
                  }
                }
              }),
            ),
          );
        });
  }
}
