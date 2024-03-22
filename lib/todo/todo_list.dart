import 'package:flutter/material.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({key});

  @override
  State<TodoListPage> createState() {
    return _TodoListPageState();
  }
}

class _TodoListPageState extends State<TodoListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text("Task for today"),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: ListView(
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Tasks",
              textAlign: TextAlign.end,
              style: TextStyle(fontSize: 22),
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
