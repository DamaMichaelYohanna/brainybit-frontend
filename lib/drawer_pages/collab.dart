import 'package:flutter/material.dart';
import 'package:konnet/colorScheme.dart';
import 'package:http/http.dart' as http;

class Collab extends StatefulWidget {
  const Collab({super.key});

  @override
  State<StatefulWidget> createState() => CollabState();
}

class CollabState extends State<Collab> {
  final nameControl = TextEditingController();
  final phoneControl = TextEditingController();
  final emailControl = TextEditingController();
  final noteControl = TextEditingController();

  void sendRequest() async {
    String name = nameControl.text;
    String phone = phoneControl.text;
    String email = emailControl.text;
    String note = noteControl.text;
    var url = Uri.https('locator-xi.vercel.app', 'collab');
    // prepare the form data
    final Map<String, String> formData = {
      'name': name,
      "phone": phone,
      "email": email,
      "note": note
    };

    try {
      final response = await http.post(url, body: formData);
      if (response.statusCode == 200) {
      } else {
        // Request failed
      }
    } catch (e) {
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          title: Text('Error!'),
          // icon:Text("hell"),
          content: Text("Check your internet connection"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mine,
        foregroundColor: mine,
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 170,
            color: mine,
            padding: EdgeInsets.all(12),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Are you a developer?",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    "This project is open source and thus open for collaboration. If you are a developer with relevant skill in python(fastAPI) and dart(flutter), also wish to contribute to this project reach out to us",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, bottom: 10, right: 10),
            child: TextField(
              controller: nameControl,
              decoration: const InputDecoration(
                  hintText: 'Name',
                  prefixIcon: Icon(Icons.verified_user_sharp)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 10, right: 10),
            child: TextField(
              controller: phoneControl,
              decoration: const InputDecoration(
                  hintText: 'Phone', prefixIcon: Icon(Icons.phone)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 10, right: 10),
            child: TextField(
              controller: emailControl,
              decoration: const InputDecoration(
                  hintText: 'Email', prefixIcon: Icon(Icons.mail)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 10.0, bottom: 10, right: 10, top: 0),
            child: TextField(
              controller: noteControl,
              maxLines: 5,
              decoration: const InputDecoration(
                  hintText: "Any other thing to let us know?",
                  prefixIcon: Icon(Icons.other_houses)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                sendRequest();
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: mine,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              child: const Text("Send Request"),
            ),
          )
        ],
      ),
    );
  }
}
