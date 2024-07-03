import 'package:flutter/material.dart';

class AudioplayerModel with ChangeNotifier {

  bool _playing = false;

  Duration _songDuration = const Duration(milliseconds: 0);
  Duration _current = const Duration(milliseconds: 0);

  String get songTotalDuration => printDuration(_songDuration);
  String get currentSecond => printDuration(_current);

  double get percentage => (_songDuration.inSeconds == 0 )
                            ? 0 
                            : current.inSeconds / _songDuration.inSeconds;

  late AnimationController _controller;
  set controller (AnimationController value) {
    _controller = value;
  }
    AnimationController get controller =>  _controller;

  Duration get songDuration => _songDuration;
  set songDuration(Duration value){
    _songDuration = value;
  }
  Duration get current => _current;
  set current(Duration value){
    _current = value;
  }

  String printDuration(Duration duration) {
    String twoDigits(int n) {
      if( n >= 10 ) return '$n';
      return '0$n';
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    return '$twoDigitMinutes:$twoDigitSeconds';
  }

}