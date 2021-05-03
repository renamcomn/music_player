import 'package:flutter/material.dart';
import 'package:music_player/colors.dart';

class NavigationBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          NavBarItem(icon: Icons.arrow_back,),
          Text("Playing Now", style: TextStyle(fontSize: 16, color: darkPrimaryColor, fontWeight: FontWeight.w500)),
          NavBarItem(icon: Icons.list)

        ],
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {

  final IconData icon;
  NavBarItem({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: primaryColor,
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
            blurRadius: 10
          )
        ],
        borderRadius: BorderRadius.circular(10)
      ),
      child: Icon(this.icon, color: darkPrimaryColor,),
    );
  }
}