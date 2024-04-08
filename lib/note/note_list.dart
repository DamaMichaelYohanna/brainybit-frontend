import 'package:flutter/material.dart';
import 'add_note.dart';
import 'package:konnet/utility.dart';

DatabaseHelper databaseHelper = DatabaseHelper.instance;

class SwipeListTile extends StatelessWidget {
  final Map object;

  const SwipeListTile({required this.object, key});

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
          databaseHelper.delete(object['id']);
        } else if (direction == DismissDirection.endToStart) {
          // Edit action
          // return await onEdit();
        }
        return false;
      },
      child: Container(
        color: const Color.fromARGB(255, 241, 239, 232),
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
                      checkColor: Colors.brown,
                      value: object["status"] == 0 ? false : true,
                      onChanged: (value) {
                        if (value == true) {
                          databaseHelper.update({"status": 1}, object["id"]);
                        } else {
                          databaseHelper.update({"status": 0}, object["id"]);
                        }
                      })
                ]),
            subtitle: Text("${object['time']}")),
      ),
    );
  }
}

class NoteListPage extends StatefulWidget {
  const NoteListPage({key});

  @override
  State<NoteListPage> createState() {
    return _NoteListPageState();
  }
}

class _NoteListPageState extends State<NoteListPage>
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
              "Notes",
              style: TextStyle(
                fontSize: 40,
                color: Colors.brown,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                print("Have been pressed");
              },
              child: const TextField(
                enabled: false,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.all(2)),
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
                .push(MaterialPageRoute(builder: (context) => AddNote()));
          },
          child: const Icon(Icons.add)),
    );
  }
}
