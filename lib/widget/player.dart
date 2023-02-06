import 'package:assets_audio_player/assets_audio_player.dart';

final assetsAudioPlayer = AssetsAudioPlayer();
//Declared in Global to Stop From Anywhere

class AutoPlay {
  void play(String name) {
    assetsAudioPlayer.open(
      Audio("assets/sounds/$name.m4a"),
      autoStart: true,
      showNotification: true,
    );
  }
}
