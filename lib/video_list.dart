import 'package:flutter/material.dart';
import 'package:konnet/colorScheme.dart';
import 'package:konnet/questions_model.dart';
import 'package:konnet/quiz.dart';
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
    Map<String, String>? filteredDetails =
        videoList[courseCode.substring(0, 3)]?[courseCode];

    List<Widget> _buildListItems() {
      List<Widget> listItems = [];
      if (filteredDetails == null) {
      } else {
        int counter = 1;
        for (var videoDetails
            in videoList[courseCode.substring(0, 3)]![courseCode]!.entries) {
          listItems.add(
            Card(
              margin: EdgeInsets.all(10),
              elevation: .6,
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
            child: Text(
                courseDetail[courseCode] != null
                    ? "${courseDetail[courseCode]}"
                    : "No Course Details available yet.",
                style: const TextStyle(
                  fontSize: 16,
                )),
          ),
          Column(
            children: _buildListItems(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: mine,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              onPressed: questions.containsKey(courseCode)
                  ? () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => QuizScreen(
                            courseName: courseCode,
                          ),
                        ),
                      );
                    }
                  : null,
              child: const Text("Take Quiz"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: mine,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              onPressed: null,
              child: const Text("Join Study group"),
            ),
          ),
        ],
      ),
    );
  }
}
