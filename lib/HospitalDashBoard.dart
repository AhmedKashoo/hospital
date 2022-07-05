import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/MedicalRecord.dart';
import 'package:hospital/donation.dart';
import 'package:hospital/nurse.dart';
import 'package:hospital/patient.dart';
import 'package:hospital/patient/pModel.dart';

import 'Doctormodel.dart';
import 'Network/dio/repo.dart';
import 'Network/dio/web.dart';
import 'NurseModel.dart';
import 'components/components.dart';
import 'constant.dart';
import 'doctor.dart';

class HospitalDashBoard extends StatefulWidget {
  const HospitalDashBoard({Key? key}) : super(key: key);

  @override
  _HospitalDashBoardState createState() => _HospitalDashBoardState();
}

class _HospitalDashBoardState extends State<HospitalDashBoard> {
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  Color c = const Color.fromARGB(232,234,245,245);
  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: getallnur1(),
        builder: (context,dinamic){
          return Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(300)),
            child: Scaffold(
              backgroundColor: c,
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:15,top: 15,bottom: 10),
                    child: Text('DashBoard',style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.w500,fontSize: 32),),
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
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>doctor()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    border:Border.all(color: Colors.blue.shade900)
                                ),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image(image: AssetImage('image/doclogo.png',),height: 40,width: 40,),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10.0),
                                          child: Text('Doctors',style: TextStyle(color: Colors.blue.shade900,fontSize: 22,fontWeight: FontWeight.w600),),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10.0),
                                          child: Text(d.length.toString(),style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.w500),),
                                        )
                                      ],
                                    ),


                                  ],
                                ),
                              ),
                            ),
                          )),
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>nursing()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    border:Border.all(color: Colors.blue.shade900)
                                ),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image(image: AssetImage('image/nurse.jpg',),height: 40,width: 40,),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10.0),
                                          child: Text('Nurse',style: TextStyle(color: Colors.blue.shade900,fontSize: 22,fontWeight: FontWeight.w600),),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10.0),
                                          child: Text(n.length.toString(),style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.w500),),
                                        )
                                      ],
                                    ),


                                  ],
                                ),
                              ),
                            ),
                          )),


                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>patient()));

                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    border:Border.all(color: Colors.blue.shade900)
                                ),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image(image: AssetImage('image/patient1.png',),height: 40,width: 40,),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10.0),
                                          child: Text('Patient',style: TextStyle(color: Colors.blue.shade900,fontSize: 22,fontWeight: FontWeight.w600),),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10.0),
                                          child: Text(pat!.length.toString(),style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.w500),),
                                        )
                                      ],
                                    ),


                                  ],
                                ),
                              ),
                            ),
                          )),
                      Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchPage()));

                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.white,
                                    border:Border.all(color: Colors.blue.shade900)
                                ),

                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image(image: AssetImage('image/patient.png',),height: 40,width: 40,),
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 10.0),
                                          child: Text('Record',style: TextStyle(color: Colors.blue.shade900,fontSize: 22,fontWeight: FontWeight.w600),),
                                        ),
                                        Spacer(),
                                        Padding(
                                          padding: const EdgeInsets.only(right: 10.0),
                                          child: Text(pat!.length.toString(),style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.w500),),
                                        )
                                      ],
                                    ),


                                  ],
                                ),
                              ),
                            ),
                          )),


                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>donation()));
                      },
                      child: Container(

                        height: 80,

                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue.shade900),

                            borderRadius: BorderRadius.circular(15),

                            color: Colors.white

                        ),

                        child:   Row(

                          children: [

                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child:
                              Image(image: AssetImage('image/blood.png',),height: 40,width: 40,),

                            ),

                            SizedBox(width: 8,),

                            Expanded(

                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 22 ),
                                child: Column(

                                  crossAxisAlignment:CrossAxisAlignment.start ,
                                  mainAxisAlignment: MainAxisAlignment.end,

                                  children: [

                                    Text('Blood Donation',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 20,color: Colors.blue.shade900)
                                      ,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                    Text(m!.length.toString(),style: TextStyle(fontWeight: FontWeight.w500,color: Colors.blue.shade900,fontSize: 15)),



                                  ],

                                ),
                              ),


                            ),


                          ],

                        ),

                      ),
                    ),
                  )



                ],
              ),
            ),
          );
        }
    );
  }
  List<Nlog>?nur2 = [];
  late repo r = api();

  get all {
    return nur2;
  }

  List<Nlog>n = [];
  get all2{
    return doc2;

  }

  Future<void> getallnur1() async {
    List?list3 = await r.getAll(Nurse_url);
    nur2!.addAll(list3!.map((e) => Nlog.fromJson(e)).toList());
    for (int i = 0; i < nur2!.length; i++) {
      if (nur2![i].hospitalID == id) {
        n.add(nur2![i]);
      }
    }
    List?list1 = await r.getAll(patient_url);
    pat!.addAll(list1!.map((e) => plog.fromJson(e)).toList());
    List?list4 = await r.getAll(Doctor_url);
    doc2!.addAll(list4!.map((e) => Dlog.fromJson(e)).toList());
    for (int i = 0; i < doc2!.length; i++) {
      if (doc2![i].hospitalID == id) {
        d.add(doc2![i]);
      }
    }
    for (int i = 0; i < pat!.length; i++) {
      if (pat![i].donate == true) {
        print(pat?[i].sId);
        m!.add(pat![i]);
      }

    }
  }
  List<Dlog>?doc2=[];

  List<Dlog>d=[];

  List<plog>?pat=[];
  List<plog>?m=[];

  get all3{
    return pat;

  }


}
