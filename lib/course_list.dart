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
    _tabController = TabController(length: 4, vsync: this);
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
        title: Text(
          '$dept Courses',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // give the tab bar a height [can change hheight to preferred height]
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(
                  25.0,
                ),
              ),
              child: TabBar(
                controller: _tabController,
                // give the indicator a decoration (color and border radius)
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25.0,
                  ),
                  color: Colors.green,
                ),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,
                tabs: [
                  // first tab [you can add an icon using the icon property]
                  Tab(
                    text: '100',
                  ),

                  // second tab [you can add an icon using the icon property]
                  Tab(
                    text: '200',
                  ),
                  Tab(
                    text: '300',
                  ),

                  // second tab [you can add an icon using the icon property]
                  Tab(
                    text: '400',
                  ),
                ],
              ),
            ),
            // tab bar view here
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  // first tab bar view widget
                  Center(
                    child: Text(
                      'Place Bid',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  // second tab bar view widget
                  Center(
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Center(
                    child: Text(
                      'Buy Now',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class _CourseListTileState extends State<CourseListTile> {
//   final String dept;
//   _CourseListTileState({super.key, required this.dept});

//   TabController _tabController;

//   @override
//   void initState() {
//     _tabController = TabController(length: 2, vsync: this);
//     super.initState();
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     _tabController.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     List images = [
//       Image.asset("assets/images/detail.png"),
//       Image.asset("assets/images/detail1.jpg"),
//       // Image.asset("assets/images/esp.jpg")
//     ];

//     return  Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Tab bar',
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             // give the tab bar a height [can change hheight to preferred height]
//             Container(
//               height: 45,
//               decoration: BoxDecoration(
//                 color: Colors.grey[300],
//                 borderRadius: BorderRadius.circular(
//                   25.0,
//                 ),
//               ),
//               child: TabBar(
//                 controller: _tabController,
//                 // give the indicator a decoration (color and border radius)
//                 indicator: BoxDecoration(
//                   borderRadius: BorderRadius.circular(
//                     25.0,
//                   ),
//                   color: Colors.green,
//                 ),
//                 labelColor: Colors.white,
//                 unselectedLabelColor: Colors.black,
//                 tabs: [
//                   // first tab [you can add an icon using the icon property]
//                   Tab(
//                     text: 'Place Bid',
//                   ),

//                   // second tab [you can add an icon using the icon property]
//                   Tab(
//                     text: 'Buy Now',
//                   ),
//                 ],
//               ),
//             ),
//             // tab bar view here
//             Expanded(
//               child: TabBarView(
//                 controller: _tabController,
//                 children: [
//                   // first tab bar view widget
//                   Center(
//                     child: Text(
//                       'Place Bid',
//                       style: TextStyle(
//                         fontSize: 25,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),

//                   // second tab bar view widget
//                   Center(
//                     child: Text(
//                       'Buy Now',
//                       style: TextStyle(
//                         fontSize: 25,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
