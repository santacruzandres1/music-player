import 'package:animate_do/animate_do.dart';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:music_player/src/helpers/helpers.dart';
import 'package:music_player/src/model/audioplayer_model.dart';
import 'package:music_player/src/widgets/custom_appbar.dart';
import 'package:provider/provider.dart';

class MusicPlayerPage extends StatelessWidget {
  const MusicPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children:[
            Container(
            width:double.infinity,
            height: screenSize.height * 0.8,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60)),
              gradient: LinearGradient(
                end: Alignment.center,
                colors: [
                  Color(0xff33333E),
                  Color(0xff201E28),
              ])
            ),
          ),
          Column(
          children: [
            CustomAppbar(),
            _ImagenDiscoDuracion(),
            _TitleSong(),
            Expanded(child: _Lyrics()),
          ],),
        
      ]),
    );
  }
}

class _Lyrics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lyrics = getLyrics();
    return ListWheelScrollView(
      itemExtent: 42,
      diameterRatio: 1.5,
      physics: const BouncingScrollPhysics(),
      children: lyrics
          .map((verso) => Text(
                verso,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ))
          .toList(),
    );
  }
}

class _TitleSong extends StatefulWidget {
  @override
  State<_TitleSong> createState() => _TitleSongState();
}

class _TitleSongState extends State<_TitleSong> with SingleTickerProviderStateMixin{
  bool isPlaying = false;
  bool firstTime = true;
  late AnimationController playAnimation;


  final assetAudioPlayer = AssetsAudioPlayer();

  @override
  void initState() {
    super.initState();
    playAnimation = AnimationController(vsync: this, duration: const Duration(milliseconds: 500));
  }

  @override
  void dispose() {
    playAnimation.dispose();
    super.dispose();
  }

  void open() {
    final audioplayerModel = Provider.of<AudioplayerModel>(context, listen: false);

    assetAudioPlayer.open(
      Audio('assets/Breaking-Benjamin-Far-Away.mp3'),
      autoStart: true,
      showNotification: true
);
  assetAudioPlayer.currentPosition.listen((duration){
    audioplayerModel.current = duration;

    assetAudioPlayer.current.listen((playingAudio){
    
      audioplayerModel.songDuration = playingAudio!.audio.duration;
    });
  });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      margin: const EdgeInsets.only(top: 40),
      child: Row(
        children: [
          Column(
            children: [
              Text(
                'Far Away',
                style: TextStyle(
                    fontSize: 30, color: Colors.white.withOpacity(0.8)),
              ),
              Text(
                '-Breaking Benjamin-',
                style: TextStyle(
                    fontSize: 18, color: Colors.white.withOpacity(0.5)),
              ),
            ],
          ),
          const Spacer(),
          FloatingActionButton(
            backgroundColor: const Color(0xffF8CB51),
            shape: const CircleBorder(),
            elevation: 0,
            highlightElevation: 0,
            onPressed: () {
              final audioPlayerModel = Provider.of<AudioplayerModel>(context, listen: false);
              if(isPlaying) {
                  playAnimation.reverse();
                isPlaying = false;
                audioPlayerModel.controller.stop();
              } else{
                playAnimation.forward();
                isPlaying = true;
                audioPlayerModel.controller.repeat();
              }

              if(firstTime) {
                open();
                firstTime = false;
              } else {
                assetAudioPlayer.playOrPause();
              }
            },
            child: AnimatedIcon(
              icon: AnimatedIcons.play_pause, 
              progress: playAnimation,
              color: Colors.black,
              ),
          )
        ],
      ),
    );
  }
}

class _ImagenDiscoDuracion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 100),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          // Disco
          _DiscImage(),
          const SizedBox(
            width: 20,
          ),
          const Spacer(),
          //Barra de Progreso
          _ProgressBar(),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextStyle styleTimer =
        TextStyle(color: Colors.white.withOpacity(0.4));

    final audioPlayerModel = Provider.of<AudioplayerModel>(context);
    final percentage = audioPlayerModel.percentage;

    return Column(
      children: [
        Text(audioPlayerModel.songTotalDuration, style: styleTimer),
        const SizedBox(
          height: 10,
        ),
        Stack(
          children: [
            Container(
              width: 3,
              height: 230,
              color: Colors.white.withOpacity(0.1),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                width: 3,
                height: 230 * percentage,
                color: Colors.white.withOpacity(0.8),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        Text(audioPlayerModel.currentSecond, style: styleTimer),
      ],
    );
  }
}

class _DiscImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AudioplayerModel audioplayerModel = Provider.of<AudioplayerModel>(context);
    return Container(
      padding: const EdgeInsets.all(20),
      width: 250,
      height: 250,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            colors: [
              Color(0xFF484848),
              Color(0xff1E1C24),
            ],
          )),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(200),
        child: Stack(
          alignment: Alignment.center,
          children: [
            SpinPerfect(
              duration: const Duration(seconds: 10),
              infinite: true,
              manualTrigger: true,
              controller: (animationController) => audioplayerModel.controller = animationController ,
              child: const Image(
                image: AssetImage('assets/aurora.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(100)),
            ),
            Container(
              width: 18,
              height: 18,
              decoration: BoxDecoration(
                  color: const Color(0xff1C1C25),
                  borderRadius: BorderRadius.circular(100)),
            ),
          ],
        ),
      ),
    );
  }
}
