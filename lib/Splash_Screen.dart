import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'OnBordingScreen.dart';

class Splash_Screen extends StatefulWidget {
  const Splash_Screen({Key? key}) : super(key: key);

  @override
  _Splash_ScreenState createState() => _Splash_ScreenState();

}
//wwwwwwwd
class _Splash_ScreenState extends State<Splash_Screen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        EasySplashScreen(
          //updatek
          logo: Image.asset(
            'image/logo2.png',fit: BoxFit.fill,),
          navigator:OnBoarding(),
          durationInSeconds: 7,
          logoSize:250,
          showLoader: false,
        ),
        Padding(//1234
          padding: const EdgeInsets.only(top: 200),
          child: Text('Life Device', textAlign: TextAlign.center,
            style: TextStyle(
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: Colors.blue.shade900,

            ),

          ),
        ),
            Padding(//1234
            padding: const EdgeInsets.only(top: 300),
              child:  DefaultTextStyle(
              style:  TextStyle(
                color: Colors.blue.shade900,
    fontSize: 20.0,
    ),
    child: AnimatedTextKit(
    animatedTexts: [
    WavyAnimatedText('For  Better  Life'),
    ],
    isRepeatingAnimation: true,
    onTap: () {
    print("Tap Event");
    },
    ),
    )
    ),


      ],

    );
  }
}
