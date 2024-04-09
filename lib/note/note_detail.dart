import 'package:flutter/material.dart';
// import 'package:share_plus/share_plus.dart';
import 'package:konnet/utility.dart';

DatabaseHelper databaseHelper = DatabaseHelper.instance;

class NoteDetail extends StatefulWidget {
  final int id;
  const NoteDetail({Key? key, required this.id}) : super(key: key);

  @override
  _NoteDetailState createState() => _NoteDetailState();
}

class _NoteDetailState extends State<NoteDetail> {
  List<Map<String, dynamic>> noteDetail = [{}];

  @override
  void initState() {
    super.initState();
    databaseHelper.queryOneRow("Note", widget.id).then((value) => {
          setState(() {
            noteDetail = value;
          }),
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.white,
        title: const Text("Note"),
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {
              // Share.share('check out my website https://example.com', subject: 'Look what I made!');
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              databaseHelper.delete("Note", noteDetail[0]["id"]);
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
            child: Text(
              "${noteDetail[0]['time']}",
              style: const TextStyle(
                  fontWeight: FontWeight.w200, fontStyle: FontStyle.italic),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
            child: Text(
              "${noteDetail[0]['title']}",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
            child: Text(
              "${noteDetail[0]['note']}",
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
