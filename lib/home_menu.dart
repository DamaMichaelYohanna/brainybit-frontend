import 'package:flutter/material.dart';
import 'package:konnet/chat.dart';
import 'package:konnet/drawer_pages/hot_line.dart';
import 'package:konnet/index.dart';
import 'package:konnet/profile.dart';
import 'package:konnet/colorScheme.dart';

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
    const ProfilePage()
  ];

  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text("BrainyBit"),
            backgroundColor: mine,
            centerTitle: true,
            // leading: const Icon(Icons.menu),
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
        drawer: Drawer(
          backgroundColor: Colors.white,
          child: ListView(
            children: [
              DrawerHeader(
                child: Image.asset("assets/images/logo.png"),
              ),
              ListTile(
                title: const Text("NSUK Hot Lines"),
                leading: const Icon(Icons.call),
                onTap: (() {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const HotLine(),
                  ));
                }),
              ),
              ListTile(
                  title: const Text("About BrainyBit"),
                  leading: const Icon(Icons.apps_outage),
                  // tileColor: Colors.white,
                  onTap: (() {})),
              const Divider(
                color: Colors.white,
              ),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Special",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              ListTile(
                title: const Text("Hire A tutor"),
                leading: const Icon(Icons.work),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Make Donation"),
                leading: const Icon(Icons.attach_money),
                onTap: () {},
              ),
              ListTile(
                  title: const Text("Be A Contributor"),
                  leading: const Icon(Icons.bubble_chart),
                  // tileColor: Colors.white,
                  onTap: (() {})),
              const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "More",
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
              const Divider(
                color: Colors.white,
              ),
              ListTile(
                title: const Text("Drop Suggestion"),
                leading: const Icon(Icons.local_offer_rounded),
                onTap: () {},
              ),
              ListTile(
                title: const Text("Share application"),
                leading: const Icon(Icons.share),
                onTap: () {},
              ),
            ],
          ),
        ));
  }
}
