import '../models/country.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../services/mutations_and_queries.dart';
import 'package:hagglex/utils/graphql_config.dart';

class CountryProvider with ChangeNotifier {
  CountryProvider() {
    loadCountries().then((countries) {
      _countries = countries;
      notifyListeners();
    });
  }

  List<Country> _countries = [];

  List<Country> get countries => _countries;
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  Future loadCountries() async {
    QueriesAndMutations queryMutation = QueriesAndMutations();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult result = await _client.query(
      QueryOptions(
        document: gql(queryMutation.getCountriesQuery()),
        pollInterval: Duration(seconds: 5),
      ),
    );
    List<Country> countryList = [];
    if (!result.hasException) {
      var data = result.data["getActiveCountries"];
      for (var i = 0; i < result.data["getActiveCountries"].length; i++) {
        countryList.add(
          Country(
            name: data[i]['name'],
            callingCode: data[i]["callingCode"],
            currencySymbol: data[i]["currencySymbol"],
            flag: data[i]["flag"],
          ),
        );
      }
    }
    return countryList;
  }
}
