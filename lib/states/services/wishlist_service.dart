import 'dart:developer';

import '../../constants/strings.dart';
import '../data/prefs.dart';
import 'base_client.dart';

class GetWishlistService {
  static Future<dynamic> getWishlist(String token) async {
    var response =
        await BaseClient().get(ConstantStrings.kGetWishlistApi, token);

    print('profile token');
    print(Preference.getUserToken());

    return response;
  }

  static Future<dynamic> addToWishlist(
    String productId,
    String usrToken,
  ) async {
    var response = await BaseClient().put(
      api: "${ConstantStrings.kGetWishlistApi}/$productId",
      token: usrToken,
    );

    print('profile token ${Preference.getUserToken()}');

    String obj = response.toString();
    log('get wishlist response: $obj');
    return obj;
  }

  static Future<dynamic> deleteFromWishlist(
    int itemId,
    String usrToken,
  ) async {
/*    var response = await BaseClient().deleteData(
      api: "${ConstantStrings.kGetWishlistApi}/$itemId",
      token: usrToken,
    );*/
    var response = await BaseClient()
        .deleteData("${ConstantStrings.kGetWishlistApi}/$itemId", usrToken);
    print('profile token ${Preference.getUserToken()}');

    String obj = response.toString();
    log('get wishlist response: $obj');
    return obj;
  }
}
