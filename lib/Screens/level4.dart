import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/question_models.dart';
import '../widgets/question_widget.dart';
import '../widgets/next.dart';
import '../widgets/options.dart';

class Level4 extends StatefulWidget {
  static const root = 'Level4';
  const Level4({super.key});

  @override
  State<Level4> createState() => _Level4State();
}

class _Level4State extends State<Level4> {
  List<Question> _questions = [
Question(id: 1, title: '7+4=', options: {'10': false, '11': true, '12': false, '9': false}),
Question(id: 2, title: '9x2=', options: {'18': true, '15': false, '24': false, '20': false}),
Question(id: 3, title: '25-8=', options: {'6': false, '17': true, '9': false, '5': false}),
Question(id: 4, title: '6x7=', options: {'42': true, '35': false, '48': false, '30': false}),
Question(id: 5, title: '25+14=', options: {'39': false, '37': true, '29': false, '42': false}),
Question(id: 6, title: '86-47=', options: {'19': true, '25': false, '18': false, '30': false}),
Question(id: 7, title: '81+31=', options: {'114': false,'112': true, '109': false, '107': false}),
Question(id: 8, title: '89-42=', options: {'43': false, '55': false, '38': false, '47': true}),
Question(id: 9, title: '7x8=', options: { '42': false, '49': false, '64': false,'56': true}),
Question(id: 10, title: '123+67=', options: { '134': false, '145': false,'190': true, '156': false}),
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
                'Level4',
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
