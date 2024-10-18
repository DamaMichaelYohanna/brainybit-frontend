import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:brainybit/video_player.dart';
// import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LearningResource extends StatefulWidget {
  final String courseName;
  final String courseCode;
  const LearningResource(
      {super.key, required this.courseName, required this.courseCode});

  @override
  State<LearningResource> createState() => _LearningResourceState();
}

class _LearningResourceState extends State<LearningResource> {
  Map<String, dynamic> videoDetails = {};

  Future<String> getData() {
    return Future.delayed(const Duration(seconds: 0), () async {
      var url = Uri.https(
          'brainybit.vercel.app', 'api/v1/general/course/${widget.courseCode}');
      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          videoDetails = json.decode(response.body) as Map<String, dynamic>;
          return "done";
        } else {
          throw Exception(
              'Failed to load video details'); // Handle non-200 status codes
        }
      } catch (e) {
        // Log or handle the error appropriately
        rethrow; // Re-throw for FutureBuilder to handle
      }
      // throw Exception("Custom Error");
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> buildListItems() {
      List<Widget> listItems = [];
      for (var videoDetail in videoDetails.entries) {
        listItems.add(InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => YoutubePlayerScreen(
                      videoId: videoDetail.key,
                    )));
          },
          child: Container(
            width: double.infinity,
            margin: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  height: 100,
                  color: Colors.red,
                  child: Image.network(
                      "https://img.youtube.com/vi/${videoDetail.key}/0.jpg"),
                ),
                Container(
                    width: 170,
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${videoDetail.value}",
                          style: const TextStyle(
                              fontSize: 17, fontWeight: FontWeight.bold),
                        ),
                        const Divider(),
                        const Text("Brainybit Team")
                      ],
                    )),
              ],
            ),
          ),
        ));
      }
      return listItems;
    }

    return Scaffold(
      appBar: AppBar(title: Text(widget.courseName)),
      body: ListView(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "${widget.courseCode} ❤️",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          FutureBuilder(
            future: getData(),
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Text(
                  'No Videos for this course yet. Check Back',
                  textAlign: TextAlign.center,
                );
              } else {
                return Column(children: buildListItems());
              }
            },
          ),
        ],
      ),
    );
  }
}
