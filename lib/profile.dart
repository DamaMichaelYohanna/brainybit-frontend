import 'package:flutter/material.dart';
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
    debugPrint("about calling");
    clearUserInfo();
    debugPrint("after calling");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: CircleAvatar(
            minRadius: 50,
            maxRadius: 60,
            child: Image.asset('assets/images/bg.png'),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 3),
          child: Text("Name"),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 3),
          child: Text(
            "Dama Michael Yohanna",
            style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Divider(),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: const Text("Email"),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.0),
          child: const Text(
            "Get2dama11@gmail.com",
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Divider(),
        ),
        Expanded(child: Text("")),
        InkWell(
          onTap: () {},
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset("assets/images/synchronize.png")),
                const Text(
                  "Change Password",
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
          ),
        ),
        Divider(),
        InkWell(
          onTap: logOut,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(
                    height: 30,
                    width: 30,
                    child: Image.asset("assets/images/logout.png")),
                const Text("Log out", style: TextStyle(fontSize: 15))
              ],
            ),
          ),
        )
      ],
    );
  }
}
