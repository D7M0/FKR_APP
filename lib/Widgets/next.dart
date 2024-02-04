import 'package:flutter/material.dart';
import '../constants.dart';

class Next extends StatelessWidget {
  const Next({Key? key, required this.nextQuestion}) : super(key: key);

  final VoidCallback nextQuestion;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1/3,
      child: GestureDetector(
        onTap: nextQuestion,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 11.0),
          decoration: BoxDecoration(
            color: neutral,
            borderRadius: BorderRadius.circular(9.0),
          ),
          child: const Text(
            'Next',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
