import 'package:get/get.dart';

import '../data/prefs.dart';
import '../model/profile_model.dart';
import '../services/get_profile_service.dart';

class GetCustomerController extends GetxController {
  RxBool getPCustomerLoadingFlag = true.obs;
  ProfileModel? userProfile;

  @override
  void onInit() {
    super.onInit();
    updateCustomer(Preference.getUserToken());
  }

  void updateCustomer(String getToken) async {
    getPCustomerLoadingFlag.value = true;
    try {
      userProfile = await GetProfileService.getProfile(getToken);

      print('Response Model: $userProfile');
      print('Get Token: $getToken');
    } finally {
      getPCustomerLoadingFlag.value = false;
    }
  }
}
