import 'package:new_app/Screens/Levels_page.dart';
import 'package:new_app/Screens/Registration_Page.dart';
import 'package:flutter/material.dart';
import 'package:new_app/Screens/Settings_page.dart';
import 'package:new_app/Screens/Start_page.dart';
import 'package:new_app/Screens/Level1.dart';
import 'package:new_app/Screens/Level2.dart';
import 'package:new_app/Screens/Level3.dart';
import 'package:new_app/Screens/Level4.dart';
import 'package:new_app/Screens/Level5.dart';
import 'package:new_app/Screens/Level6.dart';
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
        Level1.root:(context) => Level1(),
        Level2.root:(context) => Level2(),
        Level3.root:(context) => Level3(),
        Level4.root:(context) => Level4(),
        Level5.root:(context) => Level5(),
        Level6.root:(context) => Level6(),
      },
    );
  }
}
