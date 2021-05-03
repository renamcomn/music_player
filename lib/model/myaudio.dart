import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class MyAudio extends ChangeNotifier{

  Duration totalDuration = Duration();
  Duration position = Duration();
  String audioState = "Stopped";
  bool isPaused = false;

  MyAudio(){
    initAudio();
  }

  AudioPlayer audioPlayer = AudioPlayer();

  initAudio(){
    audioPlayer.onDurationChanged.listen((updatedDuration) {
        totalDuration = updatedDuration;
        notifyListeners();
    });

    audioPlayer.onAudioPositionChanged.listen((updatedPosition) {
        position = updatedPosition;
        notifyListeners();
    });

    audioPlayer.onPlayerStateChanged.listen((playerState) {
      if(playerState == AudioPlayerState.STOPPED)
        audioState = "Stopped";
      if(playerState==AudioPlayerState.PLAYING)
        audioState = "Playing";
      if(playerState == AudioPlayerState.PAUSED)
        audioState = "Paused";
      notifyListeners();
    });
  }

  playAudio(){
    audioPlayer.play('https://brutkasten.io/sunshine.mp3');
  }


  pauseAudio(){
    if(!isPaused) {
      isPaused = true;
      audioPlayer.pause();
    } else {
      isPaused = false;
      audioPlayer.resume();
    }
  }

  stopAudio(){
    audioPlayer.stop();
  }

  seekAudio(Duration durationToSeek){
    audioPlayer.seek(durationToSeek);
  }



}