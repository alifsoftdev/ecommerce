import '../../constants/strings.dart';
import '../data/prefs.dart';
import '../model/customer_registration_model.dart';
import 'base_client.dart';

class RegistrationService {
  static Future<dynamic> userRegistration(
      CustomerRegistrationModel customerRequestModel) async {
    var response = await BaseClient().post(ConstantStrings.kRegistrationApi,
        customerRequestModel.toJson(), Preference.getUserToken());
    return response;
  }
}
