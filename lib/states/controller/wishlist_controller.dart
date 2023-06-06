import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../model/wishlist_model.dart';
import '../services/wishlist_service.dart';
import '../utils/methods.dart';

class WishlistController extends GetxController {
  RxBool getWishlistLoadingFlag = true.obs;
  RxBool addWishlistLoadingFlag = true.obs;
  WishlistModel? wishlistModel;
  bool isFavourite = false;
  String resMgs = "Something went wrong!";
  String response = 'false';

  void getWishlist(String getToken) async {
    Methods.showLoading();
    getWishlistLoadingFlag.value = true;
    try {
      var response = await GetWishlistService.getWishlist(getToken);
      wishlistModel = wishlistModelFromJson(response.toString());

      print('Response Model: $wishlistModel');
      print('Get Token: $getToken');
    } finally {
      getWishlistLoadingFlag.value = false;
      Methods.hideLoading();
    }
  }

  void addToWishlist(String productId, String userToken) async {
    Methods.showLoading();
    addWishlistLoadingFlag.value = true;
    try {
      response = await GetWishlistService.addToWishlist(
        productId,
        userToken,
      );
      print("respoooonse $response");
      if (response == 'true') {
        isFavourite = true;
      } else {
        isFavourite = false;
      }
      print("fav add $isFavourite");
    } finally {
      addWishlistLoadingFlag.value = false;
      Methods.hideLoading();
    }
  }

  void removeFromWishlist(int id, String userToken) async {
    Methods.showLoading();
    addWishlistLoadingFlag.value = true;

    try {
      response = await GetWishlistService.deleteFromWishlist(
        id,
        userToken,
      );

      if (response == 'true') {
        isFavourite = false;
        getWishlist(userToken);
      } else {
        isFavourite = true;
      }
      print("fav del $isFavourite");
    } finally {
      addWishlistLoadingFlag.value = false;
      Methods.hideLoading();
    }
    //return response;
  }
}
