import 'package:flutter/material.dart';
import 'package:brainybit/colorScheme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  final bool free = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: [
          SizedBox(
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
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
            child: Text(
                "BrainyBit is a one stop for all app tailored toward NSUK Students to provide them with past questions, learning resources, interface for note taking and todos among others ",
                // textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 33, 68, 107))),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: Text(
              "Vision",
              style: TextStyle(
                  fontSize: 15, fontWeight: FontWeight.bold, color: mine),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 236, 241, 245),
                borderRadius: BorderRadius.circular(10)),
            child: const Text(
                "My vission is to empower every student with accessible and comprehensive educational resources, fostering a dynamic learning environment that transcends traditional boundaries.",
                style: TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 2, 8, 14))),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: Text(
              "Mission",
              style: TextStyle(
                  fontSize: 15, fontWeight: FontWeight.bold, color: mine),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 236, 241, 245),
                borderRadius: BorderRadius.circular(10)),
            child: const Text(
                "My mission is to provide a centralized platform for students, offering past questions, learning materials, and essential school information, thereby enhancing academic excellence, promoting student success, and cultivating a vibrant community of lifelong learners"),
          ),
          // const Divider(),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
            child: Text(
              "Meet The Developer",
              style: TextStyle(
                  fontSize: 15, fontWeight: FontWeight.bold, color: mine),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 236, 241, 245),
                borderRadius: BorderRadius.circular(10)),
            child: const Text(
                "I'm Dama Michael Yohanna, a student from the prestigous department of Computer Science, Nasarawa State University, who derives joy in problem solving. On my free, I love to study and listen to music"),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
            child: Text(
              "Let's Connect",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 15, fontWeight: FontWeight.bold, color: mine),
            ),
          ),
          // const Padding(
          //   padding: EdgeInsets.all(10.0),
          //   child: Text("You can reach me via the following social space"),
          // ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.facebook)),
                IconButton(
                    onPressed: () async {
                      String contact = "+2348160535033";
                      String text = 'Hello';
                      String androidUrl =
                          "whatsapp://send?phone=$contact&text=$text";
                      await launchUrl(Uri.parse(androidUrl));
                    },
                    icon: const Icon(FontAwesomeIcons.whatsapp)),
                IconButton(
                    onPressed: () async {
                      String androidUrl =
                          "https://www.linkedin.com/in/dama-michael-yohanna-2b9835230/";
                      await launchUrl(Uri.parse(androidUrl));
                    },
                    icon: const Icon(FontAwesomeIcons.linkedin)),
                IconButton(
                    onPressed: () async {
                      String androidUrl =
                          "https://www.tiktok.com/@codewithdama";
                      await launchUrl(Uri.parse(androidUrl));
                    },
                    icon: const Icon(FontAwesomeIcons.tiktok)),
                IconButton(
                    onPressed: () async {
                      String androidUrl = "https://x.com/dama_michael";
                      await launchUrl(Uri.parse(androidUrl));
                    },
                    icon: const Icon(FontAwesomeIcons.twitter)),
                IconButton(
                    onPressed: () async {
                      String androidUrl = "mailto:get2dama11@gmail.com";
                      await launchUrl(Uri.parse(androidUrl));
                    },
                    icon: const Icon(Icons.mail)),
                IconButton(
                    onPressed: () async {
                      String androidUrl =
                          "https://github.com/DamaMichaelYohanna";
                      await launchUrl(Uri.parse(androidUrl));
                    },
                    icon: const Icon(FontAwesomeIcons.github)),
              ],
            ),
          )
        ]));
  }
}
