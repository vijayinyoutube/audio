import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final player=AudioCache();
AudioPlayer _players;

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Audio Player in Flutter"),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              child: FlatButton(
                onPressed: () {
                  player.play('songs1.mp3');
                },
                child: Text("play"),
              ),
            ),
            Container(
              child: FlatButton(
                onPressed: () async {
                  _players..pause();
                },
                child: Text("pause"),
              ),
            ),
            Container(
              child: FlatButton(
                onPressed: () async {
                  _players.stop();
                },
                child: Text("stop"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
