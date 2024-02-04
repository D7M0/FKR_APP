import 'package:flutter/material.dart';
import 'package:new_app/Screens/Start_page.dart';
import 'package:new_app/Screens/level1.dart';
import 'package:new_app/Screens/level2.dart';
import 'package:new_app/Screens/level3.dart';
import 'package:new_app/Screens/level4.dart';
import 'package:new_app/Screens/level5.dart';
import 'package:new_app/Screens/level6.dart';

class Levels_Page extends StatefulWidget {
  static const root = 'Levels_page';
  const Levels_Page({Key? key}) : super(key: key);

  @override
  State<Levels_Page> createState() => _Levels_PageState();
}

class _Levels_PageState extends State<Levels_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Navigator.pushNamed(context, Start_page.root);
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLevelButton(1, () {
                Navigator.pushNamed(context, level1.root);
              }),
              _buildLevelButton(2, () {
                Navigator.pushNamed(context, level2.root);
              }),
              _buildLevelButton(3, () {
                Navigator.pushNamed(context, level3.root);
              }),
              _buildLevelButton(4, () {
                Navigator.pushNamed(context, Level4.root);
              }),
              _buildLevelButton(5, () {
                Navigator.pushNamed(context, level5.root);
              }),
              _buildLevelButton(6, () {
                Navigator.pushNamed(context, level6.root);
              }),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLevelButton(int level, VoidCallback onPressed) {
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
