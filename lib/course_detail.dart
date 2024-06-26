Map<String, String> courseDetail = {
  "CSC 101":
      "Survey of computers and information processing and their roles in society. The course introduces a historical perspective of computing, hardware, software, information system and human resources and explores their integration and application in business and other section of the society.",
  "CSC 122":
      "This courses covers: Computer circuit, diode arrays, PIAs etc. It also includes circuit fabrication process, hardware design, form factor, computer memory, peripheral devices, output and input devices among others.",
  "CMP 121":
      "In this course you will be learning, problem solving strategies, role of algorithm in problem solving process, concept and properties of algorithm. Development of flow chart, pseudo code, and implementation of algorithm using a programming language.",
  "CMP 122":
      "You will be introduce to concept of World Wide Web and components, client-server programming model and protocols. You will also learn the structure and functionality of the WWW, programming language used in web design, web hosting among others. ",
  "CMP 211":
      "This course is all about problem solving methods and algorithm development, designing, coding, debugging and documenting programs using techniques of a good programming language style. You will do all these using JAVA programming.",
  "CMP212":
      "Computer Structure, Machine language, assembly language, addressing techniques and macros file I/O, assemble segmentation and linkages etc.",
  "CMP 213":
      "This course is about elementary digital circuit, basic boolean algebra, logic gates(AND OR NOT) etc",
  "CMP 214":
      "You will learn about data structures such as bits, byte, words, linear structure,  arrays, tree, heaps, stacks, queues among others",
  "CMP 215":
      "Introduction to system design, system analysis, analysis tools, software development lifecycle etc.",
  "CMP 221":
      "You will learn advance using of Java programming. A continuation of CMP 211",
  "CMP 222":
      "You will learn basic of database management system, database design, relationships, entity, schema and structure query language",
  "CMP 223":
      "More on boolean algebra and logic gate, circuit minimization, sequential circuit, error detection and correction, etc.",
  "CMP 224":
      "Introduction to web design, creating web pages, attributes, list, tables links and images, cascading style sheet, understanding URL. Also covers different CSS selector, and web page layout.",
  "CMP 225": "The course covers Basic set thoery, Matrices etc.",
  "ESP 221":
      "This course is an introduction into business operation registeration among others things. ",
  "CMP 311":
      "You will learn basic of OOP concepts like objects classes, inheritance, abstration, polymorphism and OOP implementation using JAVA",
  "CMP 312":
      "This course is all about introduction to computer processes, multi-programming and multi-processing the working of the operationg system.",
  "CMP 313":
      "Continuation Of CMP 214 and adding of algorithm to data structure. Concept like complexity are also treated.",
  "CMP 314":
      "Review of compilter and interpreter, compilter design, grammer, lexical etc.",
  "CMP 315":
      "Advance concept of web development like database integration, queries and others.",
  "CMP 316": "",
  "CMP 317":
      "Relational Database, Mapping conceptual schema to relational schema, Database query langauage.",
  "CMP All about project writing from chapter one to chapter five.": "",
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