import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AudioState { stopped, playing, paused }

class BackgroundAudioNotifier extends StateNotifier<AudioState> {
  BackgroundAudioNotifier() : super(AudioState.stopped);

  static final AudioPlayer _audioPlayer = AudioPlayer();

  Future<void> playBackgroundAudio(String audioUrl) async {
    await _audioPlayer.play(
      AssetSource(audioUrl),
    );
    await _audioPlayer.setReleaseMode(ReleaseMode.loop);

    state = AudioState.playing;
  }

  Future<void> pauseBackgroundAudio() async {
    await _audioPlayer.pause();
    state = AudioState.paused;
  }

  Future<void> resumeBackgroundAudio() async {
    await _audioPlayer.resume();
    state = AudioState.playing;
  }

  Future<void> stopBackgroundAudio() async {
    await _audioPlayer.stop();
    state = AudioState.stopped;
  }

  Future<void> toggleBackgroundAudio() async {
    if (state == AudioState.playing) {
      await pauseBackgroundAudio();
    } else if (state == AudioState.paused) {
      await resumeBackgroundAudio();
    } else {
      await playBackgroundAudio('audios/background_audio2.m4a');
    }
  }
}

final backgroundAudioProvider =
    StateNotifierProvider<BackgroundAudioNotifier, AudioState>((ref) {
  return BackgroundAudioNotifier();
});

var isBackgroundAudioPlayingProvider = Provider<bool>((ref) {
  final audioState = ref.watch(backgroundAudioProvider);
  return audioState == AudioState.playing;
});
