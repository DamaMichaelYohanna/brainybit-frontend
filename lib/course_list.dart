import 'dart:math';
import 'package:flutter/material.dart';
import 'package:konnet/colorScheme.dart';
import 'package:konnet/video_list.dart';
import 'package:konnet/quiz.dart';
import 'package:konnet/questions_model.dart';
import 'package:konnet/video_model.dart';

/// Flutter code sample for [ListTile].
Map<String, Map<String, Map<String, String>>> department = {
  "ESP": {
    "200": {"ESP 221": "Entrepreneur Process & Skill Development I"},
    "300": {
      "ESP 311": "Introduction",
    }
  },
  "GST": {
    "100": {
      "GST 111": "Use of English I",
      "GST 112": "Logic, Philosophy and Human Existance",
      "GST 113": "Nigerian Peoples and Culture",
      "GST 121": "Use of Library Skill, Study Skills and ICT",
      "GST 122": "Communication in English II",
      "GST 123": "Communication in French or Arabic",
    },
    "200": {
      "GST 221": "Peace Studies And Conflict Resolution",
    }
  },
  "CMP": {
    "100": {
      "CMP 111": "Introduction to Computer",
    },
    "200": {
      "CMP 211": "Introduction to Programming I",
      "CMP 224": "Introduction to web design II"
    }
  },
};
// Row(
//   children: [
//     InkWell(
//       child: const Text("Resources |",
//           style: TextStyle(
//               fontWeight: FontWeight.bold)),
//       onTap: () {
//         debugPrint(dept);
//         if (videoList[dept]!
//             .containsKey(entry.key)) {
//           Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (context) =>
//                   VideoPlayList(
//                 courseCode: entry.key,
//                 courseName: entry.value,
//               ),
//             ),
//           );
//         } else {
//           showDialog(
//               context: context,
//               builder: (_) =>
//                   const AlertDialog(
//                     title: Text('Notice!'),
//                     // icon:Text("hell"),
//                     content: Text(
//                         "No Resource For this course yet oh"),
//                   ));
//         }
//       },
//     ),
//     InkWell(
//       onTap: () {
//         print(entry.value);
//         if (questions
//             .containsKey(entry.key)) {
//           Navigator.of(context).push(
//             MaterialPageRoute(
//               builder: (context) =>
//                   QuizScreen(
//                 courseName: entry.key,
//               ),
//             ),
//           );
//         } else {
//           showDialog(
//               context: context,
//               builder: (_) =>
//                   const AlertDialog(
//                     title: Text('Notice!'),
//                     // icon:Text("hell"),
//                     content: Text(
//                         "No quiz added yet"),
//                   ));
//         }
//       },
//       child: const Text("  Quiz",
//           style: TextStyle(
//               fontWeight: FontWeight.bold)),
//     ),
//   ],
// ),

class CourseListTile extends StatefulWidget {
  final String dept;
  const CourseListTile({key, required this.dept}) : super(key: key);

  @override
  _CourseListTileState createState() => _CourseListTileState(dept: dept);
}

class _CourseListTileState extends State<CourseListTile>
    with SingleTickerProviderStateMixin {
  final String dept;
  _CourseListTileState({key, required this.dept});
  late TabController _tabController;

  @override
  void initState() {
    _tabController =
        TabController(length: department[dept]!.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.brown,
        title: Text(
          '$dept Courses',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: 55,
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(
                  2.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    2.0,
                  ),
                  color: Color.fromARGB(255, 247, 242, 228),
                ),
                labelColor: Colors.brown,
                unselectedLabelColor: Colors.black,
                tabs: department[dept]!.keys.map((String key) {
                  return Tab(text: key);
                }).toList(),
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: department[dept]!.keys.map((String key) {
                  return ListView(
                    children: department[dept]![key]!.entries.map((entry) {
                      return InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => VideoPlayList(
                                courseCode: entry.key,
                                courseName: entry.value,
                              ),
                            ),
                          );
                        },
                        child: Card(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0)),
                            child: ListTile(
                                leading: Container(
                                  height: 60,
                                  width: 60,
                                  padding: EdgeInsets.all(3),
                                  color: Color.fromARGB(255, 247, 242, 228),
                                  child: Icon(Icons.book),
                                ),
                                title: Text(entry.key),
                                subtitle: Text(entry.value))),
                      );
                    }).toList(),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
