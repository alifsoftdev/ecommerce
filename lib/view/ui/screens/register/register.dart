import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../constants/colors.dart';
import '../../../../constants/strings.dart';
import '../../../../helper/helper.dart';
import '../../../../states/controller/login_controller.dart';
import '../../../../states/controller/registration_controller.dart';
import '../../../../states/data/prefs.dart';
import '../../../../states/model/customer_registration_model.dart';
import '../../../../states/utils/methods.dart';
import '../../widgets/box_with_image.dart';
import '../../widgets/custom_btn.dart';
import '../../widgets/custom_field.dart';
import '../home/home.dart';

class RegistrationScreen extends StatefulWidget {
  static String routeName = '/register';

  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _RegistrationScreen();
}

class _RegistrationScreen extends State<RegistrationScreen> {
  final RegistrationController _regCon = Get.find<RegistrationController>();
  final LoginController _authCon = Get.find<LoginController>();
  final TextEditingController _fNameCon = TextEditingController();
  final TextEditingController _lNameCon = TextEditingController();
  final TextEditingController _emailCon = TextEditingController();
  final TextEditingController _passCon = TextEditingController();
  final TextEditingController _phoneCon = TextEditingController();
  final TextEditingController _confirmPassCon = TextEditingController();
  bool _agreeFlag = false;

