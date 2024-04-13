import 'package:flutter/material.dart';
import 'package:konnet/colorScheme.dart';
import 'package:sticky_grouped_list/sticky_grouped_list.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key});

  @override
  State<StatefulWidget> createState() => _CalenderState();
}

class _CalenderState extends State {
  final GroupedItemScrollController itemScrollController =
      GroupedItemScrollController();
  final List<Map<String, dynamic>> _elements = [
    {'group': 'March 2024', 'name': 'Element 1'},
    {'group': 'March 2024', 'name': 'Element 2'},
    {'group': 'April 2024', 'name': 'Element 3'},
    {'group': 'Group B', 'name': 'Element 4'},
    {'group': 'Group B', 'name': 'Element 5'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("School Calender"),
        backgroundColor: mine,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 12.0),
        child: StickyGroupedListView<dynamic, String>(
          elements: _elements,
          groupBy: (dynamic element) => element['group'],
          groupSeparatorBuilder: (dynamic element) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              element["group"],
              textAlign: TextAlign.center,
            ),
          ),

          itemBuilder: (context, dynamic element) => EventTile(
            eventTitle: '${element['name']}',
          ),
          itemComparator: (e1, e2) =>
              e1['name'].compareTo(e2['name']), // optional
          elementIdentifier: (element) =>
              element.name, // optional - see below for usage
          // itemScrollController: itemScrollController, // optional
          order: StickyGroupedListOrder.DESC, // optional
        ),
      ),
    );
  }
}

class EventTile extends StatelessWidget {
  final String eventTitle;
  const EventTile({super.key, required this.eventTitle});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        color: Color.fromARGB(255, 228, 235, 241),
        margin: const EdgeInsets.all(10),
        child: ListTile(
          title: Text(eventTitle),
          subtitle: Text("12/12/2024"),
          leading: Icon(Icons.calendar_month),
        ));
  }
}
