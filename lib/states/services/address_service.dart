
import '../../constants/strings.dart';
import '../data/prefs.dart';
import '../model/add_shipping_address_model.dart';
import '../model/country_model.dart';
import '../model/edit_password_model.dart';
import '../model/profile_model.dart';
import '../model/shipping_address_response_model.dart';
import 'base_client.dart';

class AddressService {
  static Future<List<CountryModel>> getCountryList(String token) async {
    var response =
        await BaseClient().getApi(ConstantStrings.kGetCountryListApi);
    List<CountryModel> obj = countryModelFromJson(response.toString());
    return obj;
  }

  static Future<dynamic> addAddress(
    AddAddressModel addAddressModel,
    String usrToken,
  ) async {
    var response = await BaseClient().put(
      api: ConstantStrings.kGetProfileApi,
      token: usrToken,
      payloadObj: addAddressModel.toJson(),
    );
    return response;
  }

  //for add shipping address
  static Future<List<ShippingResponseModel>> addShippingAddress(
      AddShippingAddressModel shippingAddressModel) async {
    /*var input = {
      "username": userName,
      "password": password,
    };*/
    var response;
    if (Preference.getLoggedInFlag()) {
      response = await BaseClient().post(ConstantStrings.kAddShippingAddressApi,
          shippingAddressModel.toJson(), Preference.getUserToken());
    } else {
      response = await BaseClient().post(
          ConstantStrings.kGuestAddShippingAddressApi,
          shippingAddressModel.toJson(),
          Preference.getUserToken());
    }

    List<ShippingResponseModel> obj =
        shippingResponseModelFromJson(response.toString());
    return obj;
  }

  static Future<dynamic> editPassword(
    EditPasswordModel editPasswordModel,
    String usrToken,
  ) async {
    var response = await BaseClient().put(
      api: ConstantStrings.kEditPasswordApi,
      token: usrToken,
      payloadObj: editPasswordModel.toJson(),
    );
    return response;
  }
}
