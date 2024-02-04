import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/question_models.dart';
import '../widgets/question_widget.dart';
import '../widgets/next.dart';
import '../widgets/options.dart';

class level5 extends StatefulWidget {
  static const root = 'Level5';
  const level5({super.key});

  @override
  State<level5> createState() => _level5State();
}

class _level5State extends State<level5> {

   List<Question> _questions = [
Question(id: 1, title: '7x4=', options: {'32': false, '30': false, '24': false, '28': true}),
Question(id: 2, title: '9x6=', options: {'54': true, '48': false, '60': false, '45': false}),
Question(id: 3, title: '12x8=', options: {'96': true, '84': false, '108': false, '72': false}),
Question(id: 4, title: '15x7=', options: { '112': false, '98': false,'105': true, '90': false}),
Question(id: 5, title: '11x9=', options: { '110': false, '88': false,'99': true, '92': false}),
Question(id: 6, title: '14x11=', options: {'143': false, '132': false, '154': true, '120': false}),
Question(id: 7, title: '10x12=', options: {'120': true, '112': false, '130': false, '105': false}),
Question(id: 8, title: '13x8=', options: {'88': false, '96': false, '118': false, '104': true}),
Question(id: 9, title: '16x5=', options: {'80': true, '72': false, '90': false, '68': false}),
Question(id: 10, title: '18x9=', options: {'162': true, '144': false, '176': false, '150': false}),
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
                'Level5',
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
