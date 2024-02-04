import 'package:flutter/material.dart';
import '../constants.dart';
import '../models/question_models.dart';
import '../widgets/question_widget.dart';
import '../widgets/next.dart';
import '../widgets/options.dart';

class level6 extends StatefulWidget {
  static const root = 'Level6';
  const level6({super.key});

  @override
  State<level6> createState() => _level6State();
}

class _level6State extends State<level6> {
 
   List<Question> _questions = [
Question(id: 1, title: '(1+16)x6=', options: {'98': false, '90': false, '112': false,'102': true }),
Question(id: 2, title: '13x(5+5)=', options: {'140': false, '120': false,'130': true , '115': false}),
Question(id: 3, title: '11x(20-8)=', options: {'120': false,'132': true , '145': false, '110': false}),
Question(id: 4, title: '(7+7)x9=', options: {'126': true, '112': false, '138': false, '118': false}),
Question(id: 5, title: '16x(38-30)=', options: {'120': false, '144': false, '156': false, '128': true}),
Question(id: 6, title: '(5+5+9)x7=', options: {'103': false, '113': false, '123': false, '133': true}),
Question(id: 7, title: '(20-5)x(10+1)=', options: {'155': true, '135': false, '145': false, '120': false}),
Question(id: 8, title: '18x(2x3)=', options: {'108': true, '96': false, '112': false, '92': false}),
Question(id: 9, title: '(2x10)x9=', options: {'190': false, '160': false, '200': false, '180': true}),
Question(id: 10, title: '(44-22)x(2x2)=', options: { '78': false, '76': false, '92': false,'88': true}),
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
                'Level6',
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
