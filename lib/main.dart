import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hospital/Doctor/doctor_home.dart';
import 'package:hospital/Splash_Screen.dart';
import 'package:hospital/chat.dart';
import 'package:hospital/chat2.dart';
import 'package:hospital/doctor.dart';
import 'package:hospital/login.dart';
import 'package:hospital/patient/home.dart';

import 'OnBordingScreen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();


  runApp(MyApp());

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    // navigation bar color
    statusBarColor: Colors.blue.shade800, // status bar color
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      theme: ThemeData(

      checkboxTheme: CheckboxThemeData(
        side: MaterialStateBorderSide.resolveWith(
                (_) => const BorderSide(width: 1, color: Colors.white)),
        fillColor: MaterialStateProperty.all(Colors.white),
        checkColor: MaterialStateProperty.all(Colors.white),
      ),

        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home:Splash_Screen()
    );
  }
}



