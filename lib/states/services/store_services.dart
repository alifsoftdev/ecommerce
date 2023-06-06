import '../../constants/strings.dart';
import '../data/prefs.dart';
import '../model/product_details_model.dart';
import '../model/product_model.dart';
import '../model/sample_product_status_model.dart';
import 'base_client.dart';

class StoreService {
  //for product details
  static Future<ProductDetailsModel> getProductDetails(var sku) async {
    var response = await BaseClient().get(
        '${ConstantStrings.kStoreProductDetailsApi}/' + sku,
        Preference.getUserToken());
    ProductDetailsModel obj = productDetailsFromJson(response.toString());
    return obj;
  }

  //for get product by furniture
  static Future<ProductModel> getProductsByFur(int id) async {
    var response = await BaseClient().get(
      '${ConstantStrings.kProductApi}searchCriteria[filter_groups][0][filters][0][field]=category_id&=&searchCriteria[pageSize]=9& searchCriteria[filter_groups][0][filters][0][value]=$id',
      Preference.getUserToken(),
    );
    ProductModel obj = productModelFromJson(response.toString());
    return obj;
  }

  static Future<SampleProductStatusResponseModel> getSampleProductStatus(
      SampleProductStatusModel payloadObj, String token) async {
    var response = await BaseClient().post(
      ConstantStrings.kSampleProductStatusApi,
      payloadObj.toJson(),
      token,
    );
    SampleProductStatusResponseModel obj =
        sampleProductStatusResponseModelFromJson(response.toString());
    return obj;
  }
}
