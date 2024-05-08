import 'package:flutter/material.dart';

class LevelButton extends StatelessWidget {
  final int level;
  final VoidCallback onPressed;

  const LevelButton({
    Key? key,
    required this.level,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: Colors.lightBlue,
        ),
        child: Text('Level $level'),
      ),
    );
  }
}