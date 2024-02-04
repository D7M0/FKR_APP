import 'package:flutter/material.dart';
import '../constants.dart';

class QuestionWidget extends StatelessWidget {

  const QuestionWidget({
    Key? key, required this.question, required this.counterAction, required this.totalQuestions,}) : super(key: key);

  final String question;
  final int counterAction;
  final int totalQuestions;

  @override
  Widget build(BuildContext context) {
    return Container(
    alignment: Alignment.center,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(
              '${counterAction + 1} / $totalQuestions:\n',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18.0, color: neutral),
              ),

          Text(

            question,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 24.0, color: dark),
          
          ),
          ],
          ),
          );
          }}