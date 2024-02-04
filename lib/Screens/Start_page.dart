import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_app/Screens/Levels_page.dart';

import 'package:new_app/Widgets/Mybutton.dart';
import 'package:new_app/Screens/Settings_page.dart';

class Start_page extends StatefulWidget {
  static const root = 'Start_page1';

  const Start_page({Key? key}) : super(key: key);

  @override
  State<Start_page> createState() => _Start_pageState();
}

class _Start_pageState extends State<Start_page> {
  final _auth = FirebaseAuth.instance;
  late User signedInUser;

  void getCurrentUser() {
    final user = _auth.currentUser;
    if (user != null) {
      signedInUser = user;
      print(signedInUser.email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushReplacementNamed(Settings_page.root);
            },
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 180,
                child: Image.asset("assets/Logo_small.png"),
              ),
              SizedBox(
                height: 50,
              ),
              Mybutton(
                color: Colors.lightBlue,
                onPressed: () {
                  Navigator.pushNamed(context, Levels_Page.root);
                },
                title: "Start Game",
              ),
              Mybutton(
                color: Colors.lightBlue,
                onPressed: () {},
                title: "Achievements",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
