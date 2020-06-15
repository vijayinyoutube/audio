import 'dart:ui';

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
      debugShowCheckedModeBanner: false,
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

AudioCache audioCache;
AudioPlayer audioPlayer;
Duration _duration = new Duration();
Duration _position = new Duration();
double _sigmaX = 6.5; // from 0-10
double _sigmaY = 6.5; // from 0-10
double _opacity = 20.1; // from 0-1.0

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    initiPlayer();
  }

  void initiPlayer() {
    audioPlayer = new AudioPlayer();
    audioCache = new AudioCache(fixedPlayer: audioPlayer);
    audioPlayer.durationHandler = (d) => setState(() {
          _duration = d;
        });

    audioPlayer.positionHandler = (p) => setState(() {
          _position = p;
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Audio Player in Flutter"),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/balaji.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
          child: Column(
            children: [
              SizedBox(
                height: 150,
              ),
              Container(
                child: FlatButton(
                  onPressed: () {
                    audioCache.play("songs1.mp3");
                  },
                  child: Text("play"),
                ),
              ),
              Container(
                child: FlatButton(
                  onPressed: () {
                    audioPlayer.pause();
                  },
                  child: Text("pause"),
                ),
              ),
              Container(
                child: FlatButton(
                  onPressed: () {
                    audioPlayer.stop();
                  },
                  child: Text("stop"),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Slider(
                activeColor: Colors.blue,
                inactiveColor: Colors.grey,
                value: _position.inSeconds.toDouble(),
                // min: 0.0,
                max: _duration.inSeconds.toDouble(),
                onChanged: (double value) {
                  setState(() {
                    seekToSecond(value.toInt());
                    value = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void seekToSecond(int second) {
  Duration newDuration = Duration(seconds: second);

  audioPlayer.seek(newDuration);
}
