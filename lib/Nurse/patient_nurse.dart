import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/Network/dio/repo.dart';
import 'package:hospital/Network/dio/web.dart';
import 'package:hospital/constant.dart';
import 'package:hospital/patient/home.dart';
import 'package:timelines/timelines.dart';

import '../findModel.dart';
import '../medModel.dart';

class Nurse_pat extends StatefulWidget {




  @override
  State<Nurse_pat> createState() => _Nurse_patState();
}

class _Nurse_patState extends State<Nurse_pat> {
  int ? len;
  String ?name;
  String? blod;
  int? weight ;
  int ?height;
  String ?date;


  int details = 0;
  int evaluation = 0;
  int x=0;
  List<Image> images = [
    Image.asset("image/xray.jpg",) ,
    Image.asset("image/xray.jpg",),
    Image.asset("image/xray.jpg",)
  ];


  Widget showMedicl () {
    if (  details == 0 ) {
      details = 0;
      return FixedTimeline.tileBuilder(
        mainAxisSize: MainAxisSize.max,

        builder: TimelineTileBuilder.connectedFromStyle(
          firstConnectorStyle: ConnectorStyle.solidLine,
          contentsAlign: ContentsAlign.alternating,
          oppositeContentsBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(med![index].day.toString(),style: TextStyle(color:Colors.cyanAccent.shade400,),),
          ),
          contentsBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Card(



                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,


                      children: [
                        Text(med![index].note.toString(),style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 18),),
                        SizedBox(height: 3,),
                        Text( med![index].period.toString(),style: TextStyle(color: Colors.black26,),),
                        SizedBox(height: 3,),
                        Text("Documents",style: TextStyle(color: Colors.cyanAccent.shade400,fontWeight: FontWeight.bold,fontSize: 18),),
                        SizedBox(height: 3,),

                        med![index].medicalPic ==null?Text("null") :
                        Image.network(med![index].medicalPic!.path.toString(),fit: BoxFit.fill,) ,


                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          connectorStyleBuilder: (context, index) => ConnectorStyle.solidLine,
          indicatorStyleBuilder: (context, index) => IndicatorStyle.dot,
          itemExtent: 180.0,
          itemCount:med!.length,
        ),
      );
    }
    else if ( details == 1) {
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
                              Text(med![index].prescription.toString(),style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 18),),
                              SizedBox(height: 3,),
                              Text(med![index].period.toString(),style: TextStyle(color: Colors.black26,),),
                              SizedBox(height: 3,),
                              Text(med![index].dose.toString(),style: TextStyle(color: Colors.cyanAccent.shade400,fontWeight: FontWeight.bold,fontSize: 18),),
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
              itemCount:med!.length,
            ),
          )
      );
    }
    return SingleChildScrollView(child: Container());
  }
  @override
  void initState() {

    super.initState();
    getallmed();


  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return FutureBuilder(
        future: getallpat1() ,
        builder: (context,dynamic)=> Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading:IconButton(color: Colors.blue,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Patient_home()));
              },
              icon: Icon(Icons.arrow_back),),
            title: Padding(
              padding: const EdgeInsets.only(right: 50.0),
              child: Center(child: Text("My Profile",style: TextStyle(color: Colors.blue),)),
            ),
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
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(name.toString(),style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
                                    Text('Ahmed Essam@gmail.com',style: TextStyle(color: Colors.blue.shade100),)
                                  ],
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

                                                ),Container(height: 2 ,),Text(blod.toString(),style: TextStyle(color:Colors.blue.shade100),)],
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

                                                ),Container(height: 2 ,),Text(height.toString(),style: TextStyle(color:Colors.blue.shade100),)],
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

                                                ),Container(height: 2 ,),Text(weight.toString(),style: TextStyle(color:Colors.blue.shade100),)],
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
                                      child: Center(child: Text("medicine",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                                    ),
                                  ),
                                ),
                              ),

                              Expanded(
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      details = 0;

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



                            ],
                          ),
                          med!.length==null? CircularProgressIndicator() :
                          showMedicl()


                        ],)




                  ),
                ),








              ],)






            ],
          ),
        )
    );
  }
  List<Medical>?pat=[];
  late repo r=api();
  get all{
    return pat;

  }
  List<FindMedic>?med=[];
  get allmed{
    return med;

  }
  Future<void>getallpat1()async {
    List?list1 = await r.getAll("https://stark-lake-52973.herokuapp.com/medicalrecord/");
    pat!.addAll(list1!.map((e) => Medical.fromJson(e)).toList());
    for (int i = 0; i < pat!.length; i++) {
      if (pat![i].sId==pid ) {
        print(pat![i].fullName);
        blod= pat![i].bloodType!;
        name= pat![i].fullName!;
        height= pat![i].height!;
        weight= pat![i].weight!;
        date= pat![i].birthDate!;

      }
    }


  }
  Future<dynamic> getallmed()async {
    List?list1 = await r.getAll("https://stark-lake-52973.herokuapp.com/medicalrecord/"+pid.toString());
    med!.addAll(list1!.map((e) => FindMedic.fromJson(e)).toList());

    print(med!.length);
    print(pid.toString());
    len=med!.length;
  }



}
