import 'package:flutter/material.dart';
import 'package:konnet/video_player.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:konnet/video_model.dart';

class VideoPlayList extends StatelessWidget {
  final String dept;
  const VideoPlayList({super.key, required this.dept});

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildListItems() {
      print(videoList[dept]);
      List<Widget> listItems = [];
      for (String videoId in [
        "1",
        "2",
        "3",
        "4",
      ]) {
        listItems.add(
          Card(
            child: ListTile(
              title: Text("Lession $videoId"),
              subtitle: const Text("Introduction to Java programming"),
              onTap: () {
                // Handle tap on each card
              },
            ),
          ),
        );
      }
      return listItems;
    }

    print(_buildListItems());

    return Scaffold(
      appBar: AppBar(title: const Text("CMP 221 Resources")),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
              height: 150,
              width: double.infinity,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/more.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: const Text("Introduction to Computer Science")),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
              "Introduction To Programming I",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("About This Course",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200)),
          ),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text(
                "This is an introductory course into programming using Java Programming lanaguage",
                style: TextStyle(
                  fontSize: 16,
                )),
          ),
          Column(
            children: _buildListItems(),
          ),
          const Card(
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Text("-- Introduction to Java"),
            ),
          ),
        ],
      ),
    );
  }
}
