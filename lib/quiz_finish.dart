import 'package:flutter/material.dart';
import 'package:konnet/colorScheme.dart';

class QuizFinish extends StatelessWidget {
  final int score;
  final int questionLength;
  const QuizFinish(
      {super.key, required this.score, required this.questionLength});

  final bool free = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: mine,
        body: ListView(children: [
          Image.asset('assets/images/quizfinish.png'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              overflow: TextOverflow.ellipsis,
              "Dama Michael Yohanna!",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          Text("Well Done "),
          Container(
            height: 200,
            decoration: BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage("assets/images/ture.png"),
                    fit: BoxFit.cover)),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Your Score",
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${score}/${questionLength} Points",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                questionLength <= 15
                    ? Text(
                        "Subscribe to premium to Have access to more questions.",
                        style: TextStyle(fontSize: 16),
                      )
                    : ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: mine,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5))),
                        child: Text("Close")),
              ],
            ),
          ),
        ]));
  }
}
