import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:music_player/model/myaudio.dart';
import 'package:music_player/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MyApp());
  await SystemChrome.setEnabledSystemUIOverlays([]);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (_) => MyAudio(),
        child: HomePage()
      ),
    );
  }
}
