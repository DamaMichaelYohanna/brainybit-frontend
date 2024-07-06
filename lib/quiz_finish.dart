import 'package:flutter/material.dart';
import 'package:brainybit/colorScheme.dart';
import 'package:brainybit/main.dart';
import 'package:brainybit/subscribe.dart';

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
              name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text("Well Done! ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: Colors.white)),
          ),
          Container(
            // height: 200,
            decoration: const BoxDecoration(
                color: Colors.white,
                image: DecorationImage(
                    image: AssetImage("assets/images/ture.png"),
                    fit: BoxFit.cover)),
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Your Score",
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("$score/$questionLength Points",
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 25, fontWeight: FontWeight.bold)),
                ),
                // display message base on user status
                !isPremium
                    ? Column(
                        children: [
                          const Divider(),
                          const Text(
                              "You are on free plan with only 10 free questions. Get more with premium subscription",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.red)),
                          ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => const SubscribePage(),
                                ));
                              },
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: mine,
                                  foregroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5))),
                              child: const Text("Subscribe To Premuim")),
                        ],
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
                        child: const Text("Close")),
              ],
            ),
          ),
        ]));
  }
}
