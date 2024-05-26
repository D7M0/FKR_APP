import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/foundation.dart';

class BackgroundMusicManager with ChangeNotifier {
  static AudioPlayer _audioPlayer = AudioPlayer();
  bool _isPlaying = false;
  bool _isMuted = false;

  bool get isPlaying => _isPlaying;
  bool get isMuted => _isMuted;

  Future<void> play() async {
    if (!_isPlaying) {
      await _audioPlayer.play(AssetSource('Music/Background music.mp3'), volume: _isMuted ? 0 : 1);
      _isPlaying = true;
      notifyListeners();
    }
  }

  Future<void> stop() async {
    if (_isPlaying) {
      await _audioPlayer.stop();
      _isPlaying = false;
      notifyListeners();
    }
  }

  void toggleMute() {
    _isMuted = !_isMuted;
    _audioPlayer.setVolume(_isMuted ? 0 : 1);
    notifyListeners();
  }
}
