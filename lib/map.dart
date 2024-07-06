import 'package:flutter/material.dart';
import 'package:brainybit/colorScheme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class MapPage extends StatelessWidget {
  const MapPage({super.key});

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
              "NSUK maps services",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.bold, color: mine),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 18.0, vertical: 5),
            child: Text(
                "Sorry this services is yet to be fully implemented. Check back later.",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 16, color: Color.fromARGB(255, 33, 68, 107))),
          ),
        ]));
  }
}
