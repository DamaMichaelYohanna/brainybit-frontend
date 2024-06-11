import 'package:flutter/material.dart';
import 'package:konnet/calender.dart';
import 'package:konnet/course_list.dart';
import 'package:konnet/map.dart';
import 'package:konnet/note/note_list.dart';
import 'package:konnet/todo/todo_list.dart';
import 'colorScheme.dart';

class IndexPage extends StatelessWidget {
  final String name;
  final bool premium;
  const IndexPage({super.key, required this.name, required this.premium});

  final me = 10;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 228, 235, 241),
      child: ListView(children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            "Hi $name 👋🏿",
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text("We are glad to Have you!"),
        ),
        InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const TodoListPage()));
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: mine.shade500, borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Container(
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Colors.white,
                    ),
                    child: SizedBox(
                      height: 40,
                      child: Image.asset(
                        "assets/images/check.png",
                      ),
                    )),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(bottom: 5.0),
                        child: Text(
                          "Task For Today 🔥",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                      // Divider(),
                      Text(
                        "See if you have planned goal for today",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
          child: Text(
            "Courses For Study",
            style: TextStyle(fontSize: 12),
          ),
        ),
        Container(
          color: Colors.white10,
          height: 200,
          padding: const EdgeInsets.all(10),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CourseListTile(dept: "GST"),
                    ),
                  );
                },
                child: Container(
                  width: 200,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)),
                          child: Image.asset("assets/images/gst.jpg")),
                      const Divider(
                        color: Colors.white,
                      ),
                      const Text(
                        "General Studies Courses",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CourseListTile(dept: "ESP"),
                    ),
                  );
                },
                child: Container(
                    width: 200,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5)),
                            child: Image.asset("assets/images/esp.jpeg")),
                        const Divider(
                          color: Colors.white,
                        ),
                        const Text(
                          "Entreprenuer Courses",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )
                      ],
                    )),
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CourseListTile(
                        dept: "CMP",
                      ),
                    ),
                  );
                },
                child: Container(
                  width: 200,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)),
                          child: Image.asset("assets/images/cmp.jpeg")),
                      const Divider(
                        color: Colors.white,
                      ),
                      const Text(
                        "Computer Science Courses",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
          child: Text(
            "Utilities",
            style: TextStyle(fontSize: 12),
          ),
        ),
        Container(
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => NoteListPage()));
                  },
                  child: Container(
                    height: 130,
                    width: 100,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 228, 235, 241),
                          child: Text("📓"),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "Notes",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: mine),
                          ),
                        ),
                        // Divider(),
                        Text("See your Saved Notes",
                            style:
                                TextStyle(fontSize: 12, color: mine.shade900))
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CalenderPage()));
                  },
                  child: Container(
                    height: 130,
                    width: 100,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 228, 235, 241),
                          child: Text("📅"),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            "Calender",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: mine),
                          ),
                        ),
                        Text("Programmes and date",
                            style: TextStyle(fontSize: 12, color: mine))
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const MapPage()));
                  },
                  child: Container(
                    height: 125,
                    width: 100,
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: const Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 228, 235, 241),
                          child: Text("🌍"),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            "Map",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, color: mine),
                          ),
                        ),
                        Text("Locate places in school",
                            style: TextStyle(fontSize: 12, color: mine))
                      ],
                    ),
                  ),
                ),
              ],
            ))
      ]),
    );
  }
}
