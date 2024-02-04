import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:new_app/Screens/Start_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_app/Screens/Loginpage.dart';

class Settings_page extends StatefulWidget {
  static const root = 'Settings_Page';
  const Settings_page({super.key});
 
  @override
  State<Settings_page> createState() => _Settings_pageState();
}

class _Settings_pageState extends State<Settings_page> {
  final _auth = FirebaseAuth.instance;
  late User SingendInUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('SignOut'),
        actions: [
          IconButton(onPressed: (){
            GoogleSignIn googleSignIn = GoogleSignIn();
            googleSignIn.disconnect();
            _auth.signOut();
            Navigator.pushNamed(context, Loginpage.root);
          }, icon: Icon(Icons.close)),
        ],
        leading: BackButton(
            onPressed: () {
              Navigator.pushNamed(context, Start_page.root);
            },
          ),
      ),





    );
  }
}
