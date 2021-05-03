// import '../models/user_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:async';
//
// class UserPreferences {
//   Future saveUser(User user) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString("userId", user.id);
//     prefs.setString("name", user.username);
//     prefs.setString("email", user.email);
//     prefs.setString("phone", user.phoneNumber);
//   }
//
//   Future<User> getUser() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     String userId = prefs.getString("userId");
//     String name = prefs.getString("name");
//     String email = prefs.getString("email");
//     String phone = prefs.getString("phone");
//
//     return User(
//       id: userId,
//       username: name,
//       email: email,
//       phoneNumber: phone,
//     );
//   }
//
//   void removeUser() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//
//     prefs.remove("name");
//     prefs.remove("email");
//     prefs.remove("phone");
//   }
// }
