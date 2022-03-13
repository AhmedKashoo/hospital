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
    return EasySplashScreen(
      backgroundColor: Colors.white24,
    logo: Image.asset(
    'image/logo.jpeg',fit: BoxFit.fill,),
    navigator:null,
    durationInSeconds: 7,
    logoSize:250,


    );
  }
}
