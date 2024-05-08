import 'package:flutter/material.dart';
import 'package:konnet/colorScheme.dart';
import 'package:http/http.dart' as http;

class SuggestionPage extends StatefulWidget {
  const SuggestionPage({super.key});

  @override
  State<SuggestionPage> createState() => _SuggestionPageState();
}

class _SuggestionPageState extends State<SuggestionPage> {
  // Declare some variable to use in our fields
  String expOption = '';
  String sugOption = '';
  final TextEditingController submissionControl = TextEditingController();

  Future<String> submitFeedback(
      String experience, String submission, String category) async {
    var url = Uri.https('locator-xi.vercel.app', 'feeback/upload');
    // prepare the form data
    final Map<String, String> formData = {
      'experience': experience,
      "submission": submission,
      "category": category
    };

    try {
      final response = await http.post(url, body: formData);
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        return "done";
      } else {
        // Request failed
        return "error";
      }
    } catch (e) {
      return "internet";
    }
  }

  void afterSubmission(value) {
    if (value.containsKey("done")) {
      showDialog(
        context: context,
        builder: (_) => const AlertDialog(
          title: Text('Sucess!'),
          // icon:Text("hell"),
          content: Text("Your feedback have been submitted succesfully."),
        ),
      );
    } else if (value.containsKey("error")) {
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                title: Text('Error!'),
                // icon:Text("hell"),
                content: Text("Some thing happened. Feedback not submitted"),
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
            padding: const EdgeInsets.all(12),
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
                        groupValue: expOption,
                        onChanged: (value) {
                          setState(() {
                            expOption = value.toString();
                          });
                        }),
                    const Text("Good 😊")
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    children: [
                      Radio(
                          value: "fair",
                          groupValue: expOption,
                          onChanged: (value) {
                            setState(() {
                              expOption = value.toString();
                            });
                          }),
                      const Text("Fair 😌")
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Column(
                    children: [
                      Radio(
                          value: "bad",
                          groupValue: expOption,
                          onChanged: (value) {
                            setState(() {
                              expOption = value.toString();
                            });
                          }),
                      const Text("Bad 😒")
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
              controller: submissionControl,
              decoration: const InputDecoration(
                  filled: true,
                  fillColor: Color.fromARGB(255, 236, 240, 244),
                  hintText: "Tell us your experience or suggestions",
                  border: InputBorder.none),
              maxLines: 7,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(),
            child: Row(
              children: [
                Radio(
                    value: "bug",
                    groupValue: sugOption,
                    onChanged: (value) {
                      setState(() {
                        sugOption = value.toString();
                      });
                    }),
                const Text("Bug"),
                Radio(
                    value: "suggestion",
                    groupValue: sugOption,
                    onChanged: (value) {
                      setState(() {
                        sugOption = value.toString();
                      });
                    }),
                const Text("Suggestion"),
                Radio(
                    value: "others",
                    groupValue: sugOption,
                    onChanged: (value) {
                      setState(() {
                        sugOption = value.toString();
                      });
                    }),
                const Text("Others")
              ],
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
              child: const Text("Send Feedback"),
            ),
          )
        ],
      ),
    );
  }
}
