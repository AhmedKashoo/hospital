import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/components.dart';

class HospitalDashBoard extends StatefulWidget {
  const HospitalDashBoard({Key? key}) : super(key: key);

  @override
  _HospitalDashBoardState createState() => _HospitalDashBoardState();
}

class _HospitalDashBoardState extends State<HospitalDashBoard> {
  Color c = const Color.fromARGB(232,234,245,245);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(300)),
      child: Scaffold(
        backgroundColor: c,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Text('DashBoard',style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.w500,fontSize: 28),),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(28),color: Colors.blue.shade900),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Text('Welcome Hospital Name',style: TextStyle(color: Colors.white,fontSize: 19),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 36.0,right: 36,top: 10,),
                        child: Center(child: Text('Lets contact other hospitals to provide',style: TextStyle(color: Colors.white,fontSize: 14),)),
                      ),
                Text('better medical service',style: TextStyle(color: Colors.white,fontSize: 14)),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: button(text: 'contact other hospitals', function: null),
                      )


                    ],
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}
