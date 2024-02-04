import 'package:new_app/Screens/Login.dart';
import 'package:new_app/Screens/Registration_Page.dart';
import 'package:new_app/Widgets/Mybutton.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_app/Screens/Start_page.dart';

class Loginpage extends StatefulWidget {
  static const root = 'Loginpage';

  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

Future signInWithGoogle() async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
  await FirebaseAuth.instance.signInWithCredential(credential);
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              Column(
                children: [
                  Container(
                    height: 180,
                    child: Image.asset('assets/Logo_small.png'),
                  ),
                  Text(
                    "FKR APP",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.w900,
                      color: Color(0xff2e386b),
                    ),
                  )
                ],
              ),
              SizedBox(height: 50),
              Mybutton(
                color: Colors.lightBlue,
                title: "SignIn",
                onPressed: () {
                  Navigator.pushNamed(context, Login.root);
                },
              ),
              Mybutton(
                color: Colors.lightBlue,
                onPressed: () {
                  Navigator.pushNamed(context, RegistrationPage.root);
                },
                title: "SignUp",
              ),
              SizedBox(
                height: 20,
              ),
              MaterialButton(
                onPressed: () {
                  signInWithGoogle();
                },
                height: 50,
                color: Colors.red,
                textColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("SignIn With Google"),
                    Image.asset("assets/Google-icon.png", width: 20),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
               Mybutton(
                color: Colors.lightBlue,
                onPressed: () {
                  Navigator.pushNamed(context, Start_page.root);
                },
                title: "play Offline",
                )

            ],
          ),
        ),
      ),
    );
  }
}
