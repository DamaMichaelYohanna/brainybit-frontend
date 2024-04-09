Map<String, String> courseDetail = {
  "CMP 211":
      "This is an introductory course into programming using Java Programming lanaguage",
  "CMP 224": "INFO COMING SOON",
  "CMP 213": "This course is about electronic circuitry.",
  "ESP 221":
      "This course is an introduction into business operation registeration among others things. "
};

// class SettingsScreen extends StatelessWidget {
//   const SettingsScreen({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text('Settings'),
//           bottom: PreferredSize(
//             preferredSize: Size.fromHeight(AppBar().preferredSize.height),
//             child: Container(
//               height: 50,
//               padding: const EdgeInsets.symmetric(
//                 horizontal: 20,
//                 vertical: 5,
//               ),
//               child: Container(
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(
//                     10,
//                   ),
//                   color: Colors.grey[200],
//                 ),
//                 child: TabBar(
//                   labelColor: Colors.white,
//                   unselectedLabelColor: Colors.black,
//                   indicator: BoxDecoration(
//                     borderRadius: BorderRadius.circular(
//                       10,
//                     ),
//                     color: Colors.pink,
//                   ),
//                   tabs: const [
//                     Tab(
//                       text: 'Basic',
//                     ),
//                     Tab(
//                       text: 'Advanced',
//                     )
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//         body: const TabBarView(
//           children: [
//             Center(
//               child: Text(
//                 'Basic Settings',
//                 style: TextStyle(
//                   fontSize: 30,
//                 ),
//               ),
//             ),
//             Center(
//               child: Text(
//                 'Advanced Settings',
//                 style: TextStyle(
//                   fontSize: 30,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class EachListTile extends StatelessWidget{
//   final String dept;
//   EachListTile({ super.key, required this.dept});


//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return ListView.builder(
//         itemCount: department[dept]?.length,
//         itemBuilder: (BuildContext context, int index) {
//           String courseCode = department[dept]!.keys.elementAt(index);
//           String courseName = department[dept]!.values.elementAt(index);
//           print(courseCode);
//           Random random = Random();

//           return Card(
//             color: const Color.fromARGB(255, 255, 255, 255),
//             shape:
//                 RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
//             child: ListTile(
//               leading: Container(
//                 // height: 180,
//                 // width: 60,
//                 color: Colors.amber,
//                 child: images[random.nextInt(images.length)],
//               ),
//               title: Text(courseCode),
//               subtitle: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(courseName),
//                     const Divider(),
//                     Row(
//                       children: [
//                         InkWell(
//                             child: const Text("Resources |",
//                                 style: TextStyle(fontWeight: FontWeight.bold)),
//                             onTap: () {
//                               debugPrint(dept);
//                               if (videoList[dept]!.containsKey(
//                                   department[dept]!.keys.elementAt(index))) {
//                                 Navigator.of(context).push(
//                                   MaterialPageRoute(
//                                     builder: (context) => VideoPlayList(
//                                       courseCode: courseCode,
//                                       courseName: courseName,
//                                     ),
//                                   ),
//                                 );
//                               } else {
//                                 showDialog(
//                                     context: context,
//                                     builder: (_) => const AlertDialog(
//                                           title: Text('Notice!'),
//                                           // icon:Text("hell"),
//                                           content: Text(
//                                               "No Resource For this course yet"),
//                                         ));
//                               }
//                             }),
//                         InkWell(
//                           onTap: () {
//                             if (questions.containsKey(
//                                 department[dept]!.keys.elementAt(index))) {
//                               Navigator.of(context).push(
//                                 MaterialPageRoute(
//                                   builder: (context) => QuizScreen(
//                                     courseName:
//                                         department[dept]!.keys.elementAt(index),
//                                   ),
//                                 ),
//                               );
//                             } else {
//                               showDialog(
//                                   context: context,
//                                   builder: (_) => const AlertDialog(
//                                         title: Text('Notice!'),
//                                         // icon:Text("hell"),
//                                         content: Text("No quiz added yet"),
//                                       ));
//                             }
//                           },
//                           child: const Text("  Quiz",
//                               style: TextStyle(fontWeight: FontWeight.bold)),
//                         ),
//                       ],
//                     )
//                   ]),
//             ),
//           );
//         },
//       ),
//   }}

//       // body: 