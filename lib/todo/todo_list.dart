import 'package:flutter/material.dart';
import 'add_task.dart';
import 'package:konnet/utility.dart';

DatabaseHelper databaseHelper = DatabaseHelper.instance;

Map<String, List> tasks = {
  "yesterday": [
    "Hello, Am coming to your house later.",
    "Hi, dear it was all a prank",
    "Come let's go for and outing in my fathers farm and check out some stuff there for recreation and study"
  ],
  "today": ["Go to school", "Goto shop", "Finally go to church"],
  "Tomorrow": ["orientation", "Code a little", "All good"],
};

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
  Map<String, bool> checkboxStates =
      {}; // Map to hold checkbox state for each task
  List<Map<String, dynamic>> taskList = [];

  void fetch() async {
    // Await the result of the asynchronous database query

    await databaseHelper.queryAllRows().then((value) => {
          taskList = value,
          print(value),
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
      appBar: AppBar(
        title: const Text("Tasks"),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
              onPressed: () {
                databaseHelper.deleteAll();
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.brown,
              ))
        ],
      ),
      body: ListView.builder(
        itemCount: taskList.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> saga = taskList[index];
          return ListTile(
            title: Container(
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 240, 192, 49),
                  borderRadius: BorderRadius.circular(5)),
              padding: EdgeInsets.only(top: 10, left: 12, bottom: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        "${saga["title"]}",
                        // overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Checkbox(
                        activeColor: Colors.white,
                        checkColor: Colors.brown,
                        value: checkboxStates[saga] ?? false,
                        onChanged: (value) {
                          print(saga);
                          setState(() {
                            checkboxStates[saga["title"]] = value ?? false;
                          });
                        })
                  ]),
            ),
          );
        },
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
