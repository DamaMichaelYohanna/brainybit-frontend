import 'package:flutter/material.dart';

import 'add_task.dart';

Map<String, List> tasks = {
  "yesterday": [
    "Hello, Am coming to your house later.",
    "Hi, dear it was all a prank",
    "Come let's go for and outing in my fathers farm and check out some stuff there for recreation and study"
  ],
  "today": ["Go to school", "Goto shop", "Finally go to church"],
  "Tomorrow": ["orientation", "Code a little", "All good"]
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
        actions: const [Icon(Icons.delete)],
      ),
      body: Column(
        children: [
          // const Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: Text(
          //     "Tasks",
          //     textAlign: TextAlign.end,
          //     style: TextStyle(fontSize: 22),
          //   ),
          // ),
          // const Divider(),
          Container(
            height: 55,
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              // color: Colors.white,
              borderRadius: BorderRadius.circular(
                2.0,
              ),
            ),
            child: TabBar(
              controller: _tabController,
              // give the indicator a decoration (border)
              indicator: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                  color: Colors.amber,
                  width: 2.0,
                )),
              ),
              labelColor: Colors.brown,
              unselectedLabelColor: Colors.black,

              tabs: tasks.keys.map((title) => Tab(text: title)).toList(),
            ),
          ),
          //
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: tasks.keys.map((mapKey) {
                return ListView.builder(
                  itemCount: tasks[mapKey]!.length,
                  itemBuilder: (context, index) {
                    String saga = tasks[mapKey]![index];
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
                                  tasks[mapKey]![index],
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
                                      checkboxStates[saga] = value ?? false;
                                    });
                                  })
                            ]),
                      ),
                    );
                  },
                );
              }).toList(),
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
