import 'dart:convert';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:konnet/colorScheme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'home_menu.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final nameControl = TextEditingController();
  final emailControl = TextEditingController();
  final passwordControl = TextEditingController();

// funtion to set user token after login
  Future<void> setUserInfo(String? fullName, email, verified, token) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("fullName", fullName ?? "");
    prefs.setString("email", email);
    prefs.setBool("verified", verified);
    prefs.setString("token", token);
  }

  // Function for login in.
  Future<Map<String, bool>> registerOnline(
      String name, String email, String password) async {
    var url = Uri.https('locator-xi.vercel.app', 'api/v1/user/register');
    // prepare the form data
    final Map<String, String> formData = {
      'name': name,
      'email': email,
      "password": password
    };

    try {
      final response = await http.post(url, body: formData);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        Map<String, dynamic> body = json.decode(response.body.toString());
        // print(response.body.toString());
        setUserInfo(body["full_name"], body["email"], body["verified"],
            body["access_token"]);
        return {"correct": true};
      } else {
        // Request failed
        return {"incorrect": false};
      }
    } catch (e) {
      return {"internet": false};
    }
  }

  void afterLoginCall(value) {
    if (value.containsKey("correct")) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    } else if (value.containsKey("incorrect")) {
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                title: Text('Error!'),
                // icon:Text("hell"),
                content: Text("Incorrect Email or Password"),
              ));
    } else {
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                title: Text('Something happened!'),
                // icon:Text("hell"),
                content: Text(
                    "Please Check your internet connection and try again."),
              ));
    }
  }

  Future<void> register() async {
    final Uri _url =
        Uri.parse('https://locator-xi.vercel.app/api/v1/user/register');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  // Login button call back function
  void login() async {
    String name = nameControl.text;
    String email = emailControl.text;
    String password = passwordControl.text;
    if (name.isNotEmpty && password.isNotEmpty) {
      Map<String, bool> value = await registerOnline(name, email, password);
      afterLoginCall(value);
    } else {
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                title: Text('Error!'),
                // icon:Text("hell"),
                content: Text("Missing fields. Please check and retry!"),
              ));
    }
  }

  // variable to obscure and show password
  bool show = false;
  bool errorError = false;
  @override
  void dispose() {
    nameControl.dispose();
    emailControl.dispose();
    passwordControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text("BrainyBits"),
      // ),
      body: ListView(
        children: [
          Container(
            child: Image.asset("assets/images/bg2.png"),
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(
                "Join BrainyBits",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: mine.shade900),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: emailControl,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.verified_user),
                  prefixIconColor: mine,
                  border: OutlineInputBorder(),
                  hintText: "Email Address"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: nameControl,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.verified_user),
                  prefixIconColor: mine,
                  border: OutlineInputBorder(),
                  hintText: "Full Name"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
                controller: passwordControl,
                obscureText: show ? false : true,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.lock),
                    prefixIconColor: mine,
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            if (show == true) {
                              show = false;
                            } else {
                              show = true;
                            }
                          });
                        },
                        icon: show
                            ? const Icon(Icons.remove_red_eye_outlined)
                            : const Icon(
                                Icons.remove_red_eye,
                                color: mine,
                              )),
                    border: const OutlineInputBorder(),
                    hintText: "Password")),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: LoginButton(callback: login),
          ),
        ],
      ),
    );
  }
}

class LoginButton extends StatefulWidget {
  final Function callback;
  const LoginButton({super.key, required this.callback});

  @override
  // ignore: no_logic_in_create_state
  State<LoginButton> createState() => _LoginButtonState(callBack: callback);
}

class _LoginButtonState extends State<LoginButton> {
  final Function callBack;
  bool buttonActive = true;
  _LoginButtonState({required this.callBack});

  void buttonActivity() async {
    setState(() {
      buttonActive = false;
    });
    await callBack();
    setState(() {
      buttonActive = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: mine,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      onPressed: buttonActive ? buttonActivity : () {},
      child: buttonActive
          ? const Padding(
              padding: EdgeInsets.all(5.0),
              child: Text("Register",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            )
          : const Padding(
              padding: EdgeInsets.all(5.0),
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
    );
  }
}
