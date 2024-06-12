import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:konnet/colorScheme.dart';
import 'package:http/http.dart' as http;

class NotifcationList extends StatefulWidget {
  const NotifcationList({super.key});

  @override
  State<NotifcationList> createState() => _NotifcationListState();
}

class _NotifcationListState extends State<NotifcationList> {
  List<dynamic> notificationList = [];

  void fetch() async {
    // Await the result of the asynchronous online query
    var url = Uri.https('locator-xi.vercel.app', 'news');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        setState(() {
          notificationList = json.decode(response.body);
        });
      }
    } catch (e) {
      // don nothing
    }
  }

  @override
  void initState() {
    super.initState();
    fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Notifications"),
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
                  return NotificationTile(
                      title: notificationList[index]['title'],
                      content: notificationList[index]['content'],
                      color: Colors.red);
                },
              )
            : Center(
                child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Column(
                  children: [
                    Image.asset("assets/images/notif.gif"),
                    Text(
                      "No New Notification Available!",
                      style: TextStyle(
                          fontSize: 17,
                          color: mine,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )));
  }
}

class NotificationTile extends StatelessWidget {
  final String title;
  final String content;
  final Color? color;
  const NotificationTile(
      {super.key,
      required this.title,
      required this.content,
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
          title,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(
          maxLines: null,
          content,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(),
        ),
        leading: CircleAvatar(
          backgroundColor: color,
          foregroundColor: Colors.white,
          child: const Icon(Icons.warning_amber),
        ),
      ),
    );
  }
}
