import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../constants.dart';  // Ensure this file defines the colors and other constants
import '../models/question_models.dart';  // Ensure this file defines the Question class
import '../widgets/question_widget.dart';  // Custom widget for displaying the question
import '../widgets/next.dart';  // Custom widget for the Next button
import '../widgets/options.dart';  // Custom widget for displaying options

class Level3 extends StatefulWidget {
  static const root = 'Level3';
  const Level3({super.key});

  @override
  State<Level3> createState() => _Level3State();
}

class _Level3State extends State<Level3> {
  List<Question> _questions = [];
  int counter = 0;
  bool clicked = false;
  Timer? _timer;
  int _timeRemaining = 10;
  final Random _random = Random();
  int score = 0;

  @override
  void initState() {
    super.initState();
    _questions = List.generate(10, (index) => _generateQuestion(index + 1));
    _startTimer();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  Question _generateQuestion(int id) {
    // Scale difficulty: increase the number range as the questions progress
    int maxNumber = 2 + (id * 2);  // More gradual increase in difficulty

    int number1 = _random.nextInt(maxNumber) + 1;
    int number2 = _random.nextInt(maxNumber) + 1;
    int correctAnswer = number1 * number2;
    Map<String, bool> options = _generateOptions(correctAnswer, maxNumber);

    return Question(
      id: id,
      title: '$number1 × $number2 =',
      options: options,
    );
  }

  Map<String, bool> _generateOptions(int correctAnswer, int maxNumber) {
    Set<int> optionsSet = {correctAnswer};
    while (optionsSet.length < 4) {
      int deviation = _random.nextInt(maxNumber) - (maxNumber ~/ 2);  // Deviation adjusted for higher numbers
      int fakeAnswer = correctAnswer + deviation;
      if (fakeAnswer != correctAnswer && fakeAnswer > 0) {
        optionsSet.add(fakeAnswer);
      }
    }
    List<int> optionsList = optionsSet.toList()..shuffle(_random);
    return Map.fromIterable(optionsList, key: (item) => item.toString(), value: (item) => item == correctAnswer);
  }

  void _startTimer() {
    _timeRemaining = 10;
    _timer?.cancel();
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (_timeRemaining > 0) {
        setState(() {
          _timeRemaining--;
        });
      } else {
        _timer?.cancel();
        _showFinalScoreDialog();  // Show dialog when time runs out
      }
    });
  }

  void _nextQuestion() {
    if (counter < _questions.length - 1) {
      setState(() {
        counter++;
        clicked = false;
        _startTimer();
      });
    } else {
      _timer?.cancel();
      _showFinalScoreDialog();  // Show dialog when reaching the last question
    }
  }

  void _showFinalScoreDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,  // Prevent dismissing the dialog by tapping outside it
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Congratulations!'),
          content: Text('You got $score points.'),
          actions: <Widget>[
            TextButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();  // Close the dialog
                Navigator.of(context).pop();  // Navigate back to the previous screen
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level 3'),
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Time remaining: $_timeRemaining seconds'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Text('Score: $score'),
            ),
            QuestionWidget(
              question: _questions[counter].title,
              counterAction: counter,
              totalQuestions: _questions.length,
            ),
            const Divider(),
            const SizedBox(height: 20),
            ..._questions[counter].options.keys.map((option) {
              bool isCorrect = _questions[counter].options[option] ?? false;
              return Options(
                option: option,
                color: clicked ? (isCorrect ? correct : incorrect) : Colors.white,
                onTap: () {
                  if (!clicked) {
                    setState(() {
                      clicked = true;
                      if (isCorrect) {
                        score += 1;
                      }
                    });
                  }
                }
              );
            }).toList(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _nextQuestion,
        icon: Icon(Icons.navigate_next),
        label: Text('Next Question'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
