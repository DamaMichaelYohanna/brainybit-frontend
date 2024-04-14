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
    {'group': 'MAY, 2024', 'name': 'Public Holiday', 'date': 'Wednesday 1st'},
    {
      'group': 'MAY, 2024',
      'name': 'Lecture closes For First semester',
      'date': 'Saturday, 4th'
    },
    {'group': 'MAY, 2024', 'name': 'Revision', 'date': 'Monday 6th'},
    {
      'group': 'MAY, 2024',
      'name': 'Exams (Faculty of education)',
      'date': 'Monday 13th'
    },
    {
      'group': 'MAY, 2024',
      'name': 'Exams(Other faculty)',
      'date': 'Monday 20th'
    },
    {
      'group': 'JUNE, 2024',
      'name': 'Marking and endorsement',
      'date': '10 June 2024'
    },
    {
      'group': 'JUNE, 2024',
      'name': 'Commencement of siwes',
      'date': '10 June 2024'
    },
    {'group': 'JUNE, 2024', 'name': 'Public Holiday', 'date': '12 June 2024'},
    {
      'group': 'JUNE, 2024',
      'name': 'Resumption of second semester',
      'date': ' 23 June 2024'
    },
    {
      'group': 'JUNE, 2024',
      'name': 'Regular Senate meeting',
      'date': ' 27 June 2024'
    },
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
            eventDate: '${element['date']}',
          ),
          // itemComparator: (e1, e2) =>
          //     e1['date'].compareTo(e2['date']), // optional
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
  final String eventDate;
  const EventTile(
      {super.key, required this.eventTitle, required this.eventDate});

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        color: const Color.fromARGB(255, 228, 235, 241),
        margin: const EdgeInsets.all(10),
        child: ListTile(
          title: Text(eventTitle),
          subtitle: Text(eventDate),
          leading: const Icon(Icons.calendar_month),
        ));
  }
}
