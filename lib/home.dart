import 'package:flutter/material.dart';
import 'package:konnet/quiz.dart';
import 'colorScheme.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _tabSwitch(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> tabScreen = [
    const Text("hello world guys"),
    const QuizScreen(),
    const Text("Third Screen!")
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("BrainyBit"),
          centerTitle: true,
          leading: const Icon(Icons.menu),
          actions: const [Icon(Icons.notifications)]),
      body: ListView(children: [
        const Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            "Hi Dama!",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text("We are glad to Have you!"),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          margin: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: mine, borderRadius: BorderRadius.circular(10)),
          child: Row(
            children: [
              Container(
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Image.asset("assets/images/check.png")),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
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
        Center(
            // child: tabScreen.elementAt(_selectedIndex),
            ),
      ]),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_sharp), label: "ChatAI"),
          BottomNavigationBarItem(
              icon: Icon(Icons.admin_panel_settings), label: "Profile")
        ],
        onTap: _tabSwitch,
        currentIndex: _selectedIndex,
      ),
    );
  }
}