  @override
  void initState() {
    super.initState();
    _regCon.regLoading.listen((value) {
      if (!value && _regCon.isRegistered) {
        Get.back();
        Methods.showSnackbar(
          icon: Icons.check,
          title: 'Registration Completed!',
          msg: "Please login to you new account.",
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // top banner with logo
            SizedBox(
              width: double.infinity,
              height: 165.h,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/top_banner.png',
                    width: double.infinity,
                    height: 165.h,
                    fit: BoxFit.fill,
                  ),
                  Positioned(
                    top: 40.h,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        addH(20.h),
                        Image.asset(
                          'assets/images/home_icon.png',
                          width: 100.h,
                          height: 50.h,
                          fit: BoxFit.fill,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // greeting text
            Column(
              children: [
                Text(
                  'Hello!',
                  style: TextStyle(
                      fontFamily: ConstantStrings.kAppFont,
                      color: HexColor('#656E72'),
                      fontSize: 17.sp),
                ),
                Center(
                  child: Text(
                    'Sign up to Get Started',
                    style: TextStyle(
                        fontFamily: ConstantStrings.kAppFont,
                        fontWeight: FontWeight.bold,
                        color: HexColor('#048240'),
                        fontSize: 24.sp),
                  ),
                ),
              ],
            ),
            addH(20.h),
            // fields
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addH(10.h),
                  CustomField(
                    hintText: 'First name',
                    textCon: _fNameCon,
                    inputType: TextInputType.name,
                    prefixIcon: 'assets/images/user_name.png',
                  ),
                  addH(10.h),
                  CustomField(
                    hintText: 'Last name',
                    textCon: _lNameCon,
                    inputType: TextInputType.name,
                    prefixIcon: 'assets/images/user_name.png',
                  ),
                  addH(10.h),

                  CustomField(
                    hintText: 'Phone number',
                    textCon: _phoneCon,
                    inputType: TextInputType.number,
                    prefixIcon: 'assets/images/user_name.png',
                  ),
                  addH(10.h),

                  CustomField(
                    hintText: 'Email',
                    textCon: _emailCon,
                    inputType: TextInputType.emailAddress,
                    prefixIcon: 'assets/images/mail.png',
                  ),
                  addH(10.h),
                  CustomField(
                    hintText: 'Password',
                    prefixIcon: 'assets/images/lock.png',
                    isPassField: true,
                    textCon: _passCon,
                  ),
                  addH(10.h),
                  //  CustomTextField(
                  CustomField(
                    hintText: 'Retype Password',
                    prefixIcon: 'assets/images/lock.png',
                    isPassField: true,
                    textCon: _confirmPassCon,
                  ),
                  addH(20.h),

                  SizedBox(
                    width: double.infinity,
                    child: InkWell(
                      onTap: () => setState(
                        () => _agreeFlag = !_agreeFlag,
                      ),
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            value: _agreeFlag,
                            splashRadius: 0,
                            side: BorderSide(
                              color: Colors.grey.shade300,
                            ),
                            activeColor: HexColor('#048240'),
                            onChanged: (value) => setState(
                              () => _agreeFlag = value!,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'By signing up you agree to our ',
                                    style: TextStyle(
                                      fontFamily: ConstantStrings.kAppFont,
                                      fontSize: 14.sp,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  Text(
                                    'User Agreement',
                                    style: TextStyle(
                                      fontFamily: ConstantStrings.kAppFont,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    'Privacy Policy ',
                                    style: TextStyle(
                                      fontFamily: ConstantStrings.kAppFont,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  Text(
                                    ' and ',
                                    style: TextStyle(
                                      fontFamily: ConstantStrings.kAppFont,
                                      fontSize: 14.sp,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                  Text(
                                    'Terms & Conditions',
                                    style: TextStyle(
                                      fontFamily: ConstantStrings.kAppFont,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.sp,
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  addH(30.h),
                  CustomBtn(
                    btnFn: () {
                      Get.to(()=>const HomeScreen());
                    },
                    btnText: 'Register',
                    btnBgClr: HexColor('#048240'),
                    txtSize: 18,
                  ),
                  addH(20.h),
                  Center(
                    child: InkWell(
                      onTap: () {
                        _authCon.getGuestUserToken();
                        Preference.setLoggedInFlag(false);
                        Get.offAllNamed(HomeScreen.routeName);
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
                  ),
                  addH(20.h),
                  Center(
                    child: Text(
                      'Or Continue With',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: ConstantStrings.kAppFont,
                        fontSize: 16.sp,
                        color: HexColor('##656E72'),
                      ),
                    ),
                  ),
                  addH(20.h),
                  Container(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40, right: 40),
                      child: SizedBox(
                        child: InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CustomContainer(
                                imgUrl: 'assets/images/google.png',
                              ),
                              CustomContainer(
                                imgUrl: 'assets/images/apple.png',
                              ),
                              CustomContainer(
                                imgUrl: 'assets/images/facebook.png',
                              ),
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
                          'Have an account? ',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: ConstantStrings.kAppFont,
                            fontSize: 18.sp,
                            color: HexColor('#656E72'),
                          ),
                        ),
                        InkWell(
                          onTap: () => Get.back(),
                          child: Text(
                            'Login',
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
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _createAccount() {
    if (_fNameCon.text.isEmpty ||
        _lNameCon.text.isEmpty ||
        _emailCon.text.isEmpty ||
        _passCon.text.isEmpty ||
        _phoneCon.text.isEmpty ||
        _confirmPassCon.text.isEmpty) {
      Methods.showSnackbar(
        msg: 'Please fill all the fields!',
      );
      return;
    }
    if (!_emailCon.text.isEmail) {
      Methods.showSnackbar(
        msg: 'Please enter a valid email!',
      );
      return;
    }
    if (_passCon.text != _confirmPassCon.text) {
      Methods.showSnackbar(
        msg: 'Passwords do not match!',
      );
      return;
    }
    if (!_agreeFlag) {
      Methods.showSnackbar(
        msg: 'You must agree with the policy and terms',
      );
      return;
    }
    Address address = Address(
        firstname: _fNameCon.text,
        lastname: _lNameCon.text,
        postcode: '',
        city: '',
        street: [],
        telephone: _phoneCon.text,
        countryId: '');
    List<Address> addressList = <Address>[];
    addressList.add(address);
    CustomerRegistrationModel crModel = CustomerRegistrationModel(
      customer: Customer(
        email: _emailCon.text,
        firstname: _fNameCon.text,
        lastname: _lNameCon.text,
        websiteId: 1,
        addresses: addressList,
      ),
      password: _passCon.text,
    );
    _regCon.createAccount(crModel);
  }
}
