import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/components/my_flutter_app_icons.dart';
import 'package:hospital/patient/chat_patient.dart';

class Patient_home extends StatefulWidget {
  const Patient_home({Key? key}) : super(key: key);

  @override
  State<Patient_home> createState() => _Patient_homeState();
}

class _Patient_homeState extends State<Patient_home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Icon(Icons.local_hospital,color: Colors.blueAccent,size: 30,),
        title: Center(child: Text("Home",
          style: TextStyle(color: Colors.blueAccent,fontSize: 25,fontWeight: FontWeight.bold
        ),)),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.exit_to_app,color: Colors.blueAccent,size: 30,))],
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15,),
            Center(
              child: Container(
                width: 300,
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Expanded(child: Image(image: AssetImage('image/4003790.png'),height: 100,width: 120,)),
                    Expanded(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Text('Now With Our App',style: TextStyle(
                              fontSize: 20,
                              color: Colors.white
                            ),),
                          ),
                          Text('you can access to your medical record easily',style: TextStyle(
                            color: Colors.white,
                            height: 1.5
                          ),)
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 28),
              child: Text('Our Features',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w900,
                color: Colors.grey.shade600
              ),),
            ),
            SizedBox(height: 15,),
            GestureDetector(
              onTap: (){},
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.assignment,size: 40,color: Colors.white,),
                          ),
                        decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      SizedBox(width: 10,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Your Medical Records',style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.blueAccent
                          ),),
                          Text('All Your Medical Records Are Here',style: TextStyle(
                              fontSize: 15,
                              color: Colors.blueAccent
                          ),),
                        ],
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 1.0,
                      spreadRadius: 0.0,
                      offset: Offset(1.0, 1.0), // shadow direction: bottom right
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 25,),
            GestureDetector(
              onTap: (){},
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(Icons.update_outlined,size: 40,color: Colors.white,),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      SizedBox(width: 10,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Your Next Appointment',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.blueAccent
                          ),),
                          Text('Remember Your Next Appointment',style: TextStyle(
                              fontSize: 15,
                              color: Colors.blueAccent
                          ),),
                        ],
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 1.0,
                      spreadRadius: 0.0,
                      offset: Offset(1.0, 1.0), // shadow direction: bottom right
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 25,),
            GestureDetector(
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Patient_Chat()));},
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(Icons.chat,size: 40,color: Colors.white,),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.pink,
                            borderRadius: BorderRadius.circular(10)
                        ),
                      ),
                      SizedBox(width: 10,),
                      Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Chatting',style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.blueAccent
                          ),),
                          Text('Talk With Your Doctor',style: TextStyle(
                              fontSize: 15,
                              color: Colors.blueAccent
                          ),),
                        ],
                      )
                    ],
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 1.0,
                      spreadRadius: 0.0,
                      offset: Offset(1.0, 1.0), // shadow direction: bottom right
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
