import 'package:flutter/material.dart';
import 'package:konnet/colorScheme.dart';
import 'package:konnet/home_menu.dart';
import 'package:konnet/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  // Function to fetch user token to check if the user is logged in.
  WidgetsFlutterBinding.ensureInitialized();
  Future<bool> getUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // String name = prefs.getString("fullName") ?? "";
    // String email = prefs.getString("email") ?? "";
    String token = prefs.getString("token") ?? "";
    if (token.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  var userInfo = await getUserToken();
  runApp(MaterialApp(
      title: "BrainyBit",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: mine.shade900),
        useMaterial3: true,
        //<-- SEE HERE
      ),
      home: userInfo ? const HomePage() : const LoginScreen()));
}
