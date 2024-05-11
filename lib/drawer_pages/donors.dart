import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:konnet/colorScheme.dart';
import 'package:http/http.dart' as http;
import 'package:konnet/utility.dart';

DatabaseHelper databaseHelper = DatabaseHelper.instance;

class Donors extends StatefulWidget {
  const Donors({super.key});

  @override
  State<Donors> createState() => _DonorsState();
}

class _DonorsState extends State<Donors> {
  List<Map<String, dynamic>> notificationList = [];
  // Function for login in.

  void fetch() async {
    // Await the result of the asynchronous database query
    var url = Uri.https('locator-xi.vercel.app', 'donation');
    try {
      final response = await http.get(url);
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        setState(() {
          notificationList =
              json.decode(response.body).cast<Map<String, dynamic>>();
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  List<Color> colors = [
    Colors.black,
    Colors.blue,
    Colors.green,
    const Color.fromARGB(255, 53, 172, 199),
    Colors.orange
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Notification"),
          backgroundColor: mine,
          foregroundColor: Colors.white,
          actions: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.refresh))
          ],
        ),
        body: notificationList.isNotEmpty
            ? ListView.builder(
                itemCount: notificationList.length,
                itemBuilder: (context, index) {
                  // Create an instance of Random
                  Random random = Random();
                  // Generate a random index within the range of the list
                  int randomIndex = random.nextInt(colors.length);
                  Map<String, dynamic> item = notificationList[index];
                  return NotificationTile(
                      name: item['name'],
                      amount: 10,
                      color: colors[randomIndex]);
                },
              )
            : Center(
                child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Image.asset("assets/images/notif.gif"),
              )));
  }
}

class NotificationTile extends StatelessWidget {
  final String name;
  final int amount;
  final Color? color;
  const NotificationTile(
      {super.key,
      required this.name,
      required this.amount,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 0,
      color: const Color.fromARGB(255, 228, 235, 241),
      child: ListTile(
        onLongPress: () {},
        title: Text(
          '₦$amount',
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          name,
          maxLines: null,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(),
        ),
        leading: CircleAvatar(
          backgroundColor: color,
          foregroundColor: Colors.white,
          child: const Icon(Icons.verified_user),
        ),
      ),
    );
  }
}
