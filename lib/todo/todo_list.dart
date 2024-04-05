import 'package:flutter/material.dart';
import 'add_task.dart';
import 'package:konnet/utility.dart';

DatabaseHelper databaseHelper = DatabaseHelper.instance;

class TodoListPage extends StatefulWidget {
  const TodoListPage({key});

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

    await databaseHelper.queryAllRows().then((value) => {
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
                color: Colors.brown,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: taskList.length,
              itemBuilder: (context, index) {
                Map<String, dynamic> object = taskList[index];
                return ListTile(
                  title: Container(
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 241, 239, 232),
                        borderRadius: BorderRadius.circular(5)),
                    padding: EdgeInsets.only(top: 10, left: 12, bottom: 10),
                    child: Row(
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
                              checkColor: Colors.brown,
                              value: object["status"] == 0 ? false : true,
                              onChanged: (value) {
                                setState(() {
                                  if (value == true) {
                                    databaseHelper
                                        .update({"status": 1}, object["id"]);
                                  } else {
                                    databaseHelper
                                        .update({"status": 0}, object["id"]);
                                  }
                                });
                              })
                        ]),
                  ),
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
          child: Icon(Icons.add)),
    );
  }
}
