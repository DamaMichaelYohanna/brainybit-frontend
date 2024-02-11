import 'package:flutter/material.dart';
import 'package:konnet/colorScheme.dart';
// import 'package:konnet/login.dart';
import 'package:konnet/quiz.dart';

void main() {
  runApp(MaterialApp(
      title: "Nsuk-Online",
      theme: ThemeData(
        primarySwatch: mine,
        //<-- SEE HERE
      ),
      home: const QuizScreen()));
}
