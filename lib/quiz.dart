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
      score = 0;
    });
  }

// filter/narrow down te question map
  late List<Map<String, dynamic>> filteredQuestions = questions[courseName]!;
// Call back function for grading.
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
    labelcounter = 0;
    if (selectedOption != null && correctOption != null) {
      bool correct = grade(selectedOption, correctOption);
      if (correct == true) {
        score += 1;
      }
      if (_questionIndex >= filteredQuestions.length - 1) {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Well done!'),
            // icon:Text("hell"),
            content: Text(
                " You have exhausted the question with a total score of $score / ${filteredQuestions.length}"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(context);
                  },
                  child: Text("Close"))
            ],
          ),
        );
      } else {
        setState(
          () {
            _questionIndex += 1;
            _currentSliderValue += 1;
          },
        );
      }

      return correct;
    } else {
      // setState(
      //   () {
      //     _questionIndex += 1;
      //     _currentSliderValue += 1;
      //   },
      // );
      return false;
    }
  }

  int _questionIndex = 0;
  double _currentSliderValue = 1;
  int score = 0;
  Color normalColor = Colors.white;
  int labelcounter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("$courseName Quiz"),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                // Expanded(
                //   child: Slider(
                //       activeColor: mine,
                //       thumbColor: mine.shade100,
                //       value: _currentSliderValue,
                //       max: filteredQuestions.length.toDouble(),
                //       // divisions: 46,
                //       onChanged: (double value) {
                //         sliderUpdate(value);
                //       }),
                // ),
                ElevatedButton(
                  onPressed: () {
                    reset();
                  },
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(mine)),
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
                          backgroundColor: MaterialStateProperty.all(mine)),
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
              // color: const Color.fromARGB(255, 244, 242, 238),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '${filteredQuestions[_questionIndex]["questionText"]}',
              style: TextStyle(fontSize: 20, color: mine.shade900),
            ),
          ),
          Column(
            children: filteredQuestions[_questionIndex]["answers"]
                .map<Widget>((answer) {
              String label; //place holder for option label
              if (labelcounter == 0) {
                label = "A";
              } else if (labelcounter == 1) {
                label = "B";
              } else if (labelcounter == 2) {
                label = "C";
              } else {
                label = 'D';
              }
              // increase the counter to change label
              labelcounter++;
              return Answer(
                callBack: play,
                optionValue: '$answer',
                optionLable: label,
                correctOption:
                    '${filteredQuestions[_questionIndex]["correct"]}',
              );
            }).toList(),
          ),

          // Use map to transform each answer into an Answer widget
        ],
      ),
    );
  }
}

class Answer extends StatelessWidget {
  final Function callBack;
  final String optionValue;
  final String optionLable;
  final String correctOption;

  const Answer({
    super.key,
    required this.callBack,
    required this.optionValue,
    required this.optionLable,
    required this.correctOption,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(child: Text("$optionLable")),
      title: Text(
        optionValue,
        style: const TextStyle(color: mine),
      ),
      onTap: () {
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
    );
  }
}
