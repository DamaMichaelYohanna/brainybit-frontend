import 'package:flutter/material.dart';

Map<String, List> tasks = {
  "yesterday": ["hello", "hi", "come"],
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

              tabs: const [
                Tab(
                  text: "Yesterday",
                ),
                Tab(text: "Today"),
                Tab(text: "Tomorrow"),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                Column(
                  children: [
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.amber,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Hellow from some text",
                            style: TextStyle(fontSize: 17),
                          ),
                          Checkbox(value: true, onChanged: null)
                        ],
                      ),
                    ),
                  ],
                ),
                Text("hello 2"),
                Text("hello 3")
              ],
            ),
          )
          // tab bar view here
          // Expanded(
          //   child: TabBarView(
          //     controller: _tabController,
          //     children: department[dept]!.keys.map((String key) {
          //       return Lis  tView(
          //         children: department[dept]![key]!.entries.map((entry) {
          //           return InkWell(
          //             onTap: () {
          //               Navigator.of(context).push(
          //                 MaterialPageRoute(
          //                   builder: (context) => VideoPlayList(
          //                     courseCode: entry.key,
          //                     courseName: entry.value,
          //                   ),
          //                 ),
          //               );
          //             },
          //             child: Card(
          //                 color: const Color.fromARGB(255, 255, 255, 255),
          //                 shape: RoundedRectangleBorder(
          //                     borderRadius: BorderRadius.circular(0)),
          //                 child: ListTile(
          //                     leading: Container(
          //                       height: 60,
          //                       width: 60,
          //                       padding: EdgeInsets.all(3),
          //                       color: Color.fromARGB(255, 247, 242, 228),
          //                       child: Icon(Icons.book),
          //                     ),
          //                     title: Text(entry.key),
          //                     subtitle: Text(entry.value))),
          //           );
          //         }).toList(),
          //       );
          //     }).toList(),
          //   ),
          // ),
        ],
      ),

      //     // Row(
      //     //   children: const [
      //     //     ElevatedButton(
      //     //       onPressed: null,
      //     //       child: Text("1"),
      //     //     ),
      //     //     ElevatedButton(
      //     //       onPressed: null,
      //     //       child: Text("2"),
      //     //     ),
      //     //     ElevatedButton(
      //     //       onPressed: null,
      //     //       child: Text("3"),
      //     //     ),
      //     //     ElevatedButton(
      //     //       onPressed: null,
      //     //       child: Text("4"),
      //     //     ),
      //     //     ElevatedButton(
      //     //       onPressed: null,
      //     //       child: Text("5"),
      //     //     ),
      //     //     ElevatedButton(
      //     //       onPressed: null,
      //     //       child: Text("6"),
      //     //     )
      //     //   ],
      //     // )
      //   ],
      // ),
      floatingActionButton:
          FloatingActionButton(onPressed: null, child: Icon(Icons.add)),
    );
  }
}
