import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../model/create_order_model.dart';
import '../model/guest_order_model.dart';
import '../model/payment_info_req_model.dart';
import '../model/payment_info_response_model.dart';
import '../services/payment_service.dart';

class PaymentController extends GetxController {
  RxBool paymentInfoLoadingFlag = true.obs;
  RxBool createOrderLoadingFlag = true.obs;

  RxBool isProcessing = false.obs;
  Dio dio = Dio();

  PaymentInfoResponseModel? paymentInfoObj;

  String? orderId;

  void paymentInfo(PaymentInfoRequestModel payloadObj) async {
    paymentInfoLoadingFlag.value = true;
    try {
     // var response = await PaymentInfoService.PaymentInfo(payloadObj);
      paymentInfoObj = await PaymentInfoService.PaymentInfo(payloadObj);
    //  paymentInfoObj = paymentInfoResponseModelFromJson(response.toString());

      // if (kDebugMode) {
      //   print('uploade Response Model: ${payloadObj.toJson()}');
      // }
    } finally {
      paymentInfoLoadingFlag.value = false;
      //addPetLoadingFlag.value = false;
    }
  }

  void createOrder(CreateOrderModel payloadObj,GuestOrderModel guestOrderModel) async {
    createOrderLoadingFlag.value = true;
    try {
      orderId = await PaymentInfoService.CreateOrder(payloadObj,guestOrderModel);
      // if (kDebugMode) {
      //   print('uploade Response Model: ${payloadObj.toJson()}');
      // }
    } finally {
      createOrderLoadingFlag.value = false;
      //addPetLoadingFlag.value = false;
    }
  }
}
