import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/question_models.dart';
import '../widgets/question_widget.dart';
import '../widgets/next.dart';
import '../widgets/options.dart';

class level3 extends StatefulWidget {
  static const root = 'Level3';
  const level3({super.key});

  @override
  State<level3> createState() => _level3State();
}

class _level3State extends State<level3> {

  List<Question> _questions = [
Question(id: 1, title: '1x5=', options: {'5': true, '1': false, '7': false, '6': false}),
Question(id: 2, title: '2x4=', options: {'8': true, '6': false, '5': false, '7': false}),
Question(id: 3, title: '5x3=', options: {'15': true, '12': false, '18': false, '21': false}),
Question(id: 4, title: '7x2=', options: {'20': false, '16': false,'14': true , '12': false}),
Question(id: 5, title: '3x7=', options: {'15': false, '18': false, '24': false,'21': true}),
Question(id: 6, title: '3x9=', options: {'13': false, '28': false, '27': true, '20': false}),
Question(id: 7, title: '4x8=', options: {'40': false, '28': false, '36': false, '32': true}),
Question(id: 8, title: '6x9=', options: {'54': true, '48': false, '63': false, '58': false}),
Question(id: 9, title: '8x6=', options: {'48': true, '52': false, '42': false, '54': false}),
Question(id: 10, title: '9x9=', options: {'81': true, '88': false,'99': false, '89': false}),
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
                'Level3',
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
