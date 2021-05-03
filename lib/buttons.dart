import 'package:flutter/material.dart';
import 'package:music_player/colors.dart';

class Buttons extends StatelessWidget {

  final IconData icon;
  Buttons({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        color: primaryColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: darkPrimaryColor.withOpacity(0.4),
            offset: Offset(5,10),
            spreadRadius: 3,
            blurRadius: 10
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-3,-4),
            spreadRadius: -2,
            blurRadius: 20
          ),
        ]
      ),
      child: Stack(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle
              ),
              child: Icon(this.icon)
            ),
          )
        ]
      ),
    );
  }
}

class PlayControl extends StatelessWidget {

  final IconData icon;
  PlayControl({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
        color: primaryColor,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: darkPrimaryColor.withOpacity(0.4),
            offset: Offset(5,10),
            spreadRadius: 3,
            blurRadius: 10
          ),
          BoxShadow(
            color: Colors.white,
            offset: Offset(-3,-4),
            spreadRadius: -2,
            blurRadius: 20
          ),
        ]
      ),
      child: Stack(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle
              ),
              child: Icon(this.icon, size: 40,)
            ),
          )
        ]
      ),
    );
  }
}