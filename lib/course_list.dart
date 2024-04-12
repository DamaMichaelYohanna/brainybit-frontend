import 'package:flutter/material.dart';
import 'package:konnet/colorScheme.dart';
import 'package:konnet/video_list.dart';

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
      "CMP 112": "Introduction to Computer Hardware"
    },
    "200": {
      "CMP 211": "Introduction to Programming I",
      "CMP 212": "introduction to Low Level Programming.",
      "CMP 213": "Digital Electronics",
      "CMP 214": "Introduction to Data Structure.",
      "CMP 215": "System Analysis and design",
      "CMP 224": "Introduction to web design II",
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
