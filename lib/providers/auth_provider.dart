import 'dart:async';
import 'package:graphql_flutter/graphql_flutter.dart';
import '../services/mutations_and_queries.dart';
import 'package:hagglex/utils/graphql_config.dart';
import 'package:flutter/material.dart';
import 'package:hagglex/models/country.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Status {
  NotLoggedIn,
  NotRegistered,
  LoggedIn,
  Registered,
  Authenticating,
  Registering,
  Verifying,
  Verified,
  NotVerified,
  LoggedOut,
  Resending,
  NotSent,
  Resent,
}

class AuthProvider with ChangeNotifier {
  GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();
  QueriesAndMutations queryMutation = QueriesAndMutations();
  Status _loggedInStatus = Status.NotLoggedIn;
  Status _registeredInStatus = Status.NotRegistered;
  Status _verifiedInStatus = Status.NotVerified;
  Status _sentInStatus = Status.NotSent;

  Status get loggedInStatus => _loggedInStatus;
  Status get registeredInStatus => _registeredInStatus;
  Status get verifiedInStatus => _verifiedInStatus;
  Status get sentInStatus => _sentInStatus;

  Future saveVerifiedPreferences(bool verified) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("verified", verified);
    return prefs;
  }

  Future saveLoggedInInPreferences(bool loggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("loggedIn", loggedIn);
    return prefs;
  }

  Future saveEmailPreferences(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("email", email);
    return prefs;
  }

  Future<Map<String, dynamic>> login(String email, String password) async {
    var result;

    _loggedInStatus = Status.Authenticating;
    notifyListeners();

    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult queryResult = await _client.mutate(
      MutationOptions(
        document: gql(
          queryMutation.loginMutation(email, password),
        ),
      ),
    );
    print("The Response is: ${queryResult}");
    if (!queryResult.hasException) {
      await saveLoggedInInPreferences(true);
      await saveEmailPreferences(email);
      var _email = queryResult.data["login"]["user"]["email"];
      _loggedInStatus = Status.LoggedIn;
      notifyListeners();
      result = {'status': true, 'message': 'Successful', 'email': _email};
    } else {
      _loggedInStatus = Status.NotLoggedIn;
      notifyListeners();
      result = {'status': false, 'message': 'Wrong credentials'};
    }
    return result;
  }

  Future<Map<String, dynamic>> verifyUser(String code) async {
    var result;

    _verifiedInStatus = Status.Verifying;
    notifyListeners();

    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult queryResult = await _client.mutate(
      MutationOptions(
        document: gql(
          queryMutation.verifyUser(code),
        ),
      ),
    );
    print("The Response is: ${queryResult}");
    if (!queryResult.hasException) {
      await saveVerifiedPreferences(true);
      _verifiedInStatus = Status.Verified;
      notifyListeners();
      result = {'status': true, 'message': 'Authorized'};
    } else {
      _verifiedInStatus = Status.NotVerified;
      notifyListeners();
      result = {'status': false, 'message': 'Unauthorized'};
    }
    return result;
  }

  Future<Map<String, dynamic>> resendVerificationCode(String email) async {
    var result;

    _sentInStatus = Status.Resending;
    notifyListeners();

    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult queryResult = await _client.mutate(
      MutationOptions(
        document: gql(
          queryMutation.resendVerificationCodeQuery(email),
        ),
      ),
    );
    print("The Response is: ${queryResult}");
    if (!queryResult.hasException) {
      bool response = queryResult.data["resendVerificationCode"];
      notifyListeners();
      result = {
        'status': response,
        'message': 'Code successfully sent',
      };
    } else {
      _verifiedInStatus = Status.NotVerified;
      notifyListeners();
      result = {'status': false, 'message': 'Registration Failed', 'email': ''};
    }
    return result;
  }

  Future<Map<String, dynamic>> register(
    String email,
    String password,
    String username,
    String referralCode,
    String phoneNumber,
    Country country,
  ) async {
    var result;

    _registeredInStatus = Status.Registering;
    notifyListeners();
    GraphQLClient _client = graphQLConfiguration.clientToQuery();
    QueryResult queryResult = await _client.mutate(
      MutationOptions(
        document: gql(
          queryMutation.registerMutation(
              email, username, password, phoneNumber, referralCode, country),
        ),
      ),
    );
    print("The Response is: ${queryResult}");
    if (!queryResult.hasException) {
      var _email = queryResult.data["register"]["user"]["email"];
      saveEmailPreferences(_email);
      _registeredInStatus = Status.Registered;
      notifyListeners();
      result = {
        'status': true,
        'message': 'Registration successful',
        'email': _email
      };
    } else {
      _registeredInStatus = Status.NotRegistered;
      notifyListeners();
      result = {'status': false, 'message': 'Registration Failed', 'email': ''};
    }
    return result;
  }

  static onError(error) {
    print("the error is $error.detail");
    return {'status': false, 'message': 'Unsuccessful Request', 'data': error};
  }
}
