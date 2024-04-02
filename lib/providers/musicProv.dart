import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final backgroundMusicProvider =
    ChangeNotifierProvider.autoDispose((ref) => BackgroundMusic());

class BackgroundMusic extends ChangeNotifier {
  final AudioPlayer _player = AudioPlayer();

  BackgroundMusic() {
    _player.setLoopMode(LoopMode.one);
    playBgMusic();
  }

  void playBgMusic() async {
    await _player.setAsset('assets/audios/background_audio2.m4a');
    _player.play();
  }

  void toggleMusic() {
    if (_player.playing) {
      _player.pause();
    } else {
      _player.play();
    }
    notifyListeners();
  }

  bool get isMusicPlaying => _player.playing;
}
