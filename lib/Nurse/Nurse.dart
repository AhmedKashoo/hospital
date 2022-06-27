import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/Doctor/patient_doctor_med.dart';
import 'package:hospital/Network/dio/repo.dart';
import 'package:hospital/Network/dio/web.dart';
import 'package:hospital/Nurse/patient_nurse.dart';

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
  }
  @override
  Widget build(BuildContext context) {
    var now = DateTime.now();
    return  FutureBuilder(
        future:getalldoc2() ,
        builder: (context,dynamic)=>Scaffold(
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
                )

              ],
            ),
          ),
        )
    );

  }
  List<Nlog>?nur=[];
  List<NShu>?nur1 = [];
  late repo r=api();
  get all{
    return nur;

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
}


