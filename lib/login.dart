import 'dart:convert';

import 'package:flutter/material.dart';
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
  Future<bool> setUserName(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString("username", value);
  }

  // Function for login in.
  Future<Map<String, bool>> fetchTokenOnline(
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
        return {"correct": true};
      } else {
        // Request failed
        return {"incorrect": false};
      }
    } catch (e) {
      return {"internet": false};
    }
  }

  void login() async {
    String username = usernameControl.text;
    String password = passwordControl.text;
    await fetchTokenOnline(username, password).then((value) => {
          if (value.containsKey("correct"))
            {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => HomePage()))
            }
          else if (value.containsKey("incorrect"))
            {
              showDialog(
                  context: context,
                  builder: (_) => const AlertDialog(
                        title: Text('Error!'),
                        // icon:Text("hell"),
                        content: Text("Incorrect Email or Password"),
                      ))
            }
          else
            {
              showDialog(
                  context: context,
                  builder: (_) => const AlertDialog(
                        title: Text('Something happened!'),
                        // icon:Text("hell"),
                        content: Text(
                            "Please Check your internet connection and try again."),
                      ))
            }
        });
  }

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
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 40),
            child: Image.asset("assets/images/bg.png"),
          ),
          const Divider(),
          const Divider(),
          const Center(
            child: Text(
              "Welcome To BrainyBits",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
                controller: usernameControl,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.verified_user),
                    border: OutlineInputBorder(),
                    hintText: "Enter Your Email")),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
                controller: passwordControl,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(),
                    hintText: "Enter Your Password")),
          ),
          Padding(
              padding: const EdgeInsets.all(15),
              child: LoginButton(callback: login))
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

  void buttonActivity() {
    print("Coming for you");
    setState(() {
      buttonActive = false;
    });
    var a = callBack();
    setState(() {
      buttonActive = true;
    });
    print("we done guys");
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      // ignore: dead_code
      onPressed: buttonActive ? buttonActivity : null,
      child: const Text("Sign In"),
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
