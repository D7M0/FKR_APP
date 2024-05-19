import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/material.dart';
import 'package:new_app/Screens/Start_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_app/Screens/Loginpage.dart';

class Settings_page extends StatefulWidget {
  static const root = 'Settings_Page';
  const Settings_page({Key? key});
 
  @override
  State<Settings_page> createState() => _Settings_pageState();
}

class _Settings_pageState extends State<Settings_page> {
  final _auth = FirebaseAuth.instance;
  late User SignedInUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
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
          child: ElevatedButton(
            onPressed: () async {
              try {
                GoogleSignIn googleSignIn = GoogleSignIn();
                await googleSignIn.disconnect();
                await _auth.signOut();
                Navigator.pushNamed(context, Loginpage.root);
              } catch (e) {
                print('Error during logout: $e');
                // Optionally, add a dialog or snackbar to inform the user of the error.
                final snackBar = SnackBar(content: Text('Logout failed: $e'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue, // Updated property
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            child: Text(
              'Logout',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
