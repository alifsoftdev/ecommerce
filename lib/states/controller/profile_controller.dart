import 'package:get/get.dart';
import '../data/prefs.dart';
import '../model/profile_model.dart';
import '../services/get_profile_service.dart';
import '../services/rewards_service.dart';

class ProfileController extends GetxController {
  RxBool profileLoading = true.obs;
  RxBool rewardPointsLoadingFlag = true.obs;
  ProfileModel? userProfile;
  bool isRewardsNavigation = false;
  late String rewardPoints;

  void getProfileDetails(
    String getToken,
    String adminToken,
    bool isRewardsNavigation,
  ) async {
    profileLoading.value = true;
    try {
      userProfile = await GetProfileService.getProfile(getToken);

      if (userProfile != null) {
        Preference.setUserIdFlag(userProfile!.id);
      }
    } finally {
      profileLoading.value = false;
      if (isRewardsNavigation) {
        getRewardPoints(userProfile!.id, adminToken);
      }
    }
  }

  void getRewardPoints(int userID, String adminToken) async {
    rewardPointsLoadingFlag.value = true;
    try {
      var response = await RewardsService.getRewardPoints(userID, adminToken);
      rewardPoints = response;
    } finally {
      rewardPointsLoadingFlag.value = false;
    }
  }
}
