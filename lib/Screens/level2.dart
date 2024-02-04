import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/question_models.dart';
import '../widgets/question_widget.dart';
import '../widgets/next.dart';
import '../widgets/options.dart';

class level2 extends StatefulWidget {
  static const root = 'Level2';
  const level2({super.key});

  @override
  State<level2> createState() => _level2State();
}

class _level2State extends State<level2> {

   List<Question> _questions = [
Question(id: 1, title: '1-1=', options: {'2': false, '3': false, '1': false, '0': true}),
Question(id: 2, title: '5-2=', options: {'3': true, '2': false, '4': false, '1': false}),
Question(id: 3, title: '12-6=', options: {'6': true, '5': false, '8': false, '9': false}),
Question(id: 4, title: '18-9=', options: {'15': false, '7': false, '12': false, '9': true}),
Question(id: 5, title: '27-14=', options: { '11': false, '15': false,'13': true, '18': false}),
Question(id: 6, title: '42-23=', options: { '20': false,'19': true, '25': false, '16': false}),
Question(id: 7, title: '56-31=', options: {'21': false, '30': false, '25': true, '27': false}),
Question(id: 8, title: '73-42=', options: {'31': true, '35': false, '28': false, '39': false}),
Question(id: 9, title: '98-57=', options: {'41': true, '37': false, '48': false, '52': false}),
Question(id: 10, title: '125-69=', options: {'74': false, '62': false, '48': false,'56': true}),
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
                'Level2',
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
