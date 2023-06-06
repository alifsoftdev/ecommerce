import 'dart:developer';
import '../../constants/strings.dart';
import '../data/prefs.dart';
import '../model/profile_model.dart';
import 'base_client.dart';

class GetProfileService {
  static Future<ProfileModel> getProfile(String token) async {
    var response =
        await BaseClient().get(ConstantStrings.kGetProfileApi, token);

    print('profile token');
    print(Preference.getUserToken());

    ProfileModel obj = registrationModelFromJson(response.toString());
    log('get profile response: $obj');

    return obj;
  }
}
