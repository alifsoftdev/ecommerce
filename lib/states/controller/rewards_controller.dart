import 'package:get/get.dart';
import '../model/earn_rewards_model.dart';
import '../model/rewards_history_response_model.dart';
import '../model/spend_rewards_model.dart';
import '../services/rewards_service.dart';

class RewardsController extends GetxController {
  RxBool earnRewardsLoadingFlag = true.obs;
  RxBool spendRewardsLoadingFlag = true.obs;
  RxBool rewardPointsLoadingFlag = true.obs;
  RxBool rewardsHistoryLoadingFlag = true.obs;

  EarnRewardsModel? earnRewardsModel;
  SpendRewardsModel? spendRewardsModel;
  // late String rewardPoints ;
  List<RewardsHistoryResponseModel>? rewardsHistoryList;

  void getRewardsEarningMethods(String adminToken) async {
    earnRewardsLoadingFlag.value = true;
    try {
      var response = await RewardsService.getRewardsEarningMethods(adminToken);
      earnRewardsModel = earnRewardsModelFromJson(response.toString());
    } finally {
      earnRewardsLoadingFlag.value = false;
    }
  }

  void getRewardsSpendingRules(String adminToken) async {
    spendRewardsLoadingFlag.value = true;
    try {
      var response = await RewardsService.getRewardsSpendingRules(adminToken);
      spendRewardsModel = spendRewardsModelFromJson(response.toString());
    } finally {
      spendRewardsLoadingFlag.value = false;
    }
  }

  void getRewardsHistory(String customerToken) async {
    rewardsHistoryLoadingFlag.value = true;
    try {
      var response = await RewardsService.getRewardsHistoryApi(customerToken);
      rewardsHistoryList =
          rewardsHistoryResponseModelFromJson(response.toString());
    } finally {
      rewardsHistoryLoadingFlag.value = false;
    }
  }

/*  void getRewardPoints(int userID, String adminToken) async{
    rewardPointsLoadingFlag.value = true;
    try {
      var response = await RewardsService.getRewardPoints(userID, adminToken);
      rewardPoints = response;
    } finally {
      rewardPointsLoadingFlag.value = false;
    }
  }*/
}
