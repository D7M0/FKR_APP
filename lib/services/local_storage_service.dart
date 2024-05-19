// lib/services/local_storage_service.dart
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/achievement.dart';

class LocalStorageService {
  static const _achievementsKey = 'achievements';

  Future<void> saveAchievements(List<Achievement> achievements) async {
    final prefs = await SharedPreferences.getInstance();
    final achievementsMap = achievements.map((ach) => ach.toMap()).toList();
    prefs.setString(_achievementsKey, json.encode(achievementsMap));
  }

  Future<List<Achievement>> loadAchievements() async {
    final prefs = await SharedPreferences.getInstance();
    final achievementsString = prefs.getString(_achievementsKey);
    if (achievementsString != null) {
      final List decoded = json.decode(achievementsString);
      return decoded.map((map) => Achievement.fromMap(map)).toList();
    } else {
      return [];
    }
  }
}
