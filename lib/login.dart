import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameControl = TextEditingController();
  final passwordControl = TextEditingController();

  void login() {
    String username = usernameControl.text;
    String password = passwordControl.text;
    print("i was called");
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
