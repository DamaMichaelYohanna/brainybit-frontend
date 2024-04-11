import 'package:flutter/material.dart';
import 'package:konnet/colorScheme.dart';
// import 'package:konnet/colorScheme.dart';
import 'package:konnet/utility.dart';

DatabaseHelper databaseHelper = DatabaseHelper.instance;

class NotifcationList extends StatefulWidget {
  const NotifcationList({super.key});

  @override
  State<NotifcationList> createState() => _NotifcationListState();
}

class _NotifcationListState extends State<NotifcationList> {
  List<Map<String, dynamic>> notificationList = [];

  void fetch() async {
    // Await the result of the asynchronous database query

    await databaseHelper.queryAllRows("Note").then((value) => {
          setState(() {
            notificationList = value;
          }),
        });
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
          title: const Text("Notification"),
          backgroundColor: mine,
          foregroundColor: Colors.white,
        ),
        body: notificationList.isNotEmpty
            ? ListView.builder(
                itemCount: notificationList.length,
                itemBuilder: (context, index) {
                  return const NotificationTile(
                      title: "title", content: "content", color: Colors.red);
                },
              )
            : Center(
                child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0),
                child: Image.asset("assets/images/notification.png"),
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
      margin: EdgeInsets.all(10),
      elevation: 0,
      color: Color.fromARGB(255, 228, 235, 241),
      child: ListTile(
        onLongPress: () {},
        title: const Text(
          "Closure of School",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: const Text(
          maxLines: null,
          "You are applying Flutter's main Gradle plugin imperatively using the apply script method, which is deprecated and will be removed in a future release. Migrate to applying Gradle plugins with the declarative plugins block: https://flutter.dev/go/flutter-gradle-plugin-apply",
          overflow: TextOverflow.ellipsis,
          style: TextStyle(),
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
