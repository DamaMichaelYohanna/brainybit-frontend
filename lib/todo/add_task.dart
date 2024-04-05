import 'package:flutter/material.dart';
import 'package:konnet/utility.dart';

DatabaseHelper databaseHelper = DatabaseHelper.instance;

class AddTask extends StatefulWidget {
  @override
  _AddTaskState createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  DateTime? selectedDate;
  final taskControl = TextEditingController();
  final dateControl = TextEditingController();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2024),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        dateControl.text = "${picked.day}/${picked.month}/${picked.year}";
      });
    }
  }

  void submitTask() async {
    String task = taskControl.text;
    String date = dateControl.text;
    // if the input field are not empty, populate the data
    if (task.isNotEmpty && date.isNotEmpty) {
      await databaseHelper.insert({'title': task, 'date': date, 'status': 0});
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                title: Text('Success!'),
                // icon:Text("hell"),
                content: Text("Task has been added successfully"),
              ));
      setState(() {
        taskControl.text = "";
        dateControl.text = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("New Task"),
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
              controller: dateControl,
              decoration: const InputDecoration(
                hintText: "Select Time",
              ),
              onTap: () => _selectDate(context),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: submitTask,
              child: const Text("Save Task "),
            ),
          )
        ],
      ),
    );
  }
}
