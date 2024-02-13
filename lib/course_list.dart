import 'package:flutter/material.dart';
import 'package:konnet/quiz.dart';
import 'dart:math';

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
  "CMP": {"CMP 111": "Introduction to Computer"}
};

class CourseListTile extends StatelessWidget {
  final String dept;

  const CourseListTile({super.key, required this.dept});
  void _back() {}
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

            return InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const QuizScreen(),
                  ),
                );
              },
              child: Card(
                color: const Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0)),
                child: ListTile(
                  leading: Container(
                    height: 140,
                    width: 60,
                    child: ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: images[random.nextInt(images.length)]),
                  ),
                  title: Text(courseCode),
                  subtitle: Text(courseName),
                ),
              ),
            );
          },
        ));
  }
}
