import 'package:flutter/material.dart';
import 'package:music_player/src/model/audioplayer_model.dart';
import 'package:music_player/src/pages/pages.dart';
import 'package:music_player/src/theme/theme.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_)=> AudioplayerModel())
      ],
      child: const MainApp()),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Player',
      debugShowCheckedModeBanner: false,
      theme: miTema,
      home: const MusicPlayerPage(),
    );
  }
}
