import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppbar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: const EdgeInsets.only(top: 30),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Row(
          children: [
            FaIcon(FontAwesomeIcons.chevronLeft),
            Spacer(),
            Icon(FontAwesomeIcons.message),
            SizedBox(width: 20,),
            Icon(FontAwesomeIcons.headphones),
            SizedBox(width: 20,),
            Icon(FontAwesomeIcons.upRightFromSquare),
            SizedBox(width: 20,),
          ],
        ),
      ),
    );
  }
}