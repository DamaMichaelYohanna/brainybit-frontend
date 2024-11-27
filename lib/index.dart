import 'package:flutter/material.dart';
import 'package:brainybit/calender.dart';
import 'package:brainybit/course_list.dart';
import 'package:brainybit/map.dart';
import 'package:brainybit/note/note_list.dart';
import 'package:brainybit/todo/todo_list.dart';
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
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
          padding: EdgeInsets.all(8),
          height: 180,
          child: Row(
            children: [
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CourseListTile(
                          dept: "GST",
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage("assets/images/sit.png"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(187, 78, 115, 148),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: const Text("GST Resource",
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const CourseListTile(
                          dept: "ESP",
                        ),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 8),
                    width: double.infinity,
                    alignment: Alignment.bottomCenter,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: AssetImage("assets/images/sat.png"),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(187, 78, 115, 148),
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                      child: const Text("ESP Resources",
                          // textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20)),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 30,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(18),
            margin: const EdgeInsets.all(8),
            width: double.infinity,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(10)),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: const Color.fromARGB(
                                        255, 189, 204, 216),
                                    borderRadius: BorderRadius.circular(100)),
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.only(right: 10),
                                child: const Icon(Icons.computer)),
                            const Text("Computer Sci.."),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                            // height: 60,
                            width: 130,
                            padding: const EdgeInsets.all(6),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: const Color(0xFF4E7394),
                                borderRadius: BorderRadius.circular(10)),
                            child: Text(
                              "Proceed",
                              style: TextStyle(color: Colors.white),
                            )),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/cmp1.png'))),
                  ),
                )
              ],
            ),
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
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => NoteListPage()));
                    },
                    child: Container(
                      height: 130,
                      margin: EdgeInsets.only(right: 8),
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
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CalenderPage()));
                    },
                    child: Container(
                      height: 130,
                      margin: EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const MapPage()));
                    },
                    child: Container(
                      height: 125,
                      margin: EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10)),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
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
                ),
              ],
            ))
      ]),
    );
  }
}
