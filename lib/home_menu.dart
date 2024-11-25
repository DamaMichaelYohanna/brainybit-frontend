import 'package:brainybit/login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:brainybit/about.dart';
import 'package:brainybit/chat.dart';
import 'package:brainybit/drawer_pages/hot_line.dart';
import 'package:brainybit/drawer_pages/suggestion.dart';
import 'package:brainybit/index.dart';
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
  int _selectedIndex = 0;
  String username = '';
  bool premium = false;

  // Get username and handle login checks
  void getUsername() async {
    await SharedPreferences.getInstance().then((value) {
      String lastLogin = value.getString('lastLogin') ?? '';
      if (lastLogin.isNotEmpty) {
        DateTime lastLoginDateTime = DateTime.parse(lastLogin);
        DateTime timeNow = DateTime.now();
        Duration difference = timeNow.difference(lastLoginDateTime);
        if (difference.inDays > 10) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        } else {
          setState(() {
            username = value.getString("fullName") ?? "";
            premium = value.getBool("premium") ?? false;
          });
        }
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getUsername();
  }

  // Pages for the BottomNavigationBar
  final List<Widget> _pages = [
    const IndexPage(name: '', premium: false),
    const ChatScreen(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("BrainyBit"),
        backgroundColor: mine,
        foregroundColor: Colors.white,
        centerTitle: true,
        actions: [
          !premium
              ? IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SubscribePage()));
                  },
                  icon: const Icon(Icons.monetization_on),
                )
              : const SizedBox.shrink(),
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const NotifcationList()));
            },
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: mine,
        selectedItemColor: Colors.white,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
              icon: Icon(Icons.chat_sharp), label: "ChatAI"),
          BottomNavigationBarItem(
              icon: Icon(Icons.admin_panel_settings), label: "Profile"),
        ],
      ),
      drawer: _buildDrawer(),
      floatingActionButton: _selectedIndex != 1
          ? FloatingActionButton(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(100),
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                  topLeft: Radius.circular(20),
                ),
              ),
              tooltip: "Live Chat",
              backgroundColor: mine,
              onPressed: () async {
                String contact = "+2348160535033";
                String text = 'Hello from BrainyBit';
                String androidUrl = "whatsapp://send?phone=$contact&text=$text";
                await launchUrl(Uri.parse(androidUrl));
              },
              child:
                  const Icon(FontAwesomeIcons.rocketchat, color: Colors.white),
            )
          : null,
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        children: [
          DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),
          ListTile(
            title: const Text("NSUK Hot Lines"),
            leading: const Icon(Icons.call),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const HotLine()),
              );
            },
          ),
          ListTile(
            title: const Text("About BrainyBit"),
            leading: const Icon(Icons.apps_outage),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const AboutUsPage()),
              );
            },
          ),
          const Divider(),
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
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const SuggestionPage()),
              );
            },
          ),
          ListTile(
            title: const Text("Privacy Policy"),
            leading: const Icon(Icons.privacy_tip),
            onTap: () {
              final Uri _url =
                  Uri.parse('https://brainybit.vercel.app/general/privacy/');
              launchUrl(_url);
            },
          ),
          ListTile(
            title: const Text("Rate BrainyBit"),
            leading: const Icon(Icons.star),
            onTap: () {
              final Uri _url = Uri.parse(
                  'https://play.google.com/store/apps/details?id=codewithdama.brainybit');
              launchUrl(_url);
            },
          ),
        ],
      ),
    );
  }
}
