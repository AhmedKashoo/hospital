import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/Doctor/doctor_home.dart';
import 'package:hospital/Doctor/patient_profile_doctor.dart';
import 'package:hospital/patient/home.dart';
import 'package:timelines/timelines.dart';

class Doctor_patient extends StatefulWidget {

  const Doctor_patient({Key? key}) : super(key: key);

  @override
  State<Doctor_patient> createState() => _sState();
}

class _sState extends State<Doctor_patient> {


  int details = 0;
  int evaluation = 0;
  int x=0;
  List<Image> images = [
   Image.asset("image/xray.jpg",) ,
    Image.asset("image/xray.jpg",),
    Image.asset("image/xray.jpg",)
  ];


  Widget showProduct () {
    if (details == 1 && evaluation == 0&&x==0) {
      details = 0;
      return FixedTimeline.tileBuilder(
        mainAxisSize: MainAxisSize.max,

        builder: TimelineTileBuilder.connectedFromStyle(
          firstConnectorStyle: ConnectorStyle.solidLine,
          contentsAlign: ContentsAlign.alternating,
          oppositeContentsBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('10:00 AM',style: TextStyle(color:Colors.cyanAccent.shade400,),),
          ),
          contentsBuilder: (context, index) => Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Card(



                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,


                        children: [
                          Text("Heart Check",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 18),),
                          SizedBox(height: 3,),
                          Text('this is describtion heart ',style: TextStyle(color: Colors.black26,),),
                          SizedBox(height: 3,),
                          Text("Documents",style: TextStyle(color: Colors.cyanAccent.shade400,fontWeight: FontWeight.bold,fontSize: 18),),
                          SizedBox(height: 3,),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset("image/xray.jpg",width: 40,height: 40,) ,
                                SizedBox(width: 3,),
                                Image.asset("image/xray.jpg",width: 30,height: 30,) ,
                                SizedBox(width: 3,),
                                Image.asset("image/xray.jpg",width: 40,height: 40,) ,
                                SizedBox(width: 3,),
                              ],
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          connectorStyleBuilder: (context, index) => ConnectorStyle.solidLine,
          indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
          itemExtent: 180.0,
          itemCount: 3,
        ),
      );
    }
    else if (evaluation == 1 && details == 0&&x==0) {
      evaluation = 0;
      return Container (
          child: FixedTimeline.tileBuilder(
            mainAxisSize: MainAxisSize.max,

            builder: TimelineTileBuilder.connectedFromStyle(
              firstConnectorStyle: ConnectorStyle.solidLine,
              contentsAlign: ContentsAlign.alternating,
              oppositeContentsBuilder: (context, index) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('10:00 AM',style: TextStyle(color:Colors.cyanAccent.shade400,),),
              ),
              contentsBuilder: (context, index) => Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Card(



                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,


                            children: [
                              Text("Heart Check",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 18),),
                              SizedBox(height: 3,),
                              Text('this is describtion heart ',style: TextStyle(color: Colors.black26,),),
                              SizedBox(height: 3,),
                              Text("Documents",style: TextStyle(color: Colors.cyanAccent.shade400,fontWeight: FontWeight.bold,fontSize: 18),),
                              SizedBox(height: 3,),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,

                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Image.asset("image/xray.jpg",width: 40,height: 40,) ,
                                    SizedBox(width: 3,),
                                    Image.asset("image/xray.jpg",width: 30,height: 30,) ,
                                    SizedBox(width: 3,),
                                    Image.asset("image/xray.jpg",width: 40,height: 40,) ,
                                    SizedBox(width: 3,),
                                  ],
                                ),
                              )

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              connectorStyleBuilder: (context, index) => ConnectorStyle.solidLine,
              indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
              itemExtent: 180.0,
              itemCount: 3,
            ),
          )
      );
    }
    else if (evaluation == 0 && details == 0&&x==1) {
      evaluation = 0;
      return Container (
          child: Text('History',style: TextStyle(color: Colors.white),)
      );
    }
    return Container();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading:IconButton(color: Colors.blue,
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>Doc_home()));
          },
          icon: Icon(Icons.arrow_back),),
        title: Center(child: Text("Patient Profile",style: TextStyle(color: Colors.blue),)),
        actions: [
        IconButton(onPressed:(){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>patient_profile_doctor()));
        } ,icon: Icon(Icons.local_hospital),color: Colors.blueAccent,iconSize: 30,)
        ],
      ),
      body:ListView(

        children: [
          Stack(children: [
            Column(children: [
              Container(


                decoration: BoxDecoration(
                    color: Colors.blue.shade800,
                    borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight:Radius.circular(30))
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0,right: 30.0,bottom: 15,top: 15),
                        child: Row(

                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              radius: 30,
                              backgroundImage: AssetImage('image/doc.png'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 88.0),
                              child: Text('Ahmed Khalid',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20)),
                            ),

                            Icon(Icons.edit,color: Colors.white,)

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0,right: 16),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue.shade600
                                ),
                                child:Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.cyanAccent.shade400,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Center(child: Icon(Icons.bloodtype_outlined,color: Colors.white,size: 30,)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Blood',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),

                                            ),Container(height: 2 ,),Text('A+',style: TextStyle(color:Colors.blue.shade100),)],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(width: 8,),
                            Expanded(
                              child:Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue.shade600
                                ),
                                child:Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.cyanAccent.shade400,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Center(child: Icon(Icons.height,color: Colors.white,size: 30,)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Height',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),

                                            ),Container(height: 2 ,),Text('120 cm',style: TextStyle(color:Colors.blue.shade100),)],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0,right: 16,top: 12),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue.shade600
                                ),
                                child:Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.cyanAccent.shade400,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Center(child: Icon(Icons.monitor_weight_outlined,color: Colors.white,size: 30,)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Weight',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),

                                            ),Container(height: 2 ,),Text('120 Kg',style: TextStyle(color:Colors.blue.shade100),)],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(width: 8,),
                            Expanded(
                              child:Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue.shade600
                                ),
                                child:Padding(
                                  padding: const EdgeInsets.all(15.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          color: Colors.cyanAccent.shade400,
                                          borderRadius: BorderRadius.circular(8),
                                        ),
                                        child: Center(child: Icon(Icons.person_outline_outlined,color: Colors.white,size: 30,)),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Age',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18),

                                            ),Container(height: 2 ,),Text('20 years',style: TextStyle(color:Colors.blue.shade100),)],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),


                    ],
                  ),
                ) ,
              ),


            ],),
            Padding(
              padding: const EdgeInsets.only(top: 285.0),
              child: Container(
                width: screenSize.width,

                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(topLeft:Radius.circular(30),topRight:Radius.circular(30))
                  ),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween
                        ,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState((){
                                  evaluation = 0;
                                  x=0;
                                  details =1;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                  height: 35,
                                  width: 35,

                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade700,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(child: Text("History",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                                ),
                              ),
                            ),
                          ),

                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  details = 0;
                                  evaluation = 1;
                                  x=0;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                  height: 35,
                                  width: 35,

                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade700,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Center(child: Text("Tests",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  details = 0;
                                  evaluation = 0;
                                  x=1;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Container(
                                  height: 35,
                                  width: 35,

                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade700,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child:Center(child: Text("Medicine",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                                ),
                              ),
                            ),
                          ),


                        ],
                      ),
                      showProduct()


                    ],)




              ),
            ),








          ],)






        ],
      ),
    );
  }
}
