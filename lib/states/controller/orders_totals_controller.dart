import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../data/prefs.dart';
import '../model/my_oders.dart';
import '../model/orders_total_model.dart';
import '../services/orders_total_service.dart';

class GetOrdersTotalController extends GetxController {
  RxBool getOrdersTotalLoadingFlag = true.obs;
  RxBool getOrdersLoadingFlag = true.obs;
  OrdersTotalModel? ordersTotal;
  MyOrdersModel? myOrdersModel;

  void getOrdersTotal(String getToken) async {
    getOrdersTotalLoadingFlag.value = true;
    try {
      ordersTotal = await GetOrdersTotalService.getOrdersTotal(getToken);

      print('Response Model: $ordersTotal');
      print('Get Token: $getToken');
    } finally {
      getOrdersTotalLoadingFlag.value = false;
    }
  }

  void getMyOrders() async {
    getOrdersLoadingFlag.value = true;
    try {
      myOrdersModel = await GetOrdersTotalService.getMyOrders(
        Preference.getAdminToken(),
      );
      print('Response Model: $myOrdersModel');
    } finally {
      getOrdersLoadingFlag.value = false;
    }
  }
}
