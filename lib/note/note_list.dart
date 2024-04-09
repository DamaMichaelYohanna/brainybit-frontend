import 'package:flutter/material.dart';
import 'package:konnet/colorScheme.dart';
import 'add_note.dart';
import 'package:konnet/utility.dart';

DatabaseHelper databaseHelper = DatabaseHelper.instance;

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

    await databaseHelper.queryAllRows("Note").then((value) => {
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
                color: mine,
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
                return Container(
                  padding: EdgeInsets.all(5),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: mine.shade100,
                  ),
                  child: ListTile(
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${object["title"]}",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            "${object["note"]}",
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                      subtitle: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text("${object['time']}"),
                      )),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const AddNote()));
          },
          child: const Icon(Icons.add)),
    );
  }
}
