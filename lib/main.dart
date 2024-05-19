import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'Screens/Achievements.dart';
import 'Screens/Levels_page.dart';
import 'Screens/Registration_Page.dart';
import 'Screens/Settings_page.dart';
import 'Screens/Start_page.dart';
import 'Screens/Level1.dart';
import 'Screens/Level2.dart';
import 'Screens/Level3.dart';
import 'Screens/Level4.dart';
import 'Screens/Level5.dart';
import 'Screens/Level6.dart';
import 'Screens/Login.dart';
import 'Screens/LoginPage.dart';
import 'firebase_options.dart';
import 'services/local_storage_service.dart';
import 'models/achievement.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await _initializeAchievements();
  runApp(MyApp());
}

Future<void> _initializeAchievements() async {
  final localStorageService = LocalStorageService();
  final achievements = await localStorageService.loadAchievements();
  if (achievements.isEmpty) {
    final initialAchievements = [
      Achievement(title: "First Win", description: "Win your first level", isUnlocked: false),
      Achievement(title: "Math Master", description: "Solve All levels", isUnlocked: false),
      Achievement(title: "Speedster", description: "Solve a problem in under 3 seconds", isUnlocked: false),
    ];
    await localStorageService.saveAchievements(initialAchievements);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "FKR APP",
      theme: ThemeData(primaryColor: Colors.blue),
      home: FirebaseAuth.instance.currentUser == null ? Login() : Start_page(),
      initialRoute: Loginpage.root,
      routes: {
        Loginpage.root: (context) => Loginpage(),
        RegistrationPage.root: (context) => RegistrationPage(),
        Login.root: (context) => Login(),
        Start_page.root: (context) => Start_page(),
        Settings_page.root: (context) => Settings_page(),
        Levels_Page.root: (context) => Levels_Page(),
        Level1.root: (context) => Level1(),
        Level2.root: (context) => Level2(),
        Level3.root: (context) => Level3(),
        Level4.root: (context) => Level4(),
        Level5.root: (context) => Level5(),
        Level6.root: (context) => Level6(),
        Achievements.root: (context) => Achievements(),
      },
    );
  }
}
