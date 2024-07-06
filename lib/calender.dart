import 'package:flutter/material.dart';
import 'package:brainybit/colorScheme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({super.key});

  @override
  State<StatefulWidget> createState() => _CalenderState();
}

class _CalenderState extends State {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("School Calender"),
        backgroundColor: mine,
        foregroundColor: Colors.white,
      ),
      body: SfPdfViewer.asset(
        'assets/pdfs/calender.pdf',
      ),
    );
  }
}
