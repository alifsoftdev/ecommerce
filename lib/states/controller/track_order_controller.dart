import 'package:get/get.dart';
import '../model/cart_item_list_model.dart';
import '../model/cart_item_model.dart';
import '../model/my_cart_model.dart';
import '../model/order_details_model.dart';
import '../services/my_cart_services.dart';

class TrackOrderController extends GetxController {
  RxBool myCartLoadingFlag = true.obs;
  RxBool myOrderDetailsLoadingFlag = true.obs;
  RxBool myCartItemLoadingFlag = true.obs;
  RxBool addToCartLoadingFlag = true.obs;
  RxBool quoteLoadingFlag = true.obs;
  RxBool orderStatusLoadingFlag = true.obs;

  MyCartModel? myCartObj;

  List<CartItemsListModel> cartList = <CartItemsListModel>[].obs;

  CartItemModel? cartItem;
  OrderDetailsModel? orderDetails;
  String? status;
  String? quote;
  String? imageChecked;
  String? imageUnChecked;

  String? getImage(String? status, String title) {
    if (status != null) {
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

  bool showStatus(String? image) {
    imageChecked = 'assets/images/green_tick.png';

    if (image == imageChecked) {
      return true;
    } else {
      return false;
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

  void getOrderStatus(String orderId) async {
    orderStatusLoadingFlag.value = true;
    try {
      status = await MyCartService.getOrderStatus(orderId);
    } finally {
      orderStatusLoadingFlag.value = false;
      //  isFeatureFavoriteLoadingFlag.value = false;
    }
  }
}
