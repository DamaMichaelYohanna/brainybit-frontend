import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:brainybit/colorScheme.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class TokenActivateScreen extends StatefulWidget {
  const TokenActivateScreen({super.key});

  @override
  State<TokenActivateScreen> createState() => _TokenActivateScreenState();
}

class _TokenActivateScreenState extends State<TokenActivateScreen> {
  final tokenControl = TextEditingController();
  var email = '';

  void getEmail() async {
    await SharedPreferences.getInstance()
        .then((value) => {email = value.getString("email") ?? ""});
  }

  void updateStatus() async {
    await SharedPreferences.getInstance()
        .then((value) => {value.setBool("premium", true)});
  }

  @override
  void initState() {
    super.initState();
    getEmail();
  }

  // Login button call back function
  void activateCallback() async {
    String token = tokenControl.text;

    if (token.isNotEmpty) {
      var url = Uri.https('brainybit.vercel.app', 'api/v1/general/subscribe/');
      // prepare the form data
      final Map<String, String> formData = {
        'token_value': token,
        'email': email,
      };

      try {
        final response = await http.post(url, body: formData);
        Map<String, dynamic> body = json.decode(response.body.toString());
        if (response.statusCode == 200) {
          tokenControl.text = '';
          // check userstatus to subscribe
          updateStatus();
          showDialog(
              // ignore: use_build_context_synchronously
              context: context,
              builder: (_) => AlertDialog(
                    title: const Text('Success!'),
                    // icon:Text("hell"),
                    content: Text("${body['detail']}"),
                  ));
        } else {
          // Request failed
          showDialog(
              // ignore: use_build_context_synchronously
              context: context,
              builder: (_) => AlertDialog(
                    title: const Text('Error!'),
                    // icon:Text("hell"),
                    content: Text("${body['detail']}"),
                  ));
        }
      } catch (e) {
        showDialog(
            // ignore: use_build_context_synchronously
            context: context,
            builder: (_) => const AlertDialog(
                  title: Text('Error!'),
                  // icon:Text("hell"),
                  content: Text(
                      "An error occurred! Please check your internet connection."),
                ));
      }
    }
  }

  @override
  void dispose() {
    tokenControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Activate Token"),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Please Enter your Activation token in the field provided.",
              style: TextStyle(fontSize: 18),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15),
            child: Text(
              "Note! it can only be used by a single user",
              style: TextStyle(color: Colors.red),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: tokenControl,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.token),
                  prefixIconColor: mine,
                  border: OutlineInputBorder(),
                  hintText: "Enter Activation Token"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: ActivateButton(callback: activateCallback),
          ),
        ],
      ),
    );
  }
}

class ActivateButton extends StatefulWidget {
  final Function callback;
  const ActivateButton({super.key, required this.callback});

  @override
  // ignore: no_logic_in_create_state
  State<ActivateButton> createState() =>
      _ActivateButtonState(callBack: callback);
}

class _ActivateButtonState extends State<ActivateButton> {
  final Function callBack;
  bool buttonActive = true;
  _ActivateButtonState({required this.callBack});

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
              child: Text("Activate",
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
