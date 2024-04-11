import 'package:flutter/material.dart';
import 'package:konnet/colorScheme.dart';
import 'package:konnet/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required});

  // function to fetch user details from sharedpref
  Future<Map<String, String>> getUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String name = prefs.getString("fullName") ?? "";
    String email = prefs.getString("email") ?? "";
    String imageurl = prefs.getString("imageUrl") ?? "";

    return {"name": name, "email": email, "image": imageurl};
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

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mine.shade100,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CircleAvatar(
              minRadius: 50,
              maxRadius: 60,
              child: Image.asset('assets/images/bg.png'),
            ),
          ),
          const Card(
            elevation: 1.5,
            shadowColor: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: ListTile(
              title: Text(
                "Dama Michael Yohanna",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              leading: Icon(Icons.person_off_outlined),
            ),
          ),
          const Card(
            elevation: 1.5,
            shadowColor: Colors.white,
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            child: ListTile(
              title: Text(
                "Get2dama11@gmail.com",
                style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
              ),
              leading: Icon(Icons.email),
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
          const Expanded(child: Text('')),
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
