import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HospitalDashBoard.dart';
import 'chat.dart';

class HospitalHome extends StatefulWidget {
  const HospitalHome({Key? key}) : super(key: key);

  @override
  _HospitalHomeState createState() => _HospitalHomeState();
}

class _HospitalHomeState extends State<HospitalHome> {
  int currentindex = 0;
  List <Widget>screens = [
    HospitalDashBoard(),
    Hospital_Chat()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.blue.shade800,elevation: 0,),
      body: screens[currentindex],
      bottomNavigationBar: Container(

        child: FancyBottomNavigation(
          circleColor: Colors.blue.shade900,
          tabs: [
            TabData(iconData: Icons.home, title: "Home"),
            TabData(iconData: Icons.chat, title: "Search"),

          ],
          onTabChangedListener: (position) {
            setState(() {
              currentindex = position;
            });
          },
        )
      ),
    );
  }
}
