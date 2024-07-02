import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:music_player/src/widgets/custom_appbar.dart';

class MusicPlayerPage extends StatelessWidget {
  const MusicPlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(),
          _ImagenDiscoDuracion(),
          _TitleSong(),
        ],
      ),
    );
  }
}

class _TitleSong extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          
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
          const SizedBox(width: 20,),
          //Barra de Progreso
          _ProgressBar(),
          const SizedBox(width: 20,),

        ],
      ),
    );
  }
}

class _ProgressBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final TextStyle styleTimer = TextStyle(color: Colors.white.withOpacity(0.4));
    return Container(
      child: Column(
        children: [
          Text('0:00', style:styleTimer ),
          const SizedBox(height: 10,),
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
                  height: 100,
                  color: Colors.white.withOpacity(0.8),
                ),
              )
            ],
          ),
          const SizedBox(height: 10,),
          Text('0:00', style: styleTimer),
        ],
      ),
    );
  }
}

class _DiscImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
            const Image(
              image: AssetImage('assets/aurora.jpg'),
              fit: BoxFit.cover,
            ),
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.circular(100)),
            ),Container(
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
