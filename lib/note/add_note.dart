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

  void submitNote() async {
    String task = titleControl.text;
    String time = noteControl.text;
    // if the input field are not empty, populate the data
    if (task.isNotEmpty && time.isNotEmpty) {
      await databaseHelper.insert({'title': task, 'time': time, 'status': 0});
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                title: Text('Success!'),
                // icon:Text("hell"),
                content: Text("Task has been added successfully"),
              ));
      setState(() {
        titleControl.text = "";
        noteControl.text = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("New Note"),
        elevation: 1,
        actions: [
          noteControl.text.isNotEmpty
              ? IconButton(
                  icon: const Icon(Icons.check),
                  onPressed: () {},
                )
              : Text(""),
        ],
      ),
      body: ListView(
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8),
          //   child: Image.asset("assets/images/task.jpg"),
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
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
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
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
