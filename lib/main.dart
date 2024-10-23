import 'package:flutter/material.dart';
import 'package:brainybit/colorScheme.dart';
import 'package:brainybit/home_menu.dart';
import 'package:brainybit/login.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:shared_preferences/shared_preferences.dart';
// To format the date/time

bool isPremium = false;
String name = '';
String email = '';
Map<dynamic, dynamic> questions = {};
bool shouldLogin = false;

// Function to fetch user token to check if the user is logged in.
Future<void> getUserToken() async {
  SharedPreferences.getInstance().then((SharedPreferences prefs) {
    // Use prefs here
    name = prefs.getString("fullName") ?? "";
    String token = prefs.getString("token") ?? "";
    isPremium = prefs.getBool("premium") ?? false;
    if (token.isNotEmpty) {
      shouldLogin = false;
    } else {
      shouldLogin = true;
    }
  });
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  getUserToken();

  // Admob initializer
  MobileAds.instance.initialize();
  // fetch the details for check
  print(shouldLogin);
  runApp(MaterialApp(
      title: "BrainyBit",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: mine.shade900),
        useMaterial3: true,
        //<-- SEE HERE
      ),
      home: shouldLogin ? const LoginScreen() : const HomePage()));
}
