import 'dart:convert';

import 'package:get/get.dart';
import '../model/add_to_cart_model.dart';
import '../model/cart_item_list_model.dart';
import '../model/cart_item_model.dart';
import '../model/my_cart_model.dart';
import '../model/order_details_model.dart';
import '../services/my_cart_services.dart';
import '../utils/methods.dart';

class MyCartController extends GetxController {
  RxBool myCartLoadingFlag = true.obs;
  RxBool myOrderDetailsLoadingFlag = true.obs;
  RxBool myCartItemLoadingFlag = true.obs;
  RxBool addToCartLoadingFlag = true.obs;
  RxBool cartIdLoadingFlag = true.obs;
  RxBool quoteLoadingFlag = true.obs;
  RxBool orderStatusLoadingFlag = true.obs;
  RxBool deleteCartItemLoadingFlag = true.obs;
  RxBool couponCodeLoadingFlag = true.obs;
  RxBool redeemPointsLoadingFlag = true.obs;

  MyCartModel? myCartObj;
  bool isAddedToCart = false;

  List<CartItemsListModel> cartList = <CartItemsListModel>[].obs;

  CartItemModel? cartItem;
  OrderDetailsModel? orderDetails;
  String? status;
  String? quote;
  String? cartId;
  String? imageChecked;
  String? imageUnChecked;
  String resMgs = "Something went wrong!";
  bool isCouponApply = false;
  bool isRedeemPointsApply = false;

  void getMyCartDetails(String userToken, bool loginFlag) async {
    myCartLoadingFlag.value = true;
    try {
      myCartObj = await MyCartService.getMyCartDetails(userToken, loginFlag);
    } finally {
      myCartLoadingFlag.value = false;
      //  isFeatureFavoriteLoadingFlag.value = false;
    }
  }

  void getMyOrderDetails(String orderId) async {
    myOrderDetailsLoadingFlag.value = true;
    try {
      orderDetails = await MyCartService.getMyOrders(orderId);
    } finally {
      myOrderDetailsLoadingFlag.value = false;
      //  isFeatureFavoriteLoadingFlag.value = false;
    }
  }

  //get car quote code
  void getCartQuoteCode(String userToken) async {
    quoteLoadingFlag.value = true;
    try {
      quote = await MyCartService.getCartQuoteCode(userToken);
      print('quote id $quote');
    } finally {
      quoteLoadingFlag.value = false;
      //  isFeatureFavoriteLoadingFlag.value = false;
    }
  }

  void getCartId({
    required int customerId,
    required String userToken,
  }) async {
    cartIdLoadingFlag.value = true;
    try {
      cartId = await MyCartService.getCartId(
          customerId: customerId, userToken: userToken);
      print('cartId $cartId');
    } finally {
      cartIdLoadingFlag.value = false;
    }
  }

  void applyRedeemPoints({
    required String points,
  }) async {
    redeemPointsLoadingFlag.value = true;
    try {
      var response = await MyCartService.applyRedeemPoints(
        cartId: cartId.toString(),
        points: points,
      );
      isRedeemPointsApply = true;
    } finally {
      redeemPointsLoadingFlag.value = false;
    }
  }

  void getMyCartItems(String userToken, bool loginFlag) async {
    myCartItemLoadingFlag.value = true;
    try {
      cartList = await MyCartService.getMyCartList(userToken, loginFlag);
    } finally {
      myCartItemLoadingFlag.value = false;
      //  isFeatureFavoriteLoadingFlag.value = false;
    }
  }

  void addToCart(
      AddToCartModel payloadObj, String token, bool loginFlag) async {
    Methods.showLoading();
    addToCartLoadingFlag.value = true;
    try {
      var response =
          await MyCartService.addToCart(payloadObj, token, loginFlag);

      var responseData = jsonDecode(response);
      if (responseData["message"] == null) {
        cartItem = cartItemModelFromJson(response.toString());
        isAddedToCart = true;
      } else {
        isAddedToCart = false;
        Methods.showSnackbar(
          msg: responseData["message"],
          duration: 3,
        );
      }

      //await MyCartService.addToCart(payloadObj, token, loginFlag);

      /*  if (kDebugMode) {
        // print('cart Response Model: ${cartRequestObj}');
      }*/
    } finally {
      addToCartLoadingFlag.value = false;
      Methods.hideLoading();
    }
  }

  void getOrderStatus(String orderId) async {
    orderStatusLoadingFlag.value = true;
    try {
      status = await MyCartService.getOrderStatus(orderId);
    } finally {
      orderStatusLoadingFlag.value = false;
      //  isFeatureFavoriteLoadingFlag.value = false;
    }
  }

  String? getImage(String? status, String title) {
    if (status != null) {
      print(status);
      print(title);
      imageUnChecked = 'assets/images/green_unchecked_circle.png';
      imageChecked = 'assets/images/green_tick.png';
      if (status == 'complete') {
        return imageChecked;
      } else if (status == 'processing') {
        if (title == 'Pending') {
          return imageChecked;
        } else if (title == 'Processing') {
          return imageChecked;
        } else {
          return imageUnChecked;
        }
      } else if (status == 'pending') {
        if (title == 'Pending') {
          return imageChecked;
        } else {
          return imageUnChecked;
        }
      } else if (status == 'shipped') {
        if (title == 'Completed') {
          return imageUnChecked;
        } else {
          return imageChecked;
        }
      } else {
        return imageUnChecked;
      }
    } else {
      return imageUnChecked;
    }
  }

  // Future<bool>
  void deleteCartItem(
    CartItemsListModel item,
    String token,
    bool loginFlag,
  ) async {
    Methods.showLoading();
    deleteCartItemLoadingFlag.value = true;
    try {
      var response = await MyCartService.deleteCartItem(item.itemId, token);
      if (response == 'true') {
        // return true;
        getMyCartDetails(token, loginFlag);
        getMyCartItems(token, loginFlag);
      }
    } finally {
      deleteCartItemLoadingFlag.value = false;
      Methods.hideLoading();
    }
    // return false;
  }

  void updateCartItem({
    required int itemId,
    required String userToken,
    required String skuNumber,
    required int qty,
    required bool isLogin,
  }) async {
    Methods.showLoading();
    try {
      var response = await MyCartService.updateCartItem(
        itemId: itemId,
        usrToken: userToken,
        skuNum: skuNumber,
        qty: qty,
      );
      if (response != null) {
        getMyCartDetails(userToken, isLogin);
        getMyCartItems(userToken, isLogin);
      }
    } finally {
      Methods.hideLoading();
    }
  }

  void applyCouponCode({
    required String code,
    required String userToken,
    required bool loginFlag,
  }) async {
    couponCodeLoadingFlag.value = true;
    Methods.showLoading();
    try {
      var response = await MyCartService.applyCouponCode(
        code: code,
        userToken: userToken,
        loginFlag: loginFlag,
      );
      if (response != null) {
        print('Kofj');
        isCouponApply = true;
      }
    } finally {
      couponCodeLoadingFlag.value = false;
      Methods.hideLoading();
    }
  }
}
