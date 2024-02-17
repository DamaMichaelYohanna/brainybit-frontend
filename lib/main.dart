import 'package:flutter/material.dart';
import 'package:konnet/colorScheme.dart';
import 'package:konnet/home_menu.dart';
import 'package:konnet/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  // Function to fetch user token to check if the user is logged in.
  WidgetsFlutterBinding.ensureInitialized();
  Future<String> getUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("token") ?? "";
  }

  var token = await getUserToken();
  runApp(MaterialApp(
      title: "BrainyBit",
      theme: ThemeData(
        primarySwatch: mine,
        //<-- SEE HERE
      ),
      home: token.isNotEmpty ? const HomePage() : const LoginScreen()));
}

// Future<bool> setUserName(String value) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.setString("username", value);
// }

// Future<String> getUserName(String value) async {
//   final SharedPreferences prefs = await SharedPreferences.getInstance();
//   return prefs.getString("username");
// }
