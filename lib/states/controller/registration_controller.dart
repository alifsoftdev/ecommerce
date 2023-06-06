import 'dart:convert';

import 'package:get/get.dart';

import '../model/customer_registration_model.dart';
import '../model/customer_response_model.dart';
import '../services/registration_service.dart';
import '../utils/methods.dart';

class RegistrationController extends GetxController {
  RxBool regLoading = true.obs;
  bool isRegistered = false;

  CustomerResponseModel? customerObj;
  String resMgs = "Something went wrong!";

  String? validateEmail(String value) {
    if (!GetUtils.isEmail(value)) {
      return "Provide valid Email";
    }
    return null;
  }

  void createAccount(CustomerRegistrationModel crModel) async {
    Methods.showLoading();
    regLoading.value = true;
    try {
      var response = await RegistrationService.userRegistration(
        crModel,
      );

      var responseData = jsonDecode(response);
      if (responseData["message"] == null) {
        customerObj = customerResponseModelFromJson(response.toString());
        isRegistered = true;
      } else {
        Methods.showSnackbar(
          msg: responseData["message"],
          duration: 3,
        );
      }
    } finally {
      regLoading.value = false;
      Methods.hideLoading();
    }
  }
} //
