import '../../constants/strings.dart';
import '../data/prefs.dart';
import '../model/create_order_model.dart';
import '../model/guest_order_model.dart';
import '../model/payment_info_req_model.dart';
import '../model/payment_info_response_model.dart';
import 'base_client.dart';

class PaymentInfoService {
  //payment info services
  static Future<PaymentInfoResponseModel> PaymentInfo(
      PaymentInfoRequestModel paymentInfo) async {
    var response;
    if (Preference.getLoggedInFlag()) {
      response = await BaseClient().post(ConstantStrings.kPaymentInfoApi,
          paymentInfo.toJson(), Preference.getUserToken());
    } else {
      response = await BaseClient().post(
          ConstantStrings.kGuestShippingInformationApi,
          paymentInfo.toJson(),
          Preference.getUserToken());
    }

    /*
    var response = await BaseClient().post(ConstantStrings.kPaymentInfoApi,
        paymentInfo.toJson(), Preference.getUserToken());
    */
    PaymentInfoResponseModel obj =
        paymentInfoResponseModelFromJson(response.toString());
    return obj;
  }

  //create oder services
  static Future<String> CreateOrder(CreateOrderModel paymentInfo,GuestOrderModel guestOrderModel) async {
    var response;
    if (Preference.getLoggedInFlag()) {
    response = await BaseClient().post(ConstantStrings.kCreateOrderApi,
          paymentInfo.toJson(), Preference.getUserToken());
    } else {
      response = await BaseClient().post(ConstantStrings.kGuestCreateOrderApi,
          guestOrderModel.toJson(), Preference.getUserToken());
      print('guest response id $response');
    }



    String orderId = response.toString();
    return orderId;
  }
}
