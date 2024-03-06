import 'dart:math';
import 'package:flutter/material.dart';
import 'package:konnet/video_list.dart';
import 'package:konnet/video_player.dart';
import 'package:konnet/quiz.dart';
import 'package:konnet/questions_model.dart';
import 'package:konnet/video_model.dart';

/// Flutter code sample for [ListTile].
Map<String, Map<String, String>> department = {
  "ESP": {
    "ESP 311": "Introduction",
    "ESP 221": "Entrepreneur Process & Skill Development I"
  },
  "GST": {
    "GST 111": "Use of English I",
    "GST 112": "Logic, Philosophy and Human Existance",
    "GST 113": "Nigerian Peoples and Culture",
    "GST 121": "Use of Library Skill, Study Skills and ICT",
    "GST 122": "Communication in English II",
    "GST 123": "Communication in French or Arabic",
    "GST 221": "Peace Studies And Conflict Resolution",
  },
  "CMP": {
    "CMP 111": "Introduction to Computer",
    "CMP 211": "Introduction to Programming I",
    "CMP 224": "Introduction to web design II"
  },
};

class CourseListTile extends StatelessWidget {
  final String dept;

  const CourseListTile({super.key, required this.dept});
  @override
  Widget build(BuildContext context) {
    List images = [
      Image.asset("assets/images/detail.png"),
      Image.asset("assets/images/detail1.jpg"),
      // Image.asset("assets/images/esp.jpg")
    ];
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '$dept Courses',
            style: TextStyle(color: Colors.brown),
          ),
          backgroundColor: Colors.white,
        ),
        body: ListView.builder(
          itemCount: department[dept]?.length,
          itemBuilder: (BuildContext context, int index) {
            String courseCode = department[dept]!.keys.elementAt(index);
            String courseName = department[dept]!.values.elementAt(index);
            Random random = Random();

            return Card(
              color: const Color.fromARGB(255, 255, 255, 255),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0)),
              child: ListTile(
                leading: Container(
                  // height: 180,
                  // width: 60,
                  color: Colors.amber,
                  child: images[random.nextInt(images.length)],
                ),
                title: Text(courseCode),
                subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(courseName),
                      const Divider(),
                      Row(
                        children: [
                          InkWell(
                              child: const Text("Resources |",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              onTap: () {
                                debugPrint(dept);
                                if (videoList[dept]!.containsKey(
                                    department[dept]!.keys.elementAt(index))) {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) => VideoPlayList(
                                        dept: dept,
                                      ),
                                    ),
                                  );
                                } else {
                                  showDialog(
                                      context: context,
                                      builder: (_) => const AlertDialog(
                                            title: Text('Notice!'),
                                            // icon:Text("hell"),
                                            content: Text(
                                                "No Resource For this course yet"),
                                          ));
                                }
                              }),
                          InkWell(
                            onTap: () {
                              if (questions.containsKey(
                                  department[dept]!.keys.elementAt(index))) {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => QuizScreen(
                                      courseName: department[dept]!
                                          .keys
                                          .elementAt(index),
                                    ),
                                  ),
                                );
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (_) => const AlertDialog(
                                          title: Text('Notice!'),
                                          // icon:Text("hell"),
                                          content: Text("No quiz added yet"),
                                        ));
                              }
                            },
                            child: const Text("  Quiz",
                                style: TextStyle(fontWeight: FontWeight.bold)),
                          ),
                        ],
                      )
                    ]),
              ),
            );
          },
        ));
  }
}
