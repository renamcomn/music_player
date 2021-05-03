import 'dart:io';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:music_player/albumart.dart';
import 'package:music_player/buttons.dart';
import 'package:music_player/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Map audioData = {
    'image': 'https://i1.sndcdn.com/artworks-000477209964-6foytg-t500x500.jpg',
    'url': 'http://brutkasten.io/sunshine.mp3'
  };

  AudioCache audioCache = AudioCache();
  AudioPlayer audioPlayer = AudioPlayer();

  Duration totalDuration = Duration();
  Duration position = Duration();
 String audioState = "Stopped";

  initAudio() {
    audioPlayer.onDurationChanged.listen((updatedDuration) {
      setState(() {
        totalDuration = updatedDuration;
      });
    });

    audioPlayer.onAudioPositionChanged.listen((updatedPosition) {
      setState(() {
        position = updatedPosition;
      });
    });

    audioPlayer.onPlayerStateChanged.listen((playerState) { 
      if(playerState == AudioPlayerState.STOPPED) {
        audioState = "Stopped";
      }
      if(playerState == AudioPlayerState.PLAYING) {
        audioState = "Playing";
      }
      if(playerState == AudioPlayerState.PAUSED) {
        audioState = "Paused";
      }

      setState(() {
        audioState = audioState;
      });
    });
  }


  playMusic() async {
    print("play");
    await audioPlayer.play('https://brutkasten.io/sunshine.mp3');
  }

  pauseMusic() async {
    print("pause");
    await audioPlayer.pause();
  }

  stopMusic() async {
    print("stop");
    await audioPlayer.stop();
  }

  void initState() {
    super.initState();
    initAudio();
    if (Platform.isIOS) {
      audioCache.fixedPlayer?.startHeadlessService();
      audioPlayer.startHeadlessService();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          AlbumArt(),

          Text(totalDuration.toString().split('.').first),
          Text(position.toString().split('.').first),
          Text(audioState.toString()),
          
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () => pauseMusic(),
                child: Buttons(icon: Icons.pause,)
              ),
              GestureDetector(
                onTap: () => playMusic(),
                child: Buttons(icon: Icons.play_arrow,)
              ),
              GestureDetector(
                onTap: () => stopMusic(),
                child: Buttons(icon: Icons.stop,)
              ),
            ],
          )

          

          // TextButton(
          //   onPressed: () { 
          //     playMusic(); 
          //   }, 
          //   child: Text("Play")
          // ),
          // TextButton(
          //   onPressed: () {
          //     pauseMusic();
          //   },
          // child: Text("Pause")
          // ),
          // TextButton(
          //   onPressed: () {
          //     stopMusic();
          //   }, 
          // child: Text("Stop")
          // ),
        ],
      ),
    );
  }
}