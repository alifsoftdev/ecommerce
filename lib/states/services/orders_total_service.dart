import 'dart:developer';
import '../../constants/strings.dart';
import '../data/prefs.dart';
import '../model/my_oders.dart';
import '../model/orders_total_model.dart';
import 'base_client.dart';

class GetOrdersTotalService {
  static Future<OrdersTotalModel> getOrdersTotal(String token) async {
    var response = await BaseClient().get(
        '${ConstantStrings.kMyOrderDetailsApi}'
        '?searchCriteria[filterGroups][][filters][][field]=customer_email&searchCriteria[filterGroups][0][filters][0][value]='
        '${Preference.getEmailFlag()}',
        Preference.getAdminToken());

    print('profile email');
    print(Preference.getEmailFlag());

    OrdersTotalModel obj = ordersTotalModelFromJson(response.toString());
    log('get carts total response: $obj');
    return obj;
  }

  static Future<MyOrdersModel> getMyOrders(String token) async {
    var response = await BaseClient().get(
      '${ConstantStrings.kMyOrderDetailsApi}'
      '?searchCriteria[filterGroups][][filters][][field]=customer_email&searchCriteria[filterGroups][0][filters][0][value]='
      '${Preference.getEmailFlag()}&searchCriteria[sortOrders][1][field]=entity_id&searchCriteria[sortOrders][0][direction]=DESC',
      // '?searchCriteria[filterGroups][][filters][][field]=customer_email&searchCriteria[filterGroups][0][filters][0][value]='
      // '${Preference.getEmailFlag()}',
      token,
    );

    print('profile email');
    print(Preference.getEmailFlag());

    MyOrdersModel obj = myOrdersModelFromJson(response.toString());
    log('get my orders response: $obj');
    return obj;
  }
}
