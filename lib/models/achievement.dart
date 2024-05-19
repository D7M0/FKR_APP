 //lib/models/achievement.dart
class Achievement {
  final String title;
  final String description;
  bool isUnlocked;

  Achievement({
    required this.title,
    required this.description,
    this.isUnlocked = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'isUnlocked': isUnlocked,
    };
  }

  factory Achievement.fromMap(Map<String, dynamic> map) {
    return Achievement(
      title: map['title'],
      description: map['description'],
      isUnlocked: map['isUnlocked'],
    );
  }
}
