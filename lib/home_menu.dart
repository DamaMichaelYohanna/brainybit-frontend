import 'package:flutter/material.dart';
import 'package:konnet/chat.dart';
import 'package:konnet/index.dart';
import 'package:konnet/quiz.dart';

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
    const IndexPage(),
    const ChatScreen(),
    const Text("Third Screen!")
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text("BrainyBit"),
          centerTitle: true,
          leading: const Icon(Icons.computer),
          actions: const [Icon(Icons.notifications)]),
      body: tabScreen.elementAt(_selectedIndex),
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
