import 'package:flutter/material.dart';
import 'package:new_app/Screens/Start_page.dart';
import 'package:new_app/Screens/Level1.dart';
import 'package:new_app/Screens/Level2.dart';
import 'package:new_app/Screens/Level3.dart';
import 'package:new_app/Screens/Level4.dart';
import 'package:new_app/Screens/Level5.dart';
import 'package:new_app/Screens/Level6.dart';

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
                Navigator.pushNamed(context, Level1.root);
              }),
              _buildLevelButton(2, () {
                Navigator.pushNamed(context, Level2.root);
              }),
              _buildLevelButton(3, () {
                Navigator.pushNamed(context, Level3.root);
              }),
              _buildLevelButton(4, () {
                Navigator.pushNamed(context, Level4.root);
              }),
              _buildLevelButton(5, () {
                Navigator.pushNamed(context, Level5.root);
              }),
              _buildLevelButton(6, () {
                Navigator.pushNamed(context, Level6.root);
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
