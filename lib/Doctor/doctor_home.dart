import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/Doctor/patient_doctor_med.dart';
import 'package:hospital/Doctormodel.dart';
import 'package:hospital/Network/dio/repo.dart';
import 'package:hospital/Network/dio/web.dart';
import 'package:hospital/patient/pModel.dart';

import '../DShuadle.dart';
import '../constant.dart';
import '../login.dart';

class Doc_home extends StatefulWidget {
  const Doc_home({Key? key}) : super(key: key);

  @override
  State<Doc_home> createState() => _Doc_homeState();
}

class _Doc_homeState extends State<Doc_home> {
  String ? name;
  List<dynamic>? patient_id=[];
String?k;

  @override
  void initState() {

    super.initState();
    getalldoc2();
    getalldoc1();

  }

  @override
  Widget build(BuildContext context) {

    var now = DateTime.now();
    return FutureBuilder(
        future: getalldoc2(),
        builder: (context, dynamic) =>
            Scaffold(
              appBar: AppBar(
                leading: GestureDetector(
                    onTap: () {},
                    child: Icon(Icons.local_hospital, color: Colors.blueAccent,
                      size: 30,)),
                title: Center(child: Text("Home",
                  style: TextStyle(color: Colors.blueAccent,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),)),
                actions: [IconButton(onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                    icon: Icon(
                      Icons.exit_to_app, color: Colors.blueAccent, size: 30,))
                ],
                backgroundColor: Colors.transparent,
                elevation: 0,
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage('image/doc.png'),
                        radius: 35,
                      ),
                      SizedBox(height: 10,),
                      Text('Good Morning,', style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 34),),
                      Text('Dr.$name', style: TextStyle(
                          fontWeight: FontWeight.w400, fontSize: 34),),
                      SizedBox(height: 15,),
                      Text('You have the following upcoming patients today',
                        style: TextStyle(fontSize: 20),),
                      SizedBox(height: 20,),

                      ListView.separated(


                          shrinkWrap: true,

                          itemBuilder: (BuildContext context,index){


                        return GestureDetector(
                          onTap: () {
                            pid=doc1![index].patientID.toString();
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Doctor_patient()));
                            print(pid);
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

                                  Text(doc1![index].patientID.toString(), style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.blueAccent
                                  ),),

                                  Text('${now.hour}:${now.minute}',
                                    style: TextStyle(
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
                        );
                      },
                          separatorBuilder: (context,index){
                        return SizedBox(height: 15,);
                          },
                          itemCount: doc1!.length
                      )



                    ],
                  ),
                ),
              ),
            )
    );
  }

  List<Shu>?doc1 = [];

  List<Dlog>?doc = [];

  late repo r = api();

  get all {
    return doc;
  }

  get all1 {
    return doc1;
  }


  Future<void> getalldoc1() async {
    List?list3 = await r.getAll(Doctor_url);
    doc!.addAll(list3!.map((e) => Dlog.fromJson(e)).toList());
    print(doc);
    for (int i = 0; i < doc!.length; i++) {
      if (doc![i].sId == id) {
        print(doc![i].fullName);
        name = doc![i].fullName;
      }
      print(doc![i].sId);
    }
  }

  Future<void> getalldoc2() async {
    List?list3 = await r.getAll('https://stark-lake-52973.herokuapp.com/dpatient/schedule/'+id.toString());
    doc1!.addAll(list3!.map((e) => Shu.fromJson(e)).toList());

    for(int i=0;i<doc1!.length;i++){

      patient_id!.add(doc1![i].patientID.toString());
    }
print(id);

  }





}
