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
      await databaseHelper.insert({
        'title': task,
        'date': date,
      });
      setState(() {
        taskControl.text = "";
        dateControl.text = "";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: Image.asset("assets/images/task.jpg"),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: taskControl,
              decoration: const InputDecoration(
                  hintText: "Enter Task Here", border: OutlineInputBorder()),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: dateControl,
              decoration: const InputDecoration(
                  hintText: "Select Date", border: OutlineInputBorder()),
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
