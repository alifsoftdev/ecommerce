import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/strings.dart';
import '../../../../helper/helper.dart';
import '../../../../states/controller/login_controller.dart';
import '../../../../states/data/prefs.dart';
import '../../../../states/utils/methods.dart';
import '../../widgets/box_with_image.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/custom_field.dart';
import '../home/home.dart';
import '../register/register.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = '/login';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginStateScreen();
}

class _LoginStateScreen extends State<LoginScreen> {
  final LoginController _loginCon = Get.find<LoginController>();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passCon = TextEditingController();
  bool _rememberFlag = false;

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  void initState() {
    _rememberFlag = Preference.getRememberMeFlag();
    if (_rememberFlag) {
      _emailCon.text = Preference.getLoginEmail();
      _passCon.text = Preference.getLoginPass();
    }

    _loginCon.loginLoadingFlag.listen((value) {
      if (!value && _loginCon.token != null) {
        Preference.setLoggedInFlag(true);
        Preference.setEmailFlag(_emailCon.text);
        Preference.setUserToken(
          _loginCon.token.toString().replaceAll('"', ''),
        );
        print("Get.previousRoute");
        print(Get.previousRoute);
        /*    if (Get.previousRoute.isNotEmpty) {
          Get.back();
        } else {*/
        Get.offAllNamed(HomeScreen.routeName);
        // }
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // banner with title
            /*   Image.asset(
                  'assets/images/top_banner.png',
                  width: double.infinity,
                  height: 267.h,
                  fit: BoxFit.fill,
                ),*/
            Stack(
              children: [
                Image.asset(
                  'assets/images/top_banner.png',
                  width: double.infinity,
                  height: 260.h,
                  fit: BoxFit.fill,
                ),
                Positioned(
                  top: 30.h,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Image.asset(
                      'assets/images/home_icon.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                )
              ],
            ),
            addH(20.h),
            Column(
              children: [
                Text(
                  'Hello Again!',
                  style: TextStyle(
                      fontFamily: ConstantStrings.kAppFont,
                      color: HexColor('#656E72'),
                      fontSize: 17.sp),
                ),
                Center(
                    child: Text(
                  'Welcome back',
                  style: TextStyle(
                      fontFamily: ConstantStrings.kAppFont,
                      fontWeight: FontWeight.bold,
                      color: HexColor('#048240'),
                      fontSize: 24.sp),
                )),
              ],
            ),
            addH(20.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 46.w),
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /*  const Text(
                          'User name',
                        ),*/
                    addH(10.h),
                    CustomField(
                      hintText: 'Email',
                      textCon: _emailCon,
                      inputType: TextInputType.emailAddress,
                      prefixIcon: 'assets/images/mail.png',
                      fillClr: Colors.white,
                      brdrClr: Colors.grey.shade200,
                      brdrRadius: 0,
                    ),
                    addH(10.h),
                    CustomField(
                      hintText: 'Password',
                      inputType: TextInputType.visiblePassword,
                      prefixIcon: 'assets/images/lock.png',
                      isPassField: true,
                      textCon: _passCon,
                      brdrClr: Colors.grey.shade200,
                      fillClr: Colors.white,
                      brdrRadius: 0,
                    ),
                    addH(20.h),
                    SizedBox(
                      width: double.infinity,
                      child: InkWell(
                        onTap: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  value: _rememberFlag,
                                  splashRadius: 0,
                                  side: BorderSide(
                                    color: Colors.grey.shade300,
                                  ),
                                  activeColor: HexColor('#048240'),
                                  onChanged: (value) => setState(
                                    () => _rememberFlag = value!,
                                  ),
                                ),
                                Text(
                                  'Remember me',
                                  style: TextStyle(
                                    fontFamily: ConstantStrings.kAppFont,
                                    fontSize: 16.sp,
                                    color: Colors.grey.shade600,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Forget Password?',
                              textAlign: TextAlign.right,
                              style: TextStyle(
                                fontFamily: ConstantStrings.kAppFont,
                                fontSize: 16.sp,
                                color: Colors.grey.shade600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    addH(30.h),
                    CustomBtn(
                      btnFn: () {
                        if (_key.currentState!.validate()) {
                          setState(() {
                            _loginFun();
                          });
                        } else {}
                      },
                      btnText: 'Login',
                      btnBgClr: HexColor('#048240'),
                      txtSize: 18,
                    ),
                    addH(40.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            _loginCon.getGuestUserToken();
                            /*    if (Get.previousRoute.isNotEmpty) {
                              Get.back();
                            } else {*/
                            Get.offAllNamed(HomeScreen.routeName);
                            //  }
                            Preference.setLoggedInFlag(false);
                          },
                          child: Text(
                            'Continue as guest',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontFamily: ConstantStrings.kAppFont,
                              fontSize: 18.sp,
                              color: ConstantColors.blackShade,
                            ),
                          ),
                        ),
                      ],
                    ),
                    addH(40.h),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text(
                        'Or Continue With',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: ConstantStrings.kAppFont,
                          fontSize: 16.sp,
                          color: HexColor('##656E72'),
                        ),
                      ),
                    ]),
                    addH(20.h),
                    Container(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 40, right: 40),
                        child: SizedBox(
                          child: InkWell(
                            onTap: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomContainer(
                                  imgUrl: 'assets/images/google.png',
                                ),
                                CustomContainer(
                                  imgUrl: 'assets/images/apple.png',
                                ),
                                CustomContainer(
                                  imgUrl: 'assets/images/facebook.png',
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    addH(40.h),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(bottom: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don\'t have an account?',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontFamily: ConstantStrings.kAppFont,
                              fontSize: 18.sp,
                              color: HexColor('#656E72'),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.toNamed(RegistrationScreen.routeName);
                            },
                            child: Text(
                              'Register',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontFamily: ConstantStrings.kAppFont,
                                fontWeight: FontWeight.bold,
                                fontSize: 18.sp,
                                color: HexColor('#048240'),
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
          ],
        ),
      ),
    );
  }

  void _loginFun() {
    if (_emailCon.text.isEmpty || _passCon.text.isEmpty) {
      Methods.showSnackbar(
        msg: 'Please fill all the empty fields!',
      );
      return;
    }
    if (_rememberFlag) {
      Preference.setLoginEmail(_emailCon.text);
    }
    Preference.setLoginPass(_passCon.text);
    Preference.setRememberMeFlag(_rememberFlag);
    _loginCon.loginLoadingFlag.value = true;
    _loginCon.getLogin(
      _emailCon.text,
      _passCon.text,
    );
    //   Get.defaultDialog(
    //       title: 'Processing..',
    //       content: Obx(() {
    //         if (_loginCon.loginLoadingFlag.value) {
    //           return const Center(
    //             child: CircularProgressIndicator(),
    //           );
    //         } else {
    //           if (_loginCon.token != null) {
    //             Preference.clearAll();
    //             Preference.setLoggedInFlag(true);
    //             Preference.setEmailFlag(_emailCon.text);
    //             Preference.setTokenFlag(_loginCon.token.toString());
    //             Preference.setAdminTokenFlag(_loginCon.adminToken.toString());
    //             // Preference.setUserIdFlag(
    //             //     _loginController.customerModel!.customerId);
    //             // Preference.setPasswordFlag(
    //             //     _loginController.customerModel!.password);
    //             // Preference.setNameFlag(_loginController.customerModel!.firstLastName);
    //             // Preference.setEmailFlag(_loginController.customerModel!.email);
    //             // Preference.setPhoneFlag(_loginController.customerModel!.phoneNo);
    //             // Preference.setAddressFlag(_loginController.customerModel!.customerAddressViewModel!.address);
    //             // Preference.setUserImageFlag(_loginController.customerModel!.image);

    //             Future.delayed(const Duration(seconds: 0), () {
    //               ///temp
    //               // Get.toNamed(HomePage.routeName);
    //               Get.back();
    //               if (Get.previousRoute.isNotEmpty) {
    //                 Get.back();
    //               } else {
    //                 Get.offAllNamed(HomeScreen.routeName);
    //               }
    //             });

    //             return const Text('Login success');
    //           } else {
    //             return InkWell(
    //                 onTap: () {
    //                   Get.back();
    //                 },
    //                 child: Column(
    //                   children: [
    //                     const Text('Invalid username & password'),
    //                     addH(20.h),
    //                     CustomBtn(
    //                       btnFn: () {
    //                         Get.back();
    //                       },
    //                       btnText: 'Try Again',
    //                       btnBgClr: Colors.green,
    //                       btnSize: Size(120.w, 40.h),
    //                     )
    //                   ],
    //                 ));
    //           }
    //         }
    //       }),
    //       radius: 10.0);
  }
}
