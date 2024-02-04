import 'package:new_app/Screens/Levels_page.dart';
import 'package:new_app/Screens/Registration_Page.dart';
import 'package:flutter/material.dart';
import 'package:new_app/Screens/Settings_page.dart';
import 'package:new_app/Screens/Start_page.dart';
import 'package:new_app/Screens/level1.dart';
import 'package:new_app/Screens/level2.dart';
import 'package:new_app/Screens/level3.dart';
import 'package:new_app/Screens/level4.dart';
import 'package:new_app/Screens/level5.dart';
import 'package:new_app/Screens/level6.dart';
import 'Screens/Login.dart';
import 'Screens/LoginPage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}





class MyApp extends StatelessWidget {
void initState(){
  FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('User is currently signed out!');
    } else {
      print('User is signed in!');
    }
  });
}
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FirebaseAuth.instance.currentUser ==null?Login():Start_page(),
      title: "FKR APP",
      theme: ThemeData(primaryColor: Colors.blue),
      //home: Start_page(),
      initialRoute: Loginpage.root,
      routes: {
        Loginpage.root: (context) => Loginpage(),
        RegistrationPage.root: (context) => RegistrationPage(),
        Login.root:(context) => Login(),
        Start_page.root:(context) => Start_page(),
        Settings_page.root:(context) => Settings_page(),
        Levels_Page.root:(context) => Levels_Page(),
        level1.root:(context) => level1(),
        level2.root:(context) => level2(),
        level3.root:(context) => level3(),
        Level4.root:(context) => Level4(),
        level5.root:(context) => level5(),
        level6.root:(context) => level6(),
      },
    );
  }
}
