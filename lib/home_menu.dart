import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:brainybit/about.dart';
import 'package:brainybit/chat.dart';
import 'package:brainybit/drawer_pages/hot_line.dart';
import 'package:brainybit/drawer_pages/suggestion.dart';
import 'package:brainybit/index.dart';
import 'package:brainybit/main.dart';
import 'package:brainybit/notification.dart';
import 'package:brainybit/profile.dart';
import 'package:brainybit/colorScheme.dart';
import 'package:brainybit/subscribe.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _tabSwitch(int index) {
    setState(() {
      _selectedIndex = index;
      print(index);
    });
  }

  void getUsername() async {
    await SharedPreferences.getInstance().then((value) => {
          setState(
            () {
              username = value.getString("fullName") ?? "";
              premium = value.getBool("premium") ?? false;
            },
          )
        });
  }

  @override
  void initState() {
    super.initState();
    getUsername();
  }

  int _selectedIndex = 0;
  String username = '';
  bool premium = false;
  @override
  Widget build(BuildContext context) {
    List<Widget> tabScreen = [
      IndexPage(name: username, premium: premium),
      const ChatScreen(),
      const ProfilePage()
    ];
    return Scaffold(
      appBar: AppBar(
          title: const Text("BrainyBit"),
          backgroundColor: mine,
          foregroundColor: Colors.white,
          centerTitle: true,
          // leading: const Icon(Icons.menu),
          actions: [
            !isPremium
                ? IconButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SubscribePage()));
                    },
                    icon: const Icon(Icons.monetization_on),
                  )
                : Text(""),
            IconButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const NotifcationList()));
                },
                icon: const Icon(Icons.notifications))
          ]),
      body: tabScreen.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: mine,
        selectedItemColor: Colors.white,
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
                onTap: (() {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const AboutUsPage(),
                  ));
                })),
            const Divider(
              color: Colors.white,
            ),
            // const Padding(
            //   padding: EdgeInsets.all(10.0),
            //   child: Text(
            //     "Special",
            //     style: TextStyle(fontStyle: FontStyle.italic),
            //   ),
            // ),
            // ListTile(
            //   title: const Text("Make Donation"),
            //   leading: const Icon(Icons.attach_money),
            //   onTap: () {
            //     Navigator.of(context).push(MaterialPageRoute(
            //       builder: (context) => const DonationPage(),
            //     ));
            //   },
            // ),
            // ListTile(
            //     title: const Text("Be A Contributor"),
            //     leading: const Icon(Icons.bubble_chart),
            //     // tileColor: Colors.white,
            //     onTap: (() {
            //       Navigator.of(context).push(MaterialPageRoute(
            //         builder: (context) => const Collab(),
            //       ));
            //     })),
            // const Divider(
            //   color: Colors.white,
            // ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "More..",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),

            ListTile(
              title: const Text("Drop Suggestion"),
              leading: const Icon(Icons.local_offer_rounded),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SuggestionPage(),
                ));
              },
            ),
            // const ListTile(
            //   title: Text("Share application"),
            //   leading: Icon(Icons.share),
            //   // onTap: () {},
            // ),
            const Divider(
              color: Colors.white,
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Coming Soon",
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),

            ListTile(
              title: const Text("Hire A tutor"),
              leading: const Icon(Icons.work),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Become A tutor"),
              leading: const Icon(Icons.group),
              onTap: () {},
            ),
            ListTile(
              title: const Text("Campus Transport"),
              leading: const Icon(Icons.bus_alert),
              onTap: () {},
            ),
          ],
        ),
      ),
      floatingActionButton: _selectedIndex != 1
          ? FloatingActionButton(
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                      topLeft: Radius.circular(20))),
              tooltip: "Live Chat",
              backgroundColor: mine,
              onPressed: () async {
                String contact = "+2348160535033";
                String text = 'Hello from BrainyBit';
                String androidUrl = "whatsapp://send?phone=$contact&text=$text";
                await launchUrl(Uri.parse(androidUrl));
              },
              child: const Icon(
                FontAwesomeIcons.rocketchat,
                color: Colors.white,
              ))
          : null,
    );
  }
}
