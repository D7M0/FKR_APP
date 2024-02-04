import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  const Options({Key? key, required this.option, required this.color, required this.onTap}) : super(key: key);

  final String option;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1 / 2,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          color: color,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: ListTile(
              title: Center(
                child: Text(
                  option,
                  style: TextStyle(
                    fontSize: 20.0,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
