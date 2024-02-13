import 'package:flutter/material.dart';
import 'package:konnet/course_list.dart';
import 'colorScheme.dart';

class IndexPage extends StatelessWidget {
  const IndexPage({super.key});

  final me = 10;

  @override
  Widget build(BuildContext context) {
    return ListView(children: [
      const Padding(
        padding: EdgeInsets.all(10),
        child: Text(
          "Hi Dama! 👋🏿",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Text("We are glad to Have you!"),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: mine.shade200, borderRadius: BorderRadius.circular(10)),
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
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: Text(
                      "Task For Today 🔥",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  // Divider(),
                  Text(
                    "See if you have planned goal for today",
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      const Divider(),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 3),
        child: Text(
          "Courses For Study",
          style: TextStyle(fontSize: 12),
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const CourseListTile(dept: "GST"),
            ),
          );
        },
        child: Container(
          color: Colors.white10,
          height: 150,
          padding: const EdgeInsets.all(10),
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Container(
                  // height: 80,
                  width: 150,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)),
                          child: Image.asset("assets/images/read.jpg")),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "General Studies Courses",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const CourseListTile(dept: "ESP"),
                    ),
                  );
                },
                child: Container(
                    width: 150,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Column(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                topRight: Radius.circular(5)),
                            child: Image.asset("assets/images/esp.jpg")),
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            "Entreprenuer Courses",
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          ),
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
                  // height: 80,
                  width: 150,
                  margin: EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    children: [
                      ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)),
                          child: Image.asset("assets/images/cmp.jpg")),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Computer Science Courses",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
  }
}
