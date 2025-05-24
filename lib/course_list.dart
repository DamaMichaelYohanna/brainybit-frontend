import 'package:flutter/material.dart';
import 'package:brainybit/colorScheme.dart';
import 'package:brainybit/video_list.dart';

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
      // "GST 112": "Logic, Philosophy and Human Existance",
      "GST 121": "Nigerian Peoples and Culture",
    },
    "200": {
      "GST 212": "Logic, Philosopy and Human Existence ",
      "GST 221": "Peace Studies And Conflict Resolution",
    },
    "400": {
      "GST 411": "Leadership in Contemporary Nigeria",
    }
  },
  "CMP": {
    "100": {
      "COS 111": "Introduction to Computing Sciences",
      "CSC 112": "Computer Hardware",
      // "COS 121": "Introduction to Problem solving",
      // "CSC 122": "Introductio to Web Design",
      // "CSC 123": "Introduction to Database Management System",
    },
    "200": {
      "COS 211": "Introduction to Programming I",
      "CSC 211": "Discrete Structure",
      "IFT 211": "Digital Logic Design",
      "SEN 211": "introduction to Software Engineering",
      "NS-CSC 211": "Front-End Web Development",

      // "CMP 215": "System Analysis and design",
      // "CMP 221": "Computer Programming II",
      // "CMP 222": "Introduction To Database Management System",
      // "CMP 223": "Logic Design",
      // "CMP 224": "Introduction To Web Programming II",
      // "CMP 225": "",

      // "CMP "
    },
    "300": {
      "CMP 311": "Object Oriented programming",
      "CMP 312": "Operating Systems",
      "CMP 313": "Data Structures And Algorithms",
      "CMP 314": "Compiler Construction",
      "CMP 315": "Web Programming and Database Management",
      "CMP 316": "Data Communication/Network",
      "CMP 317": "Data Management",
      "CMP 319": "Research Methodology/Seminar",
      "MTH 317": "Numerical Analysis I",
      // "CMP "
    }
  },
};

class CourseListTile extends StatefulWidget {
  final String dept;
  const CourseListTile({super.key, required this.dept});

  @override
  CourseListTileState createState() => CourseListTileState(dept: dept);
}

class CourseListTileState extends State<CourseListTile>
    with SingleTickerProviderStateMixin {
  final String dept;
  CourseListTileState({required this.dept});
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
        // backgroundColor: Colors.white,
        // foregroundColor: Colors.brown,
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
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                // color: Colors.white,
                borderRadius: BorderRadius.circular(
                  2.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                // give the indicator a decoration (color and border radius)
                // generate tabs from keys of the departmental list.
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
                                  padding: const EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      color: mine.shade900,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: const Icon(
                                    Icons.blur_on,
                                    color: Colors.white,
                                  ),
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
