import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/Doctor/patient_doctor_med.dart';
import 'package:hospital/Network/dio/repo.dart';
import 'package:hospital/Network/dio/web.dart';
import 'package:hospital/Nurse/patient_nurse.dart';
import 'package:hospital/Nurse/shunur.dart';

import '../DShuadle.dart';
import '../NurseModel.dart';
import '../constant.dart';
import '../login.dart';
import 'Nurse_shu.dart';
class Nurse extends StatefulWidget {
  const Nurse({Key? key}) : super(key: key);

  @override
  State<Nurse> createState() => _NurseState();
}

class _NurseState extends State<Nurse> {
  List<dynamic>? patient_id=[];
  String? name;
  @override
  void initState() {

    super.initState();
    getallnur1() ;
    getalldoc2();
    getalldoc3();
  }
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    return  FutureBuilder(
        future:getalldoc2() ,
        builder: (context,dynamic)=>Scaffold(
          appBar: AppBar(
            leading: GestureDetector(
                onTap: () {
                  Dialog  errorDialog=Dialog(
                      elevation: 3,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.blue,width: 2)
                      ),
                      child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            height: 120.0,
                            width: 700.0,
                            child: ListView.separated(
                                itemBuilder: (context,index){
                                  return Column(
                                    children: [
                                      Text("your Work Shedule is :",style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18),),
                                      SizedBox(height: 3,),
                                      Text("your Work  from : "+Shunur![index].from.toString(),style: TextStyle(fontWeight:FontWeight.bold)),
                                      SizedBox(height: 3,),
                                      Text("your Work  to : "+Shunur![index].to.toString(),style: TextStyle(fontWeight:FontWeight.bold)),
                                      SizedBox(height: 3,),
                                      Text("your Work  day is : ",style: TextStyle(fontWeight:FontWeight.bold)),
                                      SizedBox(height: 3,),
                                      Text(Shunur![index].day.toString(),style: TextStyle(fontWeight:FontWeight.bold))
                                    ],
                                  );
                                },
                                separatorBuilder:(context,index){return SizedBox(height: 10);},
                                itemCount: Shunur!.length
                            ),
                          )
                      )

                  );
                  showDialog(context: context, builder: (BuildContext context) => errorDialog);
                },
                child: Icon(Icons.document_scanner, color: Colors.blueAccent,
                  size: 30,)),
            title: Center(child: Text("Home",
              style: TextStyle(color: Colors.blueAccent,fontSize: 25,fontWeight: FontWeight.bold
              ),)),
            actions: [IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
            }, icon: Icon(Icons.exit_to_app,color: Colors.blueAccent,size: 30,))],
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
                  Text('Good Morning,',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 34),),
                  Text('Rn.$name',style: TextStyle(fontWeight: FontWeight.w400,fontSize: 34),),
                  SizedBox(height: 15,),
                  Text('You have the following upcoming patients today',style: TextStyle(fontSize: 20),),
                  SizedBox(height: 20,),
                  ListView.separated(
                    physics: const ScrollPhysics(),

                      shrinkWrap: true,

                      itemBuilder: (BuildContext context,index){


                        return GestureDetector(
                          onTap: () {
                            pid=nur1![index].patientID.toString();
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Nurse_pat()));
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

                                  Text(nur1![index].patientID.toString(), style: TextStyle(
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
                      itemCount: nur1!.length
                  ),

                ],
              ),
            ),
          ),
        )
    );

  }
  List<Nlog>?nur=[];
  List<shuNur>?Shunur=[];
  List<NShu>?nur1 = [];
  late repo r=api();
  get all{
    return nur;

  }
  get all2{
    return Shunur;

  }
  get alln{
    return nur1;

  }
  Future<void>getallnur1()async {
    List?list4 = await r.getAll(Nurse_url);
    nur!.addAll(list4!.map((e) => Nlog.fromJson(e)).toList());
    print(nur);
    for (int i = 0; i < nur!.length; i++) {
      if (nur![i].sId==id ) {
        print(nur![i].fullName);
        name=nur![i].fullName;

      }
      print(nur![i].fullName);
    }
  }
  Future<void> getalldoc2() async {
    List?list3 = await r.getAll('https://stark-lake-52973.herokuapp.com/npatient/schedule/'+id.toString());
    nur1!.addAll(list3!.map((e) => NShu.fromJson(e)).toList());

    for(int i=0;i<nur1!.length;i++){

      patient_id!.add(nur1![i].patientID.toString());
      print(nur1![i].patientID.toString());
    }
  }

  Future<void> getalldoc3() async {
    List?list4 = await r.getAll(
        'https://stark-lake-52973.herokuapp.com/nurseschedule/'+id.toString());
    Shunur!.addAll(list4!.map((e) => shuNur.fromJson(e)).toList());
    print(Shunur![0].from);



  }
}


