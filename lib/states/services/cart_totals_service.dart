import 'dart:developer';

import '../../constants/strings.dart';
import '../data/prefs.dart';
import '../model/my_cart_totals.dart';
import 'base_client.dart';

class GetCartTotalsService {
  static Future<MyCartTotalsModel> getCartTotals(String token) async {
    var response =
        await BaseClient().get(ConstantStrings.kGetCartTotalsApi, token);

    print('profile token');
    print(Preference.getUserToken());

    MyCartTotalsModel obj = cartTotalsModelFromJson(response.toString());
    log('get carts total response: $obj');
    return obj;
  }
}
