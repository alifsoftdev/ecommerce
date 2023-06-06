import 'package:gql/language.dart';

class PostQuery {
 static final getAllPost = parseString('''
query ( \$options: PageQueryOptions) {
  posts(options: \$options) {
    data {
      id
      title
    }
    meta {
      totalCount
    }
  }
}
  ''');


}
