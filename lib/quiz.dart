import 'package:flutter/material.dart';
import 'package:konnet/colorScheme.dart';
import 'package:konnet/questions_model.dart';

class QuizScreen extends StatefulWidget {
  final String courseName;
  const QuizScreen({key, required this.courseName}) : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  State<QuizScreen> createState() => _QuizScreenState(courseName: courseName);
}

class _QuizScreenState extends State<QuizScreen> {
  late String courseName;
  _QuizScreenState({required this.courseName});

  void reset() {
    setState(() {
      _questionIndex = 0;
      _currentSliderValue = 1;
    });
  }

  late List<Map<String, dynamic>> filteredQuestions = questions[courseName]!;
  bool grade(selectedOption, correctOption) {
    int position =
        filteredQuestions[_questionIndex]["answers"].indexOf(selectedOption);
    if (position == 0 && correctOption == "A") {
      return true;
    } else if (position == 1 && correctOption == "B") {
      return true;
    } else if (position == 2 && correctOption == "C") {
      return true;
    } else if (position == 3 && correctOption == "D") {
      return true;
    } else {
      return false;
    }
  }

  void sliderUpdate(double value) {
    setState(() {
      _questionIndex = value.toInt() - 1;
      _currentSliderValue = value;
    });
  }

  bool play(String? selectedOption, String? correctOption) {
    if (selectedOption != null && correctOption != null) {
      bool correct = grade(selectedOption, correctOption);
      setState(
        () {
          _questionIndex += 1;
          _currentSliderValue += 1;
        },
      );
      return correct;
    } else {
      setState(
        () {
          _questionIndex += 1;
          _currentSliderValue += 1;
        },
      );
      return false;
    }
  }

  int _questionIndex = 0;
  double _currentSliderValue = 1;
  Color normalColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz Section"),
        backgroundColor: Colors.white,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: Slider(
                      activeColor: Colors.brown,
                      thumbColor: mine.shade100,
                      value: _currentSliderValue,
                      max: filteredQuestions.length.toDouble(),
                      // divisions: 46,
                      onChanged: (double value) {
                        sliderUpdate(value);
                      }),
                ),
                ElevatedButton(
                  onPressed: () {
                    reset();
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.brown)),
                  child: const Icon(
                    Icons.restart_alt_outlined,
                    color: Colors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        reset();
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.brown)),
                      child: Text(
                        "${_currentSliderValue.toInt()} / ${filteredQuestions.length}",
                        style: const TextStyle(color: Colors.white),
                      )),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 244, 242, 238),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '${filteredQuestions[_questionIndex]["questionText"]}',
              style: const TextStyle(fontSize: 20),
            ),
          ),
          const Divider(),
          for (var answer in filteredQuestions[_questionIndex]["answers"])
            Answer(
              callBack: play,
              optionValue: '$answer',
              correctOption: '${filteredQuestions[_questionIndex]["correct"]}',
            ),
        ],
      ),
    );
  }
}

class Answer extends StatelessWidget {
  final Function callBack;
  final String optionValue;
  final String correctOption;

  const Answer({
    super.key,
    required this.callBack,
    required this.optionValue,
    required this.correctOption,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: TextButton(
        style: ButtonStyle(
          alignment: Alignment.centerLeft,
          padding: MaterialStateProperty.all(
            const EdgeInsets.all(15),
          ),
          backgroundColor: MaterialStateProperty.all(mine.shade100),
        ),
        onPressed: () {
          bool returnValue = callBack(optionValue, correctOption);
          final snackBar = SnackBar(
            content: Text(returnValue ? 'Correct!' : "wrong!"),
            backgroundColor: returnValue ? Colors.green : Colors.red,
            action: SnackBarAction(
              label: '',
              onPressed: () {},
            ),
          );
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text(
          optionValue,
          style: const TextStyle(color: Colors.brown),
        ),
      ),
    );
  }
}
