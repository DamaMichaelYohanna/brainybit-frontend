import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:brainybit/colorScheme.dart';
import 'package:http/http.dart' as http;

class NotifcationList extends StatefulWidget {
  const NotifcationList({super.key});

  @override
  State<NotifcationList> createState() => _NotifcationListState();
}

class _NotifcationListState extends State<NotifcationList> {
  List<dynamic> notificationList = [];

  Future<String> fetch() async {
    // Await the result of the asynchronous online query
    // return Future.delayed(const Duration(seconds: 0), () async {
    //   var url = Uri.https('brainybit.vercel.app', '/api/v1/general/news');
    //   try {
    //     final response = await http.get(url);
    //     if (response.statusCode == 200) {
    //       print("we done here");
    //       setState(() {
    //         notificationList = json.decode(response.body);
    //         return 'hello';
    //       });
    //     } else {
    //       throw Exception('Failed to load new'); // Handle non-200 status codes
    //     }
    //   } catch (e) {
    //     rethrow;
    //   }
    // });
    return Future.delayed(const Duration(seconds: 0), () async {
      var url = Uri.https('brainybit.vercel.app', '/api/v1/general/news');
      try {
        final response = await http.get(url);

        if (response.statusCode == 200) {
          notificationList = json.decode(response.body);
          return "done";
        } else {
          throw Exception('Failed to load news'); // Handle non-200 status codes
        }
      } catch (e) {
        // Log or handle the error appropriately
        rethrow; // Re-throw for FutureBuilder to handle
      }
      // throw Exception("Custom Error");
    });
  }

  @override
  void initState() {
    super.initState();
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
      body: FutureBuilder(
        future: fetch(),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(
              child: Text(
                'Could not load quiz. Make sure your internet is good and check back later.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            );
          } else {
            return notificationList.isNotEmpty
                ? ListView.builder(
                    itemCount: notificationList.length,
                    itemBuilder: (context, index) {
                      return NotificationTile(
                          title: notificationList[index]['title'],
                          content: notificationList[index]['content'],
                          color: Colors.green);
                    },
                  )
                : Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 10),
                      child: Column(
                        children: [
                          Image.asset("assets/images/news.png"),
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "No New Notification Available!",
                              style: TextStyle(
                                  fontSize: 17,
                                  color: mine,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  );
          }
        },
      ),
    );
  }
}

class NotificationTile extends StatefulWidget {
  final String title;
  final String content;
  final Color? color;

  const NotificationTile({
    super.key,
    required this.title,
    required this.content,
    required this.color,
  });

  @override
  State<NotificationTile> createState() => _NotificationTileState();
}

class _NotificationTileState extends State<NotificationTile> {
  bool isExpanded = false; // Track whether the tile is expanded

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      elevation: 0,
      color: const Color.fromARGB(255, 228, 235, 241),
      child: InkWell(
        onTap: () {
          setState(() {
            isExpanded = !isExpanded; // Toggle expanded state
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                widget.title,
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
              subtitle: isExpanded
                  ? null // Show full content when expanded
                  : Text(
                      widget.content,
                      overflow:
                          TextOverflow.ellipsis, // Ellipsis when collapsed
                      maxLines: 1,
                    ),
              leading: CircleAvatar(
                backgroundColor: widget.color,
                foregroundColor: const Color.fromARGB(255, 255, 255, 255),
                child: const Icon(Icons.notifications),
              ),
            ),
            if (isExpanded)
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 5),
                child: Text(
                  widget.content,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
