

import '../../constants/strings.dart';
import '../data/prefs.dart';
import '../model/add_to_cart_model.dart';
import '../model/cart_item_list_model.dart';
import '../model/my_cart_model.dart';
import '../model/order_details_model.dart';
import 'base_client.dart';

class MyCartService {
  //for get cart
  static Future<MyCartModel> getMyCartDetails(
    String usrToken,
    bool loginFlag,
  ) async {
    String api = ConstantStrings.kGuestCartApi;
    if (loginFlag) {
      api = ConstantStrings.kMyCartApi;
    }
    var response = await BaseClient().get(
      api,
      usrToken,
    );
    MyCartModel obj = myCartModelFromJson(
      response.toString(),
    );
    return obj;
  }

  //for get orders
  static Future<OrderDetailsModel> getMyOrders(String orderId) async {
    print("order Id => ${orderId.replaceAll('"', '')}");

    var response = await BaseClient().get(
      "${ConstantStrings.kMyOrderDetailsApi}/${orderId.replaceAll('"', '')}",
      Preference.getAdminToken(),
    );
    OrderDetailsModel obj = orderDetailsModelFromJson(response.toString());
    return obj;
  }

  //for get cart
  static Future<String> getCartQuoteCode(String usrToken) async {
    var response = await BaseClient().post(
      ConstantStrings.kCartQuoteApi,
      null,
      usrToken,
    );

    String obj = response.toString();
    print('quote id');
    print(obj);
    return obj;
  }

  static Future<String> getCartId({
    required int customerId,
    required String userToken,
  }) async {
    var response = await BaseClient().post(
      '/V1/customers/$customerId/carts',
      null,
      userToken,
    );

    String obj = response.toString();
    print('quote id');
    print(obj);
    return obj;
  }

  //for get cart
  static Future<List<CartItemsListModel>> getMyCartList(
    String usrToken,
    bool loginFlag,
  ) async {
    var response;
    if (loginFlag) {
      response = await BaseClient().get(
        ConstantStrings.kMyCartListApi,
        usrToken,
      );
    } else {
      response = await BaseClient().get(
        ConstantStrings.kMyGuestCartListApi,
        usrToken,
      );
    }
    List<CartItemsListModel> obj = cartItemsModelFromJson(response.toString());
    return obj;
  }

  //add to cart
  static Future<dynamic> addToCart(
    AddToCartModel payloadObj,
    String token,
    bool loginFlag,
  ) async {
    var response;

    if (loginFlag) {
      response = await BaseClient().post(
        ConstantStrings.kAddToCartApi,
        payloadObj.toJson(),
        token,
      );
    } else {
      response = await BaseClient().post(
        ConstantStrings.kGuestAddToCartApi,
        payloadObj.toJson(),
        token,
      );
    }
    return response;
  }

  //for track order

  static Future<String> getOrderStatus(String orderId) async {
    print("order Id => ${orderId.replaceAll('"', '')}");

    var response = await BaseClient().get(
      "${ConstantStrings.kMyOrderDetailsApi}/${orderId.replaceAll('"', '')}/statuses",
      Preference.getAdminToken(),
    );
    String obj = response.toString();
    return obj;
  }

  //delete from cart
  static Future<dynamic> deleteCartItem(int itemId, String token) async {
    var response = await BaseClient().deleteData(
      "${ConstantStrings.kAddToCartApi}/$itemId",
      token,
    );
    return response;
  }

  //update cart item
  static Future<dynamic> updateCartItem({
    required int itemId,
    required String usrToken,
    required String skuNum,
    required int qty,
  }) async {
    var response = await BaseClient().put(
      api: "${ConstantStrings.kAddToCartApi}/$itemId",
      token: usrToken,
      payloadObj: {
        "cartItem": {
          "sku": skuNum,
          "qty": qty,
        },
      },
    );
    return response;
  }

  static Future<dynamic> applyCouponCode({
    required String code,
    required String userToken,
    required bool loginFlag,
  }) async {
    var response;
    if (loginFlag) {
      response = await BaseClient().put(
        api: "${ConstantStrings.kCouponCodeUserApi}/$code",
        token: userToken,
      );
    } else {
      response = await BaseClient().putCopy(
        api: "${ConstantStrings.kCouponCodeGuestApi}/$code",
      );
    }

    return response;
  }

  static Future<String> applyRedeemPoints({
    required String cartId,
    required String points,
  }) async {
    var response = await BaseClient().post(
      '/V1/rewards/$cartId/apply/$points',
      null,
      Preference.getAdminToken(),
    );

    String obj = response.toString();
    print('quote id');
    print(obj);
    return obj;
  }
}
