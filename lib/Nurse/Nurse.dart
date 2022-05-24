import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/Doctor/patient_doctor_med.dart';

import '../login.dart';

class Nurse extends StatelessWidget {
  const Nurse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {},
            child: Icon(
              Icons.local_hospital, color: Colors.blueAccent, size: 30,)),
        title: Center(child: Text("Home",
          style: TextStyle(color: Colors.blueAccent,
              fontSize: 25,
              fontWeight: FontWeight.bold
          ),)),
        actions: [IconButton(onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Login()));
        }, icon: Icon(Icons.exit_to_app, color: Colors.blueAccent, size: 30,))
        ],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('image/doc.png'),
              radius: 35,
            ),
            SizedBox(height: 10,),
            Text('Good Morning,',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 34),),
            Text('Rn. Nurse Name',
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 34),),
            SizedBox(height: 15,),
            Text('You have the following upcoming patients today',
              style: TextStyle(fontSize: 20),),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Doctor_patient()));
              },
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('image/doc.png'),
                          radius: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 58.0),
                        child: Text('Ahmed Khalid', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blueAccent
                        ),),
                      ),
                      Text('${now.hour}:${now.minute}', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.blueAccent
                      ),),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 0.1,
                      spreadRadius: 0.0,
                      offset: Offset(
                          0.0, 1.0), // shadow direction: bottom right
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            GestureDetector(
              onTap: () {},
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('image/doc.png'),
                          radius: 30,
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right: 58.0),
                        child: Text('Ahmed Khalid', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blueAccent
                        ),),
                      ),

                      Text('${now.hour}:${now.minute}', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.blueAccent
                      ),),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 0.1,
                      spreadRadius: 0.0,
                      offset: Offset(
                          0.0, 1.0), // shadow direction: bottom right
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            GestureDetector(
              onTap: () {},
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('image/doc.png'),
                          radius: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 58.0),
                        child: Text('Ahmed Khalid', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blueAccent
                        ),),
                      ),
                      Text('${now.hour}:${now.minute}', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.blueAccent
                      ),),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 0.1,
                      spreadRadius: 0.0,
                      offset: Offset(
                          0.0, 1.0), // shadow direction: bottom right
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Doctor_patient()));
              },
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 5.0),
                        child: CircleAvatar(
                          backgroundImage: AssetImage('image/doc.png'),
                          radius: 30,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 58.0),
                        child: Text('Ahmed Khalid', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blueAccent
                        ),),
                      ),
                      Text('${now.hour}:${now.minute}', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.blueAccent
                      ),),
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 0.1,
                      spreadRadius: 0.0,
                      offset: Offset(
                          0.0, 1.0), // shadow direction: bottom right
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }

}
