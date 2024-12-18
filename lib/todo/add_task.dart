import 'package:flutter/material.dart';
import 'package:brainybit/colorScheme.dart';
import 'package:brainybit/utility.dart';

DatabaseHelper databaseHelper = DatabaseHelper.instance;

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  AddTaskState createState() => AddTaskState();
}

class AddTaskState extends State<AddTask> {
  // TimeOfDay? selectedDate;
  final taskControl = TextEditingController();
  final timeControl = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    TimeOfDay? picked = await showTimePicker(
      helpText: "Elapse Time",
      initialTime: TimeOfDay.now(),
      context: context,
    );
    if (picked != null) {
      setState(() {
        // selectedDate = picked.format(context);
        timeControl.text = picked.format(context);
      });
    }
  }

  void submitTask() async {
    String task = taskControl.text;
    String time = timeControl.text;
    // if the input field are not empty, populate the data
    if (task.isNotEmpty && time.isNotEmpty) {
      await databaseHelper
          .insert("Task", {'title': task, 'time': time, 'status': 0});
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                title: Text('Success!'),
                // icon:Text("hell"),
                content: Text("Task has been added successfully"),
              ));
      setState(() {
        taskControl.text = "";
        timeControl.text = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        // backgroundColor: Colors.white,
        title: const Text("New Task"),
        foregroundColor: mine,
        elevation: 1,
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
              controller: taskControl,
              decoration: const InputDecoration(
                hintText: "Enter Task",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 12),
            child: TextField(
              controller: timeControl,
              decoration: const InputDecoration(
                hintText: "Elapse Time",
              ),
              onTap: () => _selectDate(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: submitTask,
              style: ElevatedButton.styleFrom(
                  backgroundColor: mine,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5))),
              child: const Text("Save Task "),
            ),
          ),
        ],
      ),
    );
  }
}
