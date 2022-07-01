import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/Network/dio/repo.dart';
import 'package:hospital/Network/dio/web.dart';
import 'package:hospital/components/my_flutter_app_icons.dart';
import 'package:hospital/patient/chat4.dart';
import 'package:hospital/patient/chat_patient.dart';
import 'package:hospital/patient/patient%20med.dart';

import '../constant.dart';
import '../findModel.dart';
import '../login.dart';
import 'pModel.dart';

class Patient_home extends StatefulWidget {

  const Patient_home( {Key? key}) : super(key: key);


  @override
  State<Patient_home> createState() => _Patient_homeState();
}

class _Patient_homeState extends State<Patient_home> {
  int ? len;
   String ?name;
   String? blod;
   int? weight ;
   int ?height;
   String ?date;
   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getallmed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: (){},
            child: Icon(Icons.local_hospital,color: Colors.blueAccent,size: 30,)),
        title: Center(child: Text("Home",
          style: TextStyle(color: Colors.blueAccent,fontSize: 25,fontWeight: FontWeight.bold
        ),)),
        actions: [IconButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
        }, icon: Icon(Icons.exit_to_app,color: Colors.blueAccent,size: 30,))],
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
              onTap: () async{
                ////////////////

                  getallpat1();
                 await Navigator.push(context, MaterialPageRoute(builder: (context)=>s()));

              },
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
              onTap: (){
                setState(() {
                  var date=DateTime.parse(med![med!.length-1.toInt()].nextAppointment.toString());
                  getallmed();
                  showDialog(context: context, builder: (context){
                    return AlertDialog(
                      title: Text("Your next appointment on  ",
                        style: TextStyle(fontSize: 20,color: Colors.blueAccent,fontWeight: FontWeight.bold),),
                      content: Text(date.toLocal().toString(),
                        style: TextStyle(fontSize: 20,color: Colors.blueAccent,fontWeight: FontWeight.bold),),
                      actions: [
                        TextButton(onPressed: (){  Navigator.pop(context, 'Cancel');},
                            child: Text('OK'))
                      ],
                    );
                  });
                });

              },
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
              onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Chat4()));},
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

  List<plog>?pat=[];
  late repo r=api();
  get all{
    return pat;

  }
  Future<void>getallpat1()async {
    List?list1 = await r.getAll(patient_url);
    pat!.addAll(list1!.map((e) => plog.fromJson(e)).toList());
    print(pat);
    for (int i = 0; i < pat!.length; i++) {
      if (pat![i].sId==id ) {
print(pat![i].fullName);
        blod= pat![i].bloodType!;
        name= pat![i].fullName!;
        height= pat![i].height!;
        weight= pat![i].weight!;
        date= pat![i].birthDate!;
      }
      print(pat![i].sId);
    }
  }
   List<FindMedic>?med=[];
   get allmed{
     return med;

   }
   Future<void>getallmed()async {
     List?list1 = await r.getAll("https://stark-lake-52973.herokuapp.com/medicalrecord/"+id.toString());
     med!.addAll(list1!.map((e) => FindMedic.fromJson(e)).toList());

     print(med!.length);
     print(med![0].nextAppointment);

     len=med!.length;
   }

}
