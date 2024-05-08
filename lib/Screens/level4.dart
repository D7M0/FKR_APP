import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import '../constants.dart';  // Ensure this file defines the colors and other constants
import '../models/question_models.dart';  // Ensure this file defines the Question class
import '../widgets/question_widget.dart';  // Custom widget for displaying the question
import '../widgets/next.dart';  // Custom widget for the Next button
import '../widgets/options.dart';  // Custom widget for displaying options

class Level4 extends StatefulWidget {
  static const root = 'Level4';
  const Level4({super.key});

  @override
  State<Level4> createState() => _Level4State();
}

class _Level4State extends State<Level4> {
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
    // Increase the range for numbers as the level progresses
    int divisor = _random.nextInt(2 + id) + 1;  // Divisor scales with the question index
    int quotient = _random.nextInt(10) + 1;  // Quotient remains manageable
    int dividend = divisor * quotient;  // Ensures the division is clean with no remainder

    int correctAnswer = quotient;
    String questionTitle = '$dividend ÷ $divisor =';

    Map<String, bool> options = _generateOptions(correctAnswer, divisor, quotient);

    return Question(
      id: id,
      title: questionTitle,
      options: options,
    );
  }

  Map<String, bool> _generateOptions(int correctAnswer, int maxNumber, int quotient) {
  Set<int> optionsSet = {correctAnswer};
  int attempts = 0;  // Limit attempts to prevent infinite loops

  while (optionsSet.length < 4 && attempts < 100) {
    int deviation = _random.nextInt(maxNumber) - (maxNumber ~/ 2);
    int fakeAnswer = correctAnswer + deviation;
    if (fakeAnswer != correctAnswer && fakeAnswer > 0) {
      optionsSet.add(fakeAnswer);
    }
    attempts++;  // Increment attempts
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
      barrierDismissible: false, // Prevent dismissing the dialog by tapping outside it
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
        title: Text('Level 4'),
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
