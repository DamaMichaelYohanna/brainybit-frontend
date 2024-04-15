import 'package:flutter/material.dart';
import 'package:konnet/colorScheme.dart';

class SuggestionPage extends StatefulWidget {
  const SuggestionPage({super.key});

  @override
  State<SuggestionPage> createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  String selectedOption = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Suggestions"),
        backgroundColor: mine,
        foregroundColor: mine,
        elevation: 0,
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            color: mine,
            padding: EdgeInsets.all(12),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(10),
                  child: Text(
                    "Let's hear from you.",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Do you have suggestion, or did you find any bug with our application? Let Us know in the fields below",
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
            child: Text(
              "How was your experience?.",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Row(
              children: [
                Column(
                  children: [
                    Radio(
                        value: "good",
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value.toString();
                          });
                        }),
                    Text("Good")
                  ],
                ),
                Column(
                  children: [
                    Radio(
                        value: "fair",
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value.toString();
                          });
                        }),
                    Text("Fair")
                  ],
                ),
                Column(
                  children: [
                    Radio(
                        value: "bad",
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value.toString();
                          });
                        }),
                    const Text("Bad")
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(15.0),
            child: TextField(
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 236, 240, 244),
                  hintText: "Let's have your experience or suggestions here",
                  border: InputBorder.none),
              maxLines: 7,
            ),
          )
        ],
      ),
    );
  }
}
