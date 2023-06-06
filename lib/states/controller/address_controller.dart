import 'package:get/get.dart';
import '../data/prefs.dart';
import '../model/add_shipping_address_model.dart';
import '../model/country_model.dart';
import '../model/edit_password_model.dart';
import '../model/profile_model.dart';
import '../model/shipping_address_response_model.dart';
import '../services/address_service.dart';
import '../utils/methods.dart';

class AddressController extends GetxController {
  RxBool addAddressLoadingFlag = true.obs;
  RxBool addShippingAddressLoadingFlag = true.obs;
  RxBool countryListLoadingFlag = true.obs;
  RxBool editPasswordLoadingFlag = true.obs;
  RxBool profileUpdating = true.obs;
  bool profileUpdated = false;

  ProfileModel? addAddressResObj;
  List<ShippingResponseModel> shippingResponseList =
      <ShippingResponseModel>[].obs;
  List<CountryModel> countryList = <CountryModel>[].obs;
  String? deleteResponse;

  void addAddress(
    String userToken,
    AddAddressModel addAddressModel, {
    EditPasswordModel? editPasswordModel,
  }) async {
    profileUpdating(true);
    addAddressLoadingFlag.value = true;
    if (editPasswordModel != null) {
      Methods.showLoading();
    }
    try {
      var response = await AddressService.addAddress(
        addAddressModel,
        userToken,
      );
      addAddressResObj = registrationModelFromJson(response.toString());
    } finally {
      addAddressLoadingFlag.value = false;
      if (editPasswordModel != null) {
        editPassword(userToken, editPasswordModel);
      }
    }
  }

  Future<bool> addShippingAddress(AddShippingAddressModel payloadObj) async {
    Methods.showLoading();
    addShippingAddressLoadingFlag.value = true;
    try {
      shippingResponseList = await AddressService.addShippingAddress(
        payloadObj,
      );
      if (shippingResponseList.isNotEmpty) {
        return true;
      }
    } finally {
      addShippingAddressLoadingFlag.value = false;
      Methods.hideLoading();
    }
    return false;
  }

  void getCountryList() async {
    countryListLoadingFlag.value = true;
    try {
      countryList =
          await AddressService.getCountryList(Preference.getUserToken());
    } finally {
      countryListLoadingFlag.value = false;
    }
  }

  void editPassword(
    String userToken,
    EditPasswordModel editPasswordModel,
  ) async {
    editPasswordLoadingFlag.value = true;
    try {
      var response = await AddressService.editPassword(
        editPasswordModel,
        userToken,
      );
      if (response == 'true') {
        profileUpdated = true;
        Preference.setLoginPass(editPasswordModel.newPassword);
      }

      // }
    } finally {
      editPasswordLoadingFlag.value = false;
      profileUpdating(false);
      Methods.hideLoading();
    }
  }
}
