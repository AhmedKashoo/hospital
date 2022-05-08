import 'package:flutter/material.dart';
import 'package:hospital/patient/home.dart';

void main(){
  runApp(Mypatient());
}


class Mypatient extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Patient_home(),
    );
  }

}