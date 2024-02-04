import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/question_models.dart';
import '../widgets/question_widget.dart';
import '../widgets/next.dart';
import '../widgets/options.dart';

class level1 extends StatefulWidget {
  static const root = 'level1';
  const level1({Key? key}) : super(key: key);

  @override
  State<level1> createState() => _level1State();
}

class _level1State extends State<level1> {
  List<Question> _questions = [
    Question(id: 1, title: '3+6=', options: {'3': false, '9': true, '8': false, '7': false}),
    Question(id: 2, title: '7+4=', options: {'10': false, '11': true, '12': false, '9': false}),
    Question(id: 3, title: '12+8=', options: {'16': false, '18': false, '22': false,'20': true}),
    Question(id: 4, title: '25+14=', options: {'39': false, '37': true, '29': false, '42': false}),
    Question(id: 5, title: '46+27=', options: {'73': true, '56': false, '64': false, '50': false}),
    Question(id: 6, title: '88+45=', options: {'96': false, '110': false,'133': true, '78': false}),
    Question(id: 7, title: '123+67=', options: {'190': true, '145': false, '134': false, '156': false}),
    Question(id: 8, title: '245+89=', options: {'334': true, '278': false, '312': false, '263': false}),
    Question(id: 9, title: '509+213=', options: {'722': true, '632': false, '545': false, '498': false}),
    Question(id: 10, title: '897+345=', options: {'1098': false, '1056': false, '932': false,'1242': true}),
  ];

  int counter = 0;
  bool clicked = false;

  void nextQuestion() {
    if (counter == _questions.length - 1) {
      return;
    } else {
      setState(() {
        counter++;
        clicked = false;
      });
    }
  }

  void colorChange() {
    setState(() {
      clicked = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            AppBar(
              backgroundColor: background,
              shadowColor: incorrect, // possible red
              title: const Text(
                'Level1',
                style: TextStyle(color: Colors.white),
              ), // APP NAME
            ),
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  QuestionWidget(
                      question: _questions[counter].title,
                      counterAction: counter,
                      totalQuestions: _questions.length),
                  const Divider(), // question widget
                  const SizedBox(
                    height: 25,
                  ),
                  for (int i = 0; i < _questions[counter].options.length; i++)
                    Options(
                        option: _questions[counter].options.keys.toList()[i],
                        color: clicked
                            ? _questions[counter].options.values.toList()[i] == true
                                ? correct
                                : incorrect
                            : Colors.white,
                        onTap: colorChange),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 9.0),
        child: Next(
          nextQuestion: nextQuestion,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked, // error possible
    );
  }
}
