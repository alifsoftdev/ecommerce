import '../../constants/strings.dart';
import 'base_client.dart';

class RewardsService {
  static Future<dynamic> getRewardsEarningMethods(String adminToken) async {
    var response = await BaseClient().get(ConstantStrings.kEarnRewardsRulesApi, adminToken);
    return response;
  }
  static Future<dynamic> getRewardsSpendingRules(String adminToken) async {
    var response = await BaseClient().get(ConstantStrings.kSpendRewardsRulesApi, adminToken);
    return response;
  }

  static Future<dynamic> getRewardPoints(int userId,String adminToken) async {
    var response = await BaseClient().get('${ConstantStrings.kRewardPointsApi}''$userId', adminToken);
    return response;
  }
  static Future<dynamic> getRewardsHistoryApi(String customerToken) async {
    var response = await BaseClient().get(ConstantStrings.kRewardsHistoryApi, customerToken);
    return response;
  }
}