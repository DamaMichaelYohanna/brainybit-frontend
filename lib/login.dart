import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:konnet/colorScheme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import 'home_menu.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameControl = TextEditingController();
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
  Future<Map<String, bool>> fetchUserInfoOnline(
      String username, String password) async {
    var url = Uri.https('brainybit.vercel.app', 'api/v1/user/login');
    // prepare the form data
    final Map<String, String> formData = {
      'username': username,
      "password": password
    };

    try {
      final response = await http.post(url, body: formData);
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

  // Register button callback function
  void register() {}
  // Login button call back function
  void login() async {
    String username = usernameControl.text;
    String password = passwordControl.text;
    if (username.isNotEmpty && password.isNotEmpty) {
      Map<String, bool> value = await fetchUserInfoOnline(username, password);
      afterLoginCall(value);
    }
  }

  // variable to obscure and show password
  bool show = false;
  bool errorError = false;
  @override
  void dispose() {
    usernameControl.dispose();
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
          Image.asset("assets/images/bg2.png"),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Text(
                "Welcome To BrainyBits",
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
              controller: usernameControl,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.verified_user),
                  prefixIconColor: mine,
                  border: OutlineInputBorder(),
                  hintText: "Enter Your Email"),
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
                    hintText: "Enter Your Password")),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: LoginButton(callback: login),
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                      child: Text("Register",
                          style: TextStyle(
                              color: mine, fontWeight: FontWeight.bold))),
                  InkWell(
                      child: Text("Forgot Password?",
                          style: TextStyle(
                              color: mine, fontWeight: FontWeight.bold)))
                ]),
          )
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
              child: Text("Sign In",
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
// class Home extends StatelessWidget {
//   const Home({super.key});

// // TextEditingController username_control = TextEditingController();

// // ignore: empty_constructor_bodies
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: const Text("BrainyBits"),
//       // ),
//       body: ListView(
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
//             child: Image.asset("assets/images/bg.png"),
//           ),
//           // const Divider(),
//           const Center(
//             child: Text(
//               "Welcome To BrainyBits",
//               style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
//             ),
//           ),
//           const Padding(
//             padding: EdgeInsets.all(15),
//             child: TextField(
//                 decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.verified_user),
//                     border: OutlineInputBorder(),
//                     hintText: "Enter Your Email")),
//           ),
//           const Padding(
//             padding: EdgeInsets.all(15),
//             child: TextField(
//                 decoration: InputDecoration(
//                     prefixIcon: Icon(Icons.lock),
//                     border: OutlineInputBorder(),
//                     hintText: "Enter Your Password")),
//           ),
//           const Padding(
//             padding: EdgeInsets.all(15),
//             child: ElevatedButton(
//               onPressed: hello,
//               child: Text("Sign In"),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// void hello() {}
