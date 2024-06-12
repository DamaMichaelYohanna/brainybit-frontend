import 'package:flutter/material.dart';
import 'package:konnet/colorScheme.dart';
import 'package:konnet/subscribeManual.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SubscribePage extends StatefulWidget {
  const SubscribePage({super.key, required});

  @override
  State<SubscribePage> createState() => _SubscribePageState();
}

class _SubscribePageState extends State<SubscribePage> {
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
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 233, 238, 243),
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
            const Center(
              child: Text(
                "Unlock Everything",
                style: TextStyle(
                  fontSize: 29,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                "Have access to unlimited  past questions for practice, zero ads and much more!",
                style: TextStyle(
                  fontSize: 17,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 8, bottom: 10, right: 9),
                  margin: const EdgeInsets.all(8),
                  // width: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 4.0, horizontal: 20),
                        child: Text("Free Plan",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4.0, left: 20),
                        child: Text(
                          "Limited access",
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 20),
                        child: Text(
                          "Limited Questions",
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 20),
                        child: Text(
                          "Ads Available",
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  // padding: EdgeInsets.all(8),
                  margin: const EdgeInsets.all(8),
                  padding: const EdgeInsets.only(top: 8, bottom: 10, right: 9),
                  // width: 150,
                  decoration: BoxDecoration(
                      color: mine, borderRadius: BorderRadius.circular(10)),
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 4.0, horizontal: 20),
                        child: Text("Paid Plan",
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 4.0, left: 20),
                        child: Text("Free access",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 20),
                        child: Text("Unlimited Questions",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 8.0, left: 20),
                        child: Text("No Ads",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Text(
                  "You can keep enjoying the free plan though with only limited questions (15 per course), or purchase the paid plan token to enjoy premuim services."),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    backgroundColor: mine,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                child: const Text("Automated Token"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SubscribeManualPage(),
                  ));
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: mine,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5))),
                child: const Text("Manual Purchase"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
