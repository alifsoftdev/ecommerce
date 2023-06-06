import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../data/prefs.dart';

class GraphqlClass {
  //you check this website for graphql test
  //https://graphqlzero.almansi.me/#example-top

  static HttpLink httpLink = HttpLink("https://kallukosai.bgm.me/graphql");
  static Link linkr = httpLink;

  static Link getLink() {
    print("token calling");

    final AuthLink authLink = AuthLink(
        headerKey: 'Authorization',
        getToken: () async {
          final token =
              Preference.getUserToken(); // token get via shared preference

          // final token = Preference.getAdminToken(); // token get via shared preference
          print(token.toString());
          return 'Bearer $token';
        });

    print("token calling${authLink.requestTransformer.toString()}");
    return linkr = authLink.concat(httpLink);
  }

  ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
    GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      link:
          linkr, // here if you have bearer token token then use this function 'getLink()' otherwise linkr
    ),
  );

  GraphQLClient clientToQuery() {
    // here if you have bearer token token then use this function 'getLink()' otherwise linkr
    return GraphQLClient(
      link: linkr,
      cache: GraphQLCache(store: InMemoryStore()),
    );
  }

  ValueNotifier<GraphQLClient> client2 = ValueNotifier<GraphQLClient>(
    GraphQLClient(
      cache: GraphQLCache(store: InMemoryStore()),
      //  link: linkr,
      link:
          getLink(), // here if you have bearer token token then use this function 'getLink()' otherwise linkr
    ),
  );

  GraphQLClient clientToQuery2() {
    // here if you have bearer token token then use this function 'getLink()' otherwise linkr
    return GraphQLClient(
      link: getLink(),
      cache: GraphQLCache(store: InMemoryStore()),
    );
  }

/*
final HttpLink httpLink = HttpLink(
  'https://api.github.com/graphql',
);

final AuthLink authLink2 = AuthLink(
  getToken: () async => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  // OR
  // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
);

final Link link = authLink2.concat(httpLink);*/
}
