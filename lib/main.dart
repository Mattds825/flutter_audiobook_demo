import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool play = false;
  String time = '0';
  String url =
      'https://ia803108.us.archive.org/10/items/a_christmas_miscellany_2018_1807_librivox/christmasmiscellany2018_01_various_64kb.mp3';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(time),
              AudioWidget(
                audio: Audio.network(url),
                play: play,
                child: IconButton(
                  icon: Icon(
                    play ? Icons.pause : Icons.play_arrow,
                  ),
                  onPressed: () {
                    setState(() => play = !play);
                  },
                ),
                onPositionChanged: (c, d) {
                  setState(() => time = c.toString());
                },
                onReadyToPlay: (d) {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
