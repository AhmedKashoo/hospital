import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          navigator:null,
          durationInSeconds: 7,
          logoSize:250,
        ),
        Padding(//1234
          padding: const EdgeInsets.only(top: 200),
          child: Text('life device', textAlign: TextAlign.center,
            style: TextStyle(
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold,
              fontSize: 40,
              color: Colors.blue,
            ),

          ),
        ),
      ],

    );
  }
}
