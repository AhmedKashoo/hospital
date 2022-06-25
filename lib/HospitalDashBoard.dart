import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/MedicalRecord.dart';
import 'package:hospital/nurse.dart';
import 'package:hospital/patient.dart';

import 'components/components.dart';
import 'doctor.dart';

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
                                    child: Text('250',style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.w500),),
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
                                    child: Text('250',style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.w500),),
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
                                    child: Text('250',style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.w500),),
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
                                    child: Text('250',style: TextStyle(color: Colors.blue.shade900,fontWeight: FontWeight.w500),),
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
                            Text('250',style: TextStyle(fontWeight: FontWeight.w500,color: Colors.blue.shade900,fontSize: 15)),



                          ],

                        ),
                      ),


                    ),


                  ],

                ),

              ),
            )



          ],
        ),
      ),
    );
  }
}