import 'dart:io';
import 'dart:math';

import 'package:audioplayers/audio_cache.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:music_player/albumart.dart';
import 'package:music_player/buttons.dart';
import 'package:music_player/colors.dart';
import 'package:music_player/model/myaudio.dart';
import 'package:music_player/navbar.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  AudioCache audioCache = AudioCache();
  AudioPlayer audioPlayer = AudioPlayer();

  Duration totalDuration = Duration();
  Duration position = Duration();
  String audioState = "Stopped";

  double sliderValue = 0.0;
  bool isPaused = false;

  String action = "";


  playMusic() async {
    print("play");
    await audioPlayer.play('https://brutkasten.io/sunshine.mp3');
  }

  pauseMusic() async {
    print("pause");
    setState(() {
      if(!isPaused) {
        isPaused = true;
        audioPlayer.pause();
      } else {
        isPaused = false;
        audioPlayer.resume();
      }
      
    });
    
  }

  stopMusic() async {
    print("stop");
    await audioPlayer.stop();
  }

  seekMusic(Duration durationToSeek) async {
    audioPlayer.seek(durationToSeek);
  }

  void initState() {
    super.initState();
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
          NavigationBar(),
          AlbumArt(),
          Text("Ain't No Sunshine (JØRD Remix)", style: TextStyle(color: darkPrimaryColor, fontSize: 18, fontWeight: FontWeight.w400),),
          Column(
            children: [
              SliderTheme(
                data: SliderThemeData(
                  trackHeight: 5,
                  thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5)
                ),
                  child: Consumer<MyAudio>(
                    builder:(_,myAudioModel,child) =>
                    Slider(
                        value: myAudioModel.position==null? 0 : myAudioModel.position.inMilliseconds.toDouble(), 
                        activeColor: darkPrimaryColor,
                        inactiveColor: darkPrimaryColor.withOpacity(0.3),
                        onChanged: (value) {
                          myAudioModel.seekAudio(Duration(milliseconds: value.toInt()));
                        },
                        min: 0.0,
                        max: myAudioModel.totalDuration==null? 20 : myAudioModel.totalDuration.inMilliseconds.toDouble(),
                    ),
                  ),
              ),
              Consumer<MyAudio>(
                builder: (_,myAudioModel,child) =>
                  Container(
                  margin: EdgeInsets.symmetric(horizontal:20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      Text(myAudioModel.totalDuration.toString().split('.').first, style: TextStyle(color: darkPrimaryColor, fontWeight: FontWeight.w600),),
                      Text(myAudioModel.position.toString().split('.').first, style: TextStyle(color: darkPrimaryColor, fontWeight: FontWeight.w600)),

                    ]
                  ),
                ),
              )
            ],
          ),        
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Buttons(icon: Icons.pause, action: "pause",),
              PlayControl(icon: Icons.play_arrow,),
              Buttons(icon: Icons.stop, action: "stop"),
            ],
          )
        ],
      ),
    );
  }
}