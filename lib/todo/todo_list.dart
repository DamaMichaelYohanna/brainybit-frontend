import 'package:flutter/material.dart';
import 'package:konnet/colorScheme.dart';
import 'add_task.dart';
import 'package:konnet/utility.dart';

DatabaseHelper databaseHelper = DatabaseHelper.instance;

class SwipeListTile extends StatelessWidget {
  final Map object;

  const SwipeListTile({required this.object, super.key});

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(object["title"]),
      background: Container(
        color: Colors.red,
        alignment: Alignment.centerLeft,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      secondaryBackground: Container(
        color: Colors.blue,
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.edit, color: Colors.white),
      ),
      confirmDismiss: (direction) async {
        if (direction == DismissDirection.startToEnd) {
          // Delete action
          databaseHelper.delete("Task", object['id']);
        } else if (direction == DismissDirection.endToStart) {
          // Edit action
          // return await onEdit();
        }
        return false;
      },
      child: Container(
        color: mine.shade100,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        child: ListTile(
            title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      "${object["title"]}",
                      // overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Checkbox(
                      activeColor: Colors.white,
                      checkColor: mine,
                      value: object["status"] == 0 ? false : true,
                      onChanged: (value) {
                        if (value == true) {
                          databaseHelper.update(
                              "Task", {"status": 1}, object["id"]);
                        } else {
                          databaseHelper.update(
                              "Task", {"status": 0}, object["id"]);
                        }
                      })
                ]),
            subtitle: Text("${object['time']}")),
      ),
    );
  }
}

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  @override
  State<TodoListPage> createState() {
    return _TodoListPageState();
  }
}

class _TodoListPageState extends State<TodoListPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  bool? isSelected = false;
  Map<int, bool> checkboxStates =
      {}; // Map to hold checkbox state for each task
  List<Map<String, dynamic>> taskList = [];

  void fetch() async {
    // Await the result of the asynchronous database query

    await databaseHelper.queryAllRows("Task").then((value) => {
          taskList = value,
          // print(value),
          if (mounted)
            {
              setState(() {
                fetch();
              })
            }
        });
  }

  @override
  void initState() {
    fetch();
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const Icon(
          Icons.abc,
          color: Colors.white,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(12.0),
            child: Text(
              "Task",
              style: TextStyle(
                fontSize: 40,
                color: mine,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> object = taskList[index];
                return SwipeListTile(
                  object: object,
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => AddTask()));
          },
          child: const Icon(Icons.add)),
    );
  }
}
