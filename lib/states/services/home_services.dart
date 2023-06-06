import 'dart:convert';
import '../../constants/strings.dart';
import '../data/prefs.dart';
import '../model/category_list.dart';
import '../model/privacy_model.dart';
import 'base_client.dart';

class HomeService {
  //for get product
  static Future<dynamic> searchProduct({required String queryText}) async {
    var response = await BaseClient().get(
      '/V1/products?searchCriteria[filter_groups][0][filters][0][field]=name&searchCriteria[filter_groups][0][filters][0][value]=%$queryText%&searchCriteria[filter_groups][0][filters][0][condition_type]=like&searchCriteria[filter_groups][0][filters][1][field]=description&searchCriteria[filter_groups][0][filters][1][value]=%$queryText%&searchCriteria[filter_groups][0][filters][1][condition_type]=like&searchCriteria[filter_groups][0][filters][2][field]=short_description&searchCriteria[filter_groups][0][filters][2][value]=%$queryText%&searchCriteria[filter_groups][0][filters][2][condition_type]=like&searchCriteria[filter_groups][0][filters][3][field]=sku&searchCriteria[filter_groups][0][filters][3][value]=%$queryText%&searchCriteria[filter_groups][0][filters][3][condition_type]=like&searchCriteria[filter_groups][0][filters][4][field]=url_key&searchCriteria[filter_groups][0][filters][4][value]=%$queryText%&searchCriteria[filter_groups][0][filters][4][condition_type]=like',
      Preference.getAdminToken(),
    );
    return response;
  }

  //for get product
  static Future<dynamic> getProducts() async {
    var response = await BaseClient().get(
      '${ConstantStrings.kProductApi}fields=&searchCriteria[pageSize]=10',
      Preference.getAdminToken(),
    );
    return response;
  }

  //for get product
  static Future<List<CategoryListModel>> getProductCategoryList(
      String token, int categoryID) async {
    var response = await BaseClient().get(
      '${ConstantStrings.kCategoryApi}'
      'searchCriteria[filterGroups][0][filters][0][field]=parent_id&searchCriteria[filterGroups][0][filters][0][value]=$categoryID&searchCriteria[filterGroups][0][filters][0][conditionType]=eq',
      token,
    );

    var jsonRes = jsonDecode(response);
    // OrderModel obj = orderModelFromJson(jsonEncode(jsonRes["order"]));
    List<CategoryListModel> obj =
        categoryListModelFromJson(jsonEncode(jsonRes["items"]));

    return obj;
  }

  static Future<dynamic> getCategoryDetails(
      String token, int categoryID) async {
    var response = await BaseClient().get(
      '${ConstantStrings.kCategoryDetailsApi}$categoryID',
      token,
    );

    /*  var jsonRes = jsonDecode(response);
    CategoryDetailsResponseModel obj =
    categoryDetailsResponseModelFromJson(jsonEncode(jsonRes));
*/
    return response;
  }

/*  //for get product
  static Future<List<CategoryListModel>> getProductCategoryListByID(
      String token, int ID) async {
    var response = await BaseClient().get(
      '${ConstantStrings.kCategoryApi}'
          'searchCriteria[filterGroups][0][filters][0][field]=parent_id&searchCriteria[filterGroups][0][filters][0][value]=79&searchCriteria[filterGroups][0][filters][0][conditionType]=eq',
      token,
    );

    var jsonRes = jsonDecode(response);
    // OrderModel obj = orderModelFromJson(jsonEncode(jsonRes["order"]));
    List<CategoryListModel> obj =
    categoryListModelFromJson(jsonEncode(jsonRes["items"]));

    return obj;
  }*/

  static Future<PrivacyModel> getPrivacyPolicy() async {
    var response =
        await BaseClient().get(ConstantStrings.kPrivacyPolicyApi, '');
    PrivacyModel privacyModel = privacyModelFromJson(response.toString());

    return privacyModel;
  }

  static Future<dynamic> getProductsByCategoryId(String id) async {
    var response = await BaseClient().get(
      '${ConstantStrings.kProductApi}'
          'searchCriteria[filter_groups][0][filters][0][field]=category_id& searchCriteria[filter_groups][0][filters][0][value]=$id',
      '',
    );

    return response;
  }

  static Future<dynamic> contactUsApi(String name, String email, String reason,
      String phone, String message) async {
    var response = await BaseClient().post(
        '${ConstantStrings.kContactUsApi}'
            'contactForm[name]=$name&contactForm[email]=$email.com&contactForm[telephone]=$phone&contactForm[comment]=$message&contactForm[dropdown_department]=$reason',
        '',
        '');

    return response;
  }

  static Future<dynamic> getBannerList() async {
    var response = await BaseClient().getApi(
      ConstantStrings.kBannerListApi,
    );
    return response;
  }

  static Future<dynamic> getCategoriesList() async {
    var response = await BaseClient().getApi(
      ConstantStrings.kCategoriesListApi,
    );
    return response;
  }

  static Future<dynamic> getDepartmentList() async {
    var response = await BaseClient().getApi(
      ConstantStrings.kDepartmentListApi,
    );
    return response;
  }
}
