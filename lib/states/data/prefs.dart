import 'package:flutter/foundation.dart';
import 'package:get_storage/get_storage.dart';

class Preference {
  static final prefs = GetStorage();
  static const loggedInFlag = 'loginFlag';
  static const rememberMeFlag = 'rememberFlag';
  static const loginEmail = 'loginEmail';
  static const loginPass = 'loginPass';
  static const userIdFlag = 'userIdFlag';
  static const userEmailFlag = 'emailFlag';
  static const userPhoneFlag = 'numberFlag';
  static const userImageFlag = 'imageFlag';
  static const userDetails = 'userDetails';
  static const userList = 'userList';
  static const userAddress = 'userAddress';

  static const bearerToken = 'bearerToken';
  static const bearerAdminToken = 'bearerAdminToken';
  static const bearerGuestToken = 'bearerGuestToken';

  static bool getLoggedInFlag() {
    return prefs.read(loggedInFlag) ?? false;
  }

  static void setLoggedInFlag(bool value) {
    prefs.write(loggedInFlag, value);
  }

  // get
  static bool getRememberMeFlag() => prefs.read(rememberMeFlag) ?? false;

  // set
  static void setRememberMeFlag(bool value) =>
      prefs.write(rememberMeFlag, value);

  static int getUserIdFlag() {
    return prefs.read(userIdFlag) ?? 0;
  }

  static void setUserIdFlag(int value) {
    prefs.write(userIdFlag, value);
  }

  // get
  static String getLoginEmail() => prefs.read(loginEmail) ?? '';

  // set
  static void setLoginEmail(String value) => prefs.write(loginEmail, value);

  // get
  static String getLoginPass() => prefs.read(loginPass) ?? '';

  // set
  static void setLoginPass(String value) => prefs.write(loginPass, value);

  static String getUserImageFlag() {
    return prefs.read(userImageFlag);
  }

  static void setUserImageFlag(String value) {
    prefs.write(userImageFlag, value);
  }

  static String getAddressFlag() {
    return prefs.read(userAddress) ?? '';
  }

  static void setAddressFlag(String value) {
    prefs.write(userAddress, value);
    if (kDebugMode) {
      print(userAddress);
    }
  }

  static String getEmailFlag() {
    return prefs.read(userEmailFlag) ?? '';
  }

  static void setEmailFlag(String value) {
    prefs.write(userEmailFlag, value);
  }

  static String getPhoneFlag() {
    return prefs.read(userPhoneFlag) ?? '';
  }

  static void setPhoneFlag(String value) {
    prefs.write(userPhoneFlag, value);
  }

  static String getUserToken() {
    return prefs.read(bearerToken) ?? '';
  }

  static void setUserToken(String value) {
    prefs.write(bearerToken, value);
  }

  static String getAdminToken() {
    return prefs.read(bearerAdminToken) ?? '';
  }

  static void setAdminTokenFlag(String value) {
    prefs.write(bearerAdminToken, value);
  }

  static String getGuestUserToken() {
    return prefs.read(bearerGuestToken) ?? '';
  }

  static void setGuestUserTokenFlag(String value) {
    prefs.write(bearerGuestToken, value);
  }

  static void logoutFn() {
    prefs.remove(loggedInFlag);
    prefs.remove(userDetails);
    prefs.remove(bearerGuestToken);
    prefs.remove(bearerToken);

  }

  // static CustomerModel getUserDetails() {
  //   var result = prefs.read(userDetails);
  //   return CustomerModel.fromJson(json.decode(result));
  // }

  // static void setUserDetails(CustomerModel value) {
  //   print('User Details: ${json.encode(value.toJson())}');
  //   prefs.write(userDetails, json.encode(value.toJson()));
  // }
  //
  // static List<EventModel> getUserList() {
  //   var result = prefs.read(userList);
  //   return List<EventModel>.from(json.decode(result));
  // }
  //
  // static void setUserList(EventModel value) {
  //   print('User list: ${json.encode(value.toJson())}');
  //   prefs.write(userList, json.encode(value.toJson()));
  // }

  static void clearAll() {
    if (kDebugMode) {
      print("clearing all the prefs");
    }
    prefs.erase();
  }
}
