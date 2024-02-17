import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

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
  Future<void> fetchTokenOnline(String username, String password) async {
    var url = Uri.https('brainybit.vercel.app', 'api/v1/user/login');
    print(url);

    final Map<String, String> formData = {
      'username': username,
      "password": password
    };

    try {
      // final response = await http.post(url, body: formData);
      var uri = Uri.parse('https://brainybit.vercel.app/api/v1/user/login');
      var request = http.MultipartRequest('POST', uri);
      request.fields["username"] = "dama";
      request.fields["password"] = "dama";
      // request.fields.addAll({"password": "hello"});
      http.StreamedResponse response = await request.send();
      print(response.stream);

      if (response.statusCode == 200) {
        // Request successful, handle response data
        debugPrint('Response body: ${response.stream}');
        // final body = json.decode(response.body);
      } else {
        // Request failed
        debugPrint('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      // An error occurred
      debugPrint('Request failed with');
      print(e);
    }
  }

  void login() {
    String username = usernameControl.text;
    String password = passwordControl.text;
    print("about to call");
    fetchTokenOnline(username, password);
    print(
      username,
    );
    print(password);
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
            child: ElevatedButton(
              onPressed: login,
              child: const Text("Sign In"),
            ),
          )
        ],
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
