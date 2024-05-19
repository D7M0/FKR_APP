// lib/screens/achievements_screen.dart
import 'package:flutter/material.dart';
import '../models/achievement.dart';
import '../services/local_storage_service.dart';

class Achievements extends StatefulWidget {
  static const String root = 'Achievements';
  const Achievements({super.key});

  @override
  State<Achievements> createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {
  List<Achievement> _achievements = [];
  final _localStorageService = LocalStorageService();

  @override
  void initState() {
    super.initState();
    _loadAchievements();
  }

  Future<void> _loadAchievements() async {
    List<Achievement> loadedAchievements = await _localStorageService.loadAchievements();
    setState(() {
      _achievements = loadedAchievements;
    });
  }

  Future<void> _unlockAchievement(int index) async {
    setState(() {
      _achievements[index].isUnlocked = true;
    });
    await _localStorageService.saveAchievements(_achievements);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Achievements"),
      ),
      body: Stack(
        children: <Widget>[
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/background.png',
              fit: BoxFit.cover,
            ),
          ),
          // Achievements list
          _achievements.isEmpty
              ? Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: _achievements.length,
                  itemBuilder: (context, index) {
                    Achievement achievement = _achievements[index];
                    return Card(
                      color: Colors.white.withOpacity(0.8),
                      child: ListTile(
                        leading: Icon(
                          achievement.isUnlocked ? Icons.check_circle : Icons.lock,
                          color: achievement.isUnlocked ? Colors.green : Colors.red,
                        ),
                        title: Text(achievement.title),
                        subtitle: Text(achievement.description),
                        onTap: achievement.isUnlocked ? null : () => _unlockAchievement(index),
                      ),
                    );
                  },
                ),
        ],
      ),
    );
  }
}