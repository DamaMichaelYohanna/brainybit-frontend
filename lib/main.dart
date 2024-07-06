import 'package:flutter/material.dart';
import 'package:brainybit/colorScheme.dart';
import 'package:brainybit/home_menu.dart';
import 'package:brainybit/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool isPremium = false;
String name = '';
Future<void> main() async {
  // Function to fetch user token to check if the user is logged in.
  WidgetsFlutterBinding.ensureInitialized();
  Future<bool> getUserToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString("fullName") ?? "";
    // String email = prefs.getString("email") ?? "";
    String token = prefs.getString("token") ?? "";
    isPremium = prefs.getBool("premium") ?? false;
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
