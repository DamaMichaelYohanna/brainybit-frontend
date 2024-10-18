import 'package:flutter/material.dart';
import 'package:brainybit/colorScheme.dart';
import 'package:brainybit/quiz.dart';
import 'package:brainybit/resources.dart';
import 'package:brainybit/course_detail.dart';

class VideoPlayList extends StatelessWidget {
  final String courseCode;
  final String courseName;
  const VideoPlayList(
      {super.key, required this.courseCode, required this.courseName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("$courseCode Resources")),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 150,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/cmp.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              courseName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("About This Course",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200)),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
                courseDetail[courseCode] != null
                    ? "${courseDetail[courseCode]}"
                    : "No Course Details available yet.",
                style: const TextStyle(
                  fontSize: 16,
                )),
          ),
          // Column(
          //   children: _buildListItems(),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: mine,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LearningResource(
                      courseName: courseName,
                      courseCode: courseCode,
                    ),
                  ),
                );
              },
              child: const Text("Learning Resources"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: mine,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => QuizScreen(
                      courseCode: courseCode,
                    ),
                  ),
                );
              },
              child: const Text("Take Quiz"),
            ),
          ),
        ],
      ),
    );
  }
}
