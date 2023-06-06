import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:kallukoshai/view/ui/screens/login/login.dart';
import '../../../../states/controller/login_controller.dart';
import '../home/home.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = '/splash';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final LoginController _loginController = Get.find<LoginController>();

  String _adminToken = '';

  @override
  void initState() {
    super.initState();
    Timer(Duration(milliseconds: 800), () {
      Get.to(LoginScreen());
    });

  }

  /*void navigating() async {
    _adminToken = await _loginController.getAdminToken();
    if (_adminToken.isNotEmpty) {
      Get.offAllNamed(HomeScreen.routeName);
    } else {
      navigating();
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'assets/images/logo.png',
            width: 200.w,
            height: 100.h,
          ),
          SpinKitPulse(
            itemBuilder: (BuildContext context, int index) {
              return DecoratedBox(
                decoration: BoxDecoration(
                  color: index.isEven ? Colors.red : Colors.green,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
