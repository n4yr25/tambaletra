import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:tambaletra/components/dialog_settings.dart';
import 'package:tambaletra/managers/audio.dart';
import 'package:tambaletra/models/audio_adapter.dart';
import 'package:tambaletra/screens/game.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void initState() {
    BackgroundAudioNotifier()
        .playBackgroundAudio('audios/background_audio2.m4a');
    isBackgroundAudioPlayingProvider;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: 150,
          left: 40,
          right: 40,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/tambaLetra.gif',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 160),
              child: Image.asset(
                "assets/images/tambaletra_logo.png",
                width: 170,
                height: 170,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              height: 45,
              child: ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Game(),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shadowColor: Colors.yellow,
                  elevation: 3,
                ),
                child: Text(
                  'Start Game',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25),
              height: 45,
              child: ElevatedButton(
                onPressed: () async {
                  return showDialog(
                    context: context,
                    builder: (context) => SettingsDialog(),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shadowColor: Colors.yellow,
                  elevation: 3,
                ),
                child: Text(
                  'Settings',
                  style: TextStyle(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
