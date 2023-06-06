import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../constants/colors.dart';
import '../../../constants/strings.dart';
import '../../../states/data/prefs.dart';
import '../../../states/utils/methods.dart';
import '../screens/add_address/address_book.dart';
import '../screens/contact_us/contact_us.dart';
import '../screens/login/login.dart';
import '../screens/my_points/rewards.dart';
import '../screens/order/order_list.dart';
import '../screens/privacy_policy/data_and_privacy.dart';
import '../screens/product_page/product_page.dart';
import '../screens/profile/profile.dart';
import '../screens/wallet/wallet_screen.dart';
import '../screens/wish_list/wish_list_screen.dart';
import 'drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  CustomDrawer({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);

  bool _loginFlag = false;
  String _guestToken = '';

  @override
  Widget build(BuildContext context) {
    _loginFlag = Preference.getLoggedInFlag();
    _guestToken = Preference.getGuestUserToken();
    return Drawer(
        width: double.infinity,
        child: DefaultTabController(
          length: 2,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                height: 100.h,
                width: double.infinity,
                child: DrawerHeader(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 50.h,
                        width: 150.w,
                        child: SvgPicture.asset(
                          'assets/svg/logo.svg',
                          height: 40.h,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          scaffoldKey.currentState?.openEndDrawer();
                        },
                        child: SizedBox(
                          height: 40.h,
                          width: 40.w,
                          child: SvgPicture.asset(
                            'assets/svg/cancel.svg',
                            height: 40.h,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 50,
                color: Colors.white,
                child: TabBar(
                    labelColor: Colors.black,
                    unselectedLabelColor: ConstantColors.grayShade,
                    indicatorColor: Colors.black,
                    tabs: const [
                      Tab(text: "Menu"),
                      Tab(text: "Account"),
                    ]),
              ),
              Expanded(
                  child: Container(
                child: TabBarView(
                  children: [
                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 1070.h,
                              width: double.infinity,
                              child: Stack(
                                alignment: AlignmentDirectional.topCenter,
                                children: [
                                  Positioned(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            children: [
                                              DrawerItem(
                                                onClick: () {
                                                  /*  scaffoldKey.currentState
                                                      ?.openEndDrawer();*/
                                                  //  Get.to(HomeScreen());

                                                  Get.toNamed(
                                                      ProductPage.routeName,
                                                      arguments: [
                                                        '77',
                                                        "BIG SALE"
                                                      ]);
                                                },
                                                name: 'BIG SALE',
                                              ),
                                              DrawerItem(
                                                onClick: () {
                                                  //   Get.to(MyProfilePage());
                                                  Get.toNamed(
                                                      ProductPage.routeName,
                                                      arguments: [
                                                        '78',
                                                        "NEW IN STORE"
                                                      ]);
                                                },
                                                name: 'NEW IN STORE',
                                              ),
                                              DrawerItem(
                                                onClick: () {
                                                  //  Get.toNamed(MyPetsPage.routeName);
                                                  Get.toNamed(
                                                      ProductPage.routeName,
                                                      arguments: [
                                                        '79',
                                                        "FURNITURE"
                                                      ]);
                                                },
                                                name: 'FURNITURE',
                                              ),
                                              DrawerItem(
                                                onClick: () {
                                                  //  Get.to(MyCartPage());
                                                  Get.toNamed(
                                                      ProductPage.routeName,
                                                      arguments: [
                                                        '80',
                                                        "HOUSEHOLD"
                                                      ]);
                                                },
                                                name: 'HOUSEHOLD',
                                              ),
                                              DrawerItem(
                                                onClick: () {
                                                  //  Get.to(MyOrderPage());
                                                  Get.toNamed(
                                                      ProductPage.routeName,
                                                      arguments: [
                                                        '81',
                                                        "ROOMS"
                                                      ]);
                                                },
                                                name: 'ROOMS',
                                              ),
                                              DrawerItem(
                                                onClick: () {
                                                  //   Get.to(MyAppointments());
                                                  Get.toNamed(
                                                      ProductPage.routeName,
                                                      arguments: [
                                                        '82',
                                                        "HOME SOLUTIONS"
                                                      ]);
                                                },
                                                name: 'HOME SOLUTIONS',
                                              ),
                                              DrawerItem(
                                                onClick: () {
                                                  //   Get.to(MyEvents());
                                                  Get.toNamed(
                                                      ProductPage.routeName,
                                                      arguments: [
                                                        '83',
                                                        "GIFTS"
                                                      ]);
                                                },
                                                name: 'GIFTS',
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.all(
                                                            15.0),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.grey)),
                                                    child: Text(
                                                      'English',
                                                      style: TextStyle(
                                                        color: ConstantColors
                                                            .grayShade,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            ConstantStrings
                                                                .kAppFont,
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.all(
                                                            15.0),
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    decoration: BoxDecoration(
                                                        border: Border.all(
                                                            color:
                                                                Colors.grey)),
                                                    child: Text(
                                                      'Arabic',
                                                      style: TextStyle(
                                                        color: ConstantColors
                                                            .grayShade,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontFamily:
                                                            ConstantStrings
                                                                .kAppFont,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 1070.h,
                              width: double.infinity,
                              child: Stack(
                                alignment: AlignmentDirectional.topCenter,
                                children: [
                                  Positioned(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: Column(
                                            children: [
                                              DrawerItem(
                                                onClick: () {
                                                  if (_loginFlag) {
                                                    Get.toNamed(
                                                      ProfileScreen.routeName,
                                                    );
                                                  } else {
                                                    Methods.showSnackbar(
                                                      msg:
                                                          'You must login first!',
                                                    );
                                                  }
                                                },
                                                name: 'MY ACCOUNT',
                                              ),
                                              DrawerItem(
                                                onClick: () {
                                                  if (_loginFlag) {
                                                    Get.toNamed(
                                                      OrderList.routeName,
                                                    );
                                                  } else {
                                                    Methods.showSnackbar(
                                                      msg:
                                                          'You must login first!',
                                                    );
                                                  }
                                                },
                                                name: 'MY ORDERS',
                                              ),
                                              DrawerItem(
                                                onClick: () {
                                                  if (_loginFlag) {
                                                    Get.toNamed(
                                                      WishlistScreen.routeName,
                                                      arguments: [
                                                        "MY WISH LIST"
                                                      ],
                                                    );
                                                  } else {
                                                    Methods.showSnackbar(
                                                      msg:
                                                          'You must login first!',
                                                    );
                                                  }
                                                },
                                                name: 'MY WISH LIST',
                                              ),
                                              DrawerItem(
                                                onClick: () {
                                                  if (_loginFlag) {
                                                    Get.toNamed(
                                                      AddressBook.routeName,
                                                    );
                                                  } else {
                                                    Methods.showSnackbar(
                                                      msg:
                                                          'You must login first!',
                                                    );
                                                  }
                                                },
                                                name: 'ADDRESS BOOK',
                                              ),
                                              /*    DrawerItem(
                                                onClick: () {
                                                  //  Get.to(MyOrderPage());
                                                },
                                                name: 'MY RETURNS',
                                              ),*/
                                              DrawerItem(
                                                onClick: () {
                                                  if (_loginFlag) {
                                                    Get.toNamed(
                                                      RewardsScreen.routeName,
                                                    );
                                                  } else {
                                                    Methods.showSnackbar(
                                                      msg:
                                                          'You must login first!',
                                                    );
                                                  }
                                                },
                                                name: 'MY POINTS',
                                              ),
                                              /*    DrawerItem(
                                                onClick: () {
                                                  //   Get.to(MyEvents());
                                                },
                                                name: 'BROWSING HISTORY',
                                              ),
                                              DrawerItem(
                                                onClick: () {
                                                  //   Get.to(Membership());
                                                },
                                                name: 'REVIEW YOUR PURCHASES',
                                              ),*/
                                              DrawerItem(
                                                onClick: () {
                                                  if (_loginFlag) {
                                                    Get.toNamed(
                                                      WalletScreen.routeName,
                                                    );
                                                  } else {
                                                    Methods.showSnackbar(
                                                      msg:
                                                          'You must login first!',
                                                    );
                                                  }
                                                },
                                                name: 'MY WALLET',
                                              ),
                                              DrawerItem(
                                                onClick: () {
                                                  Get.toNamed(
                                                    PrivacyScreen.routeName,
                                                  );
                                                },
                                                name: 'DATA & PRIVACY',
                                              ),
                                              DrawerItem(
                                                onClick: () {
                                                  Get.toNamed(
                                                    ContactUsScreen.routeName,
                                                  );
                                                },
                                                name: 'CONTACT US',
                                              ),
                                              DrawerItem(
                                                onClick: () {
                                                  if (_loginFlag
                                                      //||
                                                      //                                                       _guestToken.isNotEmpty
                                                      ) {
                                                    AwesomeDialog(
                                                      context: context,
                                                      animType: AnimType.scale,
                                                      dialogType:
                                                          DialogType.warning,
                                                      title: 'Logout',
                                                      desc:
                                                          'Are you sure want to log out?',
                                                      btnOkOnPress: () {
                                                        Preference.logoutFn();
                                                        Get.offAllNamed(
                                                          LoginScreen.routeName,
                                                        );
                                                      },
                                                      btnCancelOnPress: () {},
                                                    ).show();
                                                  } else {
                                                    Get.offAllNamed(
                                                      LoginScreen.routeName,
                                                    );
                                                  }
                                                },
                                                name: _loginFlag
                                                    //     ||                                                        _guestToken.isNotEmpty
                                                    ? 'LOGOUT'
                                                    : 'LOGIN',
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}
