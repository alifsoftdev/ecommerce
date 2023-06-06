import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/my_cart_totals.dart';
import '../services/cart_totals_service.dart';

class GetCartTotalsController extends GetxController {
  RxBool getCartTotalsLoadingFlag = true.obs;
  MyCartTotalsModel? cartTotals;

  void getCartTotals(String getToken) async {
    getCartTotalsLoadingFlag.value = true;
    try {
      cartTotals = await GetCartTotalsService.getCartTotals(getToken);

      print('Response Model: $cartTotals');
      print('Get Token: $getToken');
    } finally {
      getCartTotalsLoadingFlag.value = false;
    }
  }
}
