import 'package:flutter/material.dart';
import 'package:music_player/src/pages/pages.dart';
import 'package:music_player/src/theme/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Music Player',
      debugShowCheckedModeBanner: false,
      theme: miTema,
      home: const MusicPlayerPage(),
    );
  }
}
