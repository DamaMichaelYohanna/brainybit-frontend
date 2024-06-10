import 'package:flutter/material.dart';
import 'package:konnet/colorScheme.dart';
import 'package:konnet/main.dart';
import 'package:konnet/subscribe.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  final bool free = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: [
          Container(
              height: 200.0,
              width: 200.0,
              child: Image.asset('assets/images/about.jpg')),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              overflow: TextOverflow.ellipsis,
              "About BrainyBit Application",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: mine),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 8.0),
            child: Text("Special Welcome Once More ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15, color: mine)),
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
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(" Points",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
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
