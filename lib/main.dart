import 'package:flutter/material.dart';
import 'package:playlist_duration/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Playlist Duration Calculator',
      theme: ThemeData(
        brightness: Brightness.dark,
      ).copyWith(backgroundColor: Colors.grey[100],scaffoldBackgroundColor: Colors.grey[900] ,bottomAppBarColor: Colors.grey[100]),
      home: HomeScreen(),
    );
  }
}