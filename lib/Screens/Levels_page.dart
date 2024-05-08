import 'package:flutter/material.dart';
import 'package:new_app/Screens/Start_page.dart';
import 'package:new_app/Screens/Level1.dart';
import 'package:new_app/Screens/Level2.dart';
import 'package:new_app/Screens/Level3.dart';
import 'package:new_app/Screens/Level4.dart';
import 'package:new_app/Screens/Level5.dart';
import 'package:new_app/Screens/Level6.dart';
import 'package:new_app/Widgets/level_button.dart';


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
              LevelButton(level: 1, onPressed: () {
                Navigator.pushNamed(context, Level1.root);
              }),
              LevelButton(level: 2, onPressed: () {
                Navigator.pushNamed(context, Level2.root);
              }),
              LevelButton(level: 3, onPressed: () {
                Navigator.pushNamed(context, Level3.root);
              }),
              LevelButton(level: 4, onPressed: () {
                Navigator.pushNamed(context, Level4.root);
              }),
              LevelButton(level: 5, onPressed: () {
                Navigator.pushNamed(context, Level5.root);
              }),
              LevelButton(level: 6, onPressed: () {
                Navigator.pushNamed(context, Level6.root);
              }),
            ],
          ),
        ),
      ),
    );
  }
}