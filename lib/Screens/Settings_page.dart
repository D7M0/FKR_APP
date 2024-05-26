import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:new_app/Screens/BackgroundMusicManager.dart';
import 'package:provider/provider.dart';
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
  late User? signedInUser;

  @override
  void initState() {
    super.initState();
    signedInUser = _auth.currentUser;
    if (signedInUser == null) {
      // If user is not signed in, navigate to LoginPage
      Future.microtask(() {
        Navigator.pushReplacementNamed(context, Loginpage.root);
      });
    }
  }

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  try {
                    GoogleSignIn googleSignIn = GoogleSignIn();
                    if (await googleSignIn.isSignedIn()) {
                      await googleSignIn.disconnect();
                    }
                    await _auth.signOut();
                    Navigator.pushNamed(context, Loginpage.root);
                  } catch (e) {
                    print('Error during logout: $e');
                    final snackBar = SnackBar(content: Text('Logout failed: $e'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                child: Text(
                  'Logout',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(height: 20),
              Consumer<BackgroundMusicManager>(
                builder: (context, musicManager, child) {
                  return ElevatedButton(
                    onPressed: musicManager.toggleMute,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                    child: Text(
                      musicManager.isMuted ? 'Unmute Music' : 'Mute Music',
                      style: TextStyle(fontSize: 20),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
