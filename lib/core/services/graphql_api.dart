import 'package:anilist_app/ui/values/strings.dart';
import 'package:graphql/client.dart';

class GraphQL {
  static HttpLink httplink = HttpLink(BASE_URL);
  // ----- Token if needed
  // final AuthLink _auth = AuthLink(getToken: ()=>'Bearer $token');
  // Link _link = _authLink.concat(_httpLink);

  final GraphQLClient client = GraphQLClient(
    link: httplink,
    cache: GraphQLCache(),
  );

  GraphQLClient authenticatedClient(String token) => GraphQLClient(
        link: AuthLink(getToken: () => 'Bearer $token').concat(httplink),
        cache: GraphQLCache(),
      );

  void dispose() {
    httplink.dispose();
  }
}
