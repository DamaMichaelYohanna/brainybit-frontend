import 'package:flutter/material.dart';
import 'package:konnet/video_player.dart';
import 'package:konnet/video_model.dart';
import 'package:konnet/course_detail.dart';

class VideoPlayList extends StatelessWidget {
  final String courseCode;
  final String courseName;
  const VideoPlayList(
      {super.key, required this.courseCode, required this.courseName});

  @override
  Widget build(BuildContext context) {
    List<Widget> _buildListItems() {
      List<Widget> listItems = [];
      int counter = 1;
      for (var videoDetails
          in videoList[courseCode.substring(0, 3)]![courseCode]!.entries) {
        listItems.add(
          Card(
            child: ListTile(
              title: Text("Lession $counter"),
              subtitle: Text("${videoDetails.value}"),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => YoutubePlayerScreen(
                          videoId: "${videoDetails.key}",
                        )));
              },
            ),
          ),
        );
        counter += 1;
      }
      return listItems;
    }

    return Scaffold(
      appBar: AppBar(title: Text("$courseCode Resources")),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 150,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/cmp.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            // child: Center(
            //   child: Padding(
            //     padding: EdgeInsets.all(8.0),
            //     child: Text(
            //       courseName,
            //       style: const TextStyle(
            //           fontSize: 30,
            //           fontWeight: FontWeight.bold,
            //           color: Colors.white),
            //     ),
            //   ),
            // ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              courseName,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(10.0),
            child: Text("About This Course",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w200)),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text("${courseDetail[courseCode]}",
                style: const TextStyle(
                  fontSize: 16,
                )),
          ),
          Column(
            children: _buildListItems(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: ElevatedButton(
              onPressed: null,
              child: Text("Download Study Materials"),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: ElevatedButton(
              onPressed: null,
              child: Text("Join Study group"),
            ),
          ),
        ],
      ),
    );
  }
}
