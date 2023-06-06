
import '../../constants/strings.dart';
import '../data/prefs.dart';
import 'base_client.dart';

class LoginService {
  //for login
  static Future<dynamic> userLogin(String userName, String password) async {
    var input = {
      "username": userName,
      "password": password,
    };

    var response = await BaseClient()
        .post(ConstantStrings.kLoginApi, input, Preference.getUserToken());

    //  String token = response.toString();
    return response;
  }

  //for get Admin Token
  static Future<String> adminToken() async {
    var input = {
      "username": 'kallukosai_api',
      "password": 'Royex.2022',
    };

    var response = await BaseClient()
        .post(ConstantStrings.kAdminTokenApi, input, Preference.getUserToken());

    String token = response.toString();
    return token;
  }

  //for get guestUser Token
  static Future<String> guestUserToken() async {
    // var input = {
    //   "username": 'kallukosai_api',
    //   "password": 'Royex.2022',
    // };

    var response = await BaseClient().post(
        ConstantStrings.kGuestUserTokenApi, {}, Preference.getAdminToken());
    // var jsonRes = jsonDecode(response);
    // OrderModel obj = orderModelFromJson(jsonEncode(jsonRes["order"]));
    // log('get final response: ${obj}');

    String token = response.toString();
    return token;
  }
}
