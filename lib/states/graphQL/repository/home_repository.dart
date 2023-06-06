import 'package:gql/language.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../model/image_search_model.dart';
import '../HelperUtils/global_constant.dart';
import '../graphql_provider.dart';

abstract class IHomeRepository{
  Future<ImageSearchModel> getImageSearchData(String image);
}

class HomeRepository extends IHomeRepository{

  @override
  Future<ImageSearchModel> getImageSearchData(image) async {
    late ImageSearchModel responseData;
    GraphqlClass graphqlClass = GraphqlClass();
    GraphQLClient client = graphqlClass.clientToQuery2();

    final MutationOptions options = MutationOptions(
        document: parseString('''
 {
    productsearchbyimage(
        filename: 
        "$image"
        )
        {
            file_url
            imageName
            items{
                entity_id
                name
                sku
                type_id
                status
                image{
                    url
                    label
                }
                price_range{
                    minimum_price{
                        regular_price{
                            value
                            currency
                        }
                        final_price{
                            value
                            currency
                        }
                    }
                }
                
            }
        }
    
}
 '''), // call the query
        variables: const {});
    final QueryResult result = await client.mutate(options);

    print('QueryResultImg: $result');

    if (result.hasException) {
      String msg = result.exception!.graphqlErrors[0].message.toString();
      HelperUtils.showToast(msg);
    } else {
      String responseDetails = HelperUtils().getPrettyJSONString(result.data);
      print(responseDetails);

      responseData = ImageSearchModel.fromRawJson(responseDetails);
    }

    return responseData;
  }

}