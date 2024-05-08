import 'dart:convert';
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
      if (response.statusCode == 200) {
        Map<String, dynamic> body = json.decode(response.body.toString());
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString("fullName", body["full_name"] ?? "");
        prefs.setString("email", body["email"]);
        prefs.setBool("verified", body["verified"]);
        return {"success": true};
      } else {
        // Request failed
        return {"failed_used_email": false};
      }
    } catch (e) {
      return {"failed_internet": false};
    }
  }

  void afterLoginCall(value) {
    if (value.containsKey("success")) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
    } else if (value.containsKey("failed_used_email")) {
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                title: Text('Error!'),
                // icon:Text("hell"),
                content: Text("Email address is already in use."),
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

  // Register button call back function
  void registerCallback() async {
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
      backgroundColor: Color.fromARGB(255, 48, 101, 151),
      // appBar: AppBar(
      //   title: const Text("BrainyBits"),
      // ),
      body: ListView(
        children: [
          Image.asset("assets/images/bg2.png"),
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0), // Radius for bottom left corner
                topRight:
                    Radius.circular(50.0), // Radius for bottom right corner
              ),
            ),
            child: Column(
              children: [
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
                        prefixIcon: Icon(Icons.email),
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
                  child: LoginButton(callback: registerCallback),
                ),
              ],
            ),
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
