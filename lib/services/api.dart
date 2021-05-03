import 'package:http/http.dart' as http;

import 'dart:convert';
import '../models/country.dart';
import '../models/user_model.dart';

class Api {
  static String domain =
      "https://hagglex-backend-staging.herokuapp.com/graphql";
  Future<User> login(String username, String password) async {
    Map data = {'username': username, 'password': password};

    /*Calling the API url */
    var jsonData;
    final response = await http.post(domain + "/login", body: data);
    print('Status CodeCC = ' +
        response.statusCode.toString() +
        ". ResponseCC: " +
        response.body);

    /*If the response is 200 (success) then the response will be decoded */

    if (response.statusCode == 200 || response.statusCode == 201) {
      jsonData = json.decode(response.body);
      String token = jsonData['token'];
      User user = jsonData['user'];
      print('Token for the reg is: $token');

      return user;
    } else {
      print("Error Requesting API");
      return null;
    }
  }

  Future<User> register(
    String email,
    String password,
    String username,
    String referralCode,
    String phoneNumber,
    Country country,
  ) async {
    Map phoneNumberDetails = {
      'phoneNumber': phoneNumber,
      'callingCode': country.callingCode,
      'flag': country.flag,
    };
    Map data = {
      'email': email,
      'username': username,
      'password': password,
      'phonenumber': phoneNumber,
      'country': country.name,
      'referralCode': referralCode,
      'currency': country.currencySymbol,
      'phoneNumberDetails': phoneNumberDetails
    };

    /*Calling the API url */
    var jsonData;
    final response = await http.post(domain + "/register", body: data);
    print('Status CodeCC = ' +
        response.statusCode.toString() +
        ". ResponseCC: " +
        response.body);

    /*If the response is 200 (success) then the response will be decoded */

    if (response.statusCode == 200 || response.statusCode == 201) {
      jsonData = json.decode(response.body);
      String token = jsonData['token'];
      User user = jsonData['user'];
      print('Token for the reg is: $token');

      return user;
    } else {
      print("Error Requesting API");
      return null;
    }
  }
}
