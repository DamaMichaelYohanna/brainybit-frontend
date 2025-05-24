import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:brainybit/video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

// Replace with the actual imports needed for your app
// import 'package:brainybit/colorScheme.dart';
// import 'package:brainybit/video_list.dart';

class Resources extends StatefulWidget {
  final String courseName;
  final String courseCode;
  const Resources(
      {super.key, required this.courseName, required this.courseCode});

  @override
  ResourcesState createState() => ResourcesState();
}

class ResourcesState extends State<Resources>
    with SingleTickerProviderStateMixin {
  // Simulating video details for demo purposes
  Map<String, dynamic> videoDetails = {};

  @override
  void initState() {
    // _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    // _tabController.dispose();
  }

  // Build list items for the "Videos" tab
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

  // Future to simulate fetching data
  Future<void> getData() async {
    return Future.delayed(const Duration(seconds: 0), () async {
      var url = Uri.https(
          'brainybit.vercel.app', 'api/v1/general/course/${widget.courseCode}');
      try {
        final response = await http.get(url);
        if (response.statusCode == 200) {
          videoDetails = json.decode(response.body) as Map<String, dynamic>;
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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.courseCode} Learning Resource',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Container(
            //   height: 55,
            //   padding: const EdgeInsets.all(8),
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(2.0),
            //   ),
            //   child: TabBar(
            //     controller: _tabController,
            //     tabs: const [
            //       Tab(text: "Notes"),
            //     ],
            //   ),
            // ),
            // Expanded(
            //   child: FutureBuilder(
            //     future: getData(),
            //     builder:
            //         (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            //       if (snapshot.connectionState == ConnectionState.waiting) {
            //         return const Center(child: CircularProgressIndicator());
            //       } else if (snapshot.hasError) {
            //         return Center(
            //           child: Text(
            //             "Vidoes will be added soon.",
            //             style: TextStyle(
            //               fontSize: 16,
            //               color: Colors.grey[600],
            //             ),
            //           ),
            //         );
            //       } else {
            //         return ListView(
            //             children: <Widget>[Column(children: buildListItems())]);
            //       }
            //     },
            //   ),
            // ),
            // SfPdfViewer.network(
            //     'https://brainybit.vercel.app/api/v1/general/pdf/${widget.courseCode}.pdf')
            // Tab for "Notes"
            PDFViewPage(
              pdfUrl:
                  'https://brainybit.vercel.app/api/v1/general/pdf/${widget.courseCode}.pdf',
            ),
          ],
        ),
      ),
    );
  }
}

// PDFViewPage Widget
class PDFViewPage extends StatelessWidget {
  final String pdfUrl;

  const PDFViewPage({Key? key, required this.pdfUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const PDF().cachedFromUrl(
      pdfUrl,
      placeholder: (progress) => Center(
        child: CircularProgressIndicator(value: progress / 100),
      ),
      errorWidget: (error) => Center(
        child: Text(
          "Failed to load PDF.",
          style: TextStyle(fontSize: 16, color: Colors.red),
        ),
      ),
    );
  }
}
