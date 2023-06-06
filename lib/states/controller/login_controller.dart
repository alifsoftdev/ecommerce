import 'dart:convert';

import 'package:get/get.dart';

import '../data/prefs.dart';
import '../services/login_services.dart';
import '../utils/methods.dart';

class LoginController extends GetxController {
  RxBool loginLoadingFlag = true.obs;
  RxBool adminLoadingFlag = true.obs;
  RxBool guestUserTokenLoadingFlag = true.obs;
  RxBool forgetPasswordLoadingFlag = true.obs;
  RxBool resetPasswordLoadingFlag = true.obs;

  // CustomerModel? customerModel;

  String? massage;
  String? resetMassage;
  String? token;
  String adminToken = '';
  String? guestUserToken;
  String resMgs = "Something went wrong!";

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  // from the bottom of android studio? is this dev branch yes now commit
  void getLogin(String userName, String password) async {
    Methods.showLoading();
    loginLoadingFlag.value = true;
    try {
      var response = await LoginService.userLogin(
        userName,
        password,
      );
      var responseData = jsonDecode(response);
      if (responseData is String) {
        token = response.toString();
      } else {
        var responseData = jsonDecode(response);
        Methods.showSnackbar(
          msg: responseData["message"],
          duration: 3,
        );
      }

      /*    var responseData = jsonDecode(response);


      if (responseData["message"] == null) {
        token = response.toString();
      } else {
        Methods.showSnackbar(
          msg: responseData["message"],
          duration: 3,
        );
      }
*/
      /*    if (token == null) {
        resMgs = response["message"];

        Methods.showSnackbar(
          msg: resMgs,
          duration: 3,
        );
      }*/

      /*  token = await LoginService.userLogin(
        userName,
        password,
      );*/
      print('Response Model: $token');
    } finally {
      loginLoadingFlag.value = false;
      Methods.hideLoading();
    }
  }

  // from the bottom of android studio? is this dev branch yes now commit
  Future<String> getAdminToken() async {
    adminLoadingFlag.value = true;
    // isLoginPressedFlag.value = true;
    try {
      adminToken = await LoginService.adminToken();
      //set admin token
      Preference.setAdminTokenFlag(adminToken);
      return adminToken;
    } finally {
      adminLoadingFlag.value = false;

      //  isLoginPressedFlag.value = false;
    }
  }

  //
  void getGuestUserToken() async {
    guestUserTokenLoadingFlag.value = true;
    // isLoginPressedFlag.value = true;
    try {
      guestUserToken = await LoginService.guestUserToken();
      //set admin token
      Preference.setGuestUserTokenFlag(guestUserToken.toString());
      print('Response guest token => : $guestUserToken');
    } finally {
      guestUserTokenLoadingFlag.value = false;
      //  isLoginPressedFlag.value = false;
    }
  }
}
