import 'package:flutter/material.dart';
import 'package:konnet/utility.dart';

DatabaseHelper databaseHelper = DatabaseHelper.instance;

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  // TimeOfDay? selectedDate;
  final titleControl = TextEditingController();
  final noteControl = TextEditingController();

  void submitNote() {
    String title = titleControl.text;
    String note = noteControl.text;

    String time = TimeOfDay.now().format(context);
    DateTime now = DateTime.now();
    DateTime currentDate = DateTime(now.year, now.month, now.day);
    String formatedDate = "${currentDate.toString().substring(0, 10)} $time";
    // if the input field are not empty, populate the data

    if (title.isNotEmpty && note.isNotEmpty) {
      databaseHelper
          .insert("Note", {'title': title, 'note': note, 'time': formatedDate});
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.white,
        title: const Text("New Note"),
        elevation: 1,
        actions: [
          noteControl.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.check),
                  onPressed: () {
                    submitNote();
                  },
                )
              : const Text(""),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
            child: TextField(
              controller: titleControl,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Title",
              ),
              style: const TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
            child: TextField(
              controller: noteControl,
              maxLines: null,
              keyboardType: TextInputType.multiline,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Note Something down",
              ),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }
}
