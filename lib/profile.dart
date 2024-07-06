import 'package:flutter/material.dart';
import 'package:brainybit/colorScheme.dart';
import 'package:brainybit/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  // function to fetch user details from sharedpref
  void getUserInfo() async {
    await SharedPreferences.getInstance().then((value) => {
          name = value.getString("fullName") ?? "",
          email = value.getString("email") ?? "",
          imageUrl = value.getString("imageUrl") ?? "",
          setState(() {})
        });
  }

  // function call to logout the user
  Future clearUserInfo() async {
    debugPrint("something");
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  void logOut() {
    clearUserInfo();
  }

  String name = '';
  String email = '';
  String imageUrl = '';

  @override
  void initState() {
    getUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mine.shade100,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CircleAvatar(
              minRadius: 50,
              maxRadius: 60,
              child: imageUrl.isEmpty
                  ? Image.asset('assets/images/logo.png')
                  : Image.network(imageUrl),
            ),
          ),
          Card(
            elevation: 1.5,
            shadowColor: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: ListTile(
              title: Text(
                name,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              leading: const Icon(Icons.person_off_outlined),
            ),
          ),
          Card(
            elevation: 1.5,
            shadowColor: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: ListTile(
              title: Text(
                email,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              leading: const Icon(Icons.email),
            ),
          ),
          const Card(
            shadowColor: Colors.white,
            elevation: 1.5,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: ListTile(
              title: Text(
                "***********",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              leading: Icon(Icons.lock),
              trailing: Icon(Icons.update),
            ),
          ),
          Card(
            shadowColor: Colors.white,
            elevation: 1.5,
            color: const Color.fromARGB(255, 251, 248, 248),
            margin: const EdgeInsets.all(12),
            child: ListTile(
              onTap: () {
                logOut();
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginScreen()),
                );
              },
              title: const Text(
                "Log out",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              leading: const Icon(Icons.logout_sharp),
            ),
          ),
        ],
      ),
    );
  }
}
