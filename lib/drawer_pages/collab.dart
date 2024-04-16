import 'package:flutter/material.dart';
import 'package:konnet/colorScheme.dart';

class Collab extends StatefulWidget {
  const Collab({super.key});

  @override
  State<StatefulWidget> createState() => CollabState();
}

class CollabState extends State<Collab> {
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
          const Padding(
            padding: EdgeInsets.only(left: 10.0, top: 10),
            child: Text("Name"),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, bottom: 10, right: 10),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Name',
                  prefixIcon: Icon(Icons.verified_user_sharp)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, bottom: 10, right: 10),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Phone', prefixIcon: Icon(Icons.phone)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, bottom: 10, right: 10),
            child: TextField(
              decoration: InputDecoration(
                  hintText: 'Email', prefixIcon: Icon(Icons.mail)),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0, bottom: 10, right: 10, top: 0),
            child: TextField(
              maxLines: 5,
              decoration: InputDecoration(
                  hintText: "Any other thing to let us know?",
                  prefixIcon: Icon(Icons.other_houses)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {},
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
