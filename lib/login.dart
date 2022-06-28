import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/Doctor/doctor_home.dart';
import 'package:hospital/Doctormodel.dart';
import 'package:hospital/HospitalHome.dart';
import 'package:hospital/LoginMode.dart';
import 'package:hospital/Network/dio/Dio_helper.dart';
import 'package:hospital/Nurse/Nurse.dart';
import 'package:hospital/NurseModel.dart';
import 'package:hospital/components/components.dart';
import 'package:hospital/patient.dart';
import 'package:hospital/patient/home.dart';
import 'package:hospital/patient/pModel.dart';


import 'HospitalDashBoard.dart';
import 'Network/Endpoints.dart';
import 'Network/dio/repo.dart';
import 'Network/dio/web.dart';
import 'constant.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var user = TextEditingController();
  var pass = TextEditingController();
  bool isvisible = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade800,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade800,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 18,left: 30),
              child: Text('Sign in',style: TextStyle(
                color: Colors.white,
                fontStyle: FontStyle.italic,
                fontSize: 45,
                fontWeight: FontWeight.bold
              ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 80.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius:BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                color: Colors.white,
              ),
              height: double.infinity,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Welcome back',style: TextStyle(
                            color: Colors.blue.shade800,
                            fontStyle: FontStyle.italic,
                            fontSize: 30,
                            fontWeight:FontWeight.w900
                        ),
                        ),

                        Text('Hello there, sign in to continue!',style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                            fontWeight: FontWeight.bold
                        ),
                        ),
                        SizedBox(height:40 ,),
                        Container(
                          height: 50,
                          child: form(
                            input_type: TextInputType.name,
                            text: 'User name',
                            controlled_text: user,
                            prefix_icon: Icons.person
                          ),

                        ),
                        SizedBox(height:20 ,),
                        Container(
                          height: 50,
                          child: form(
                              input_type: TextInputType.name,
                              text: 'Password',
                              controlled_text: pass,
                              prefix_icon: Icons.lock,
                               visible_function: (){
                                setState(() {
                                  isvisible = !isvisible;
                                });
                               },
                              suffix_icon: isvisible? Icons.visibility : Icons.visibility_off,
                              obscureText: isvisible,
                          ),
                        ),
                        SizedBox(height:15 ,),
                        Center(
                          child: Text('Forgot Password? Contact us',style: TextStyle(
                              color: Colors.blue.shade800,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic
                          ),
                          ),
                        ),
                        SizedBox(height:50 ,),
                        button(
                          isupper: true,
                            text: 'Sign in',
                            function: (){
                            String?user1=user.text.toString();
                              if(user1[0]=="H"||user1[0]=="h"){
                                getallHos();
                              }else if(user1[0]=="D"||user1[0]=="d"){
                                getalldoc();
                              }else if(user1[0]=="P"||user1[0]=="p"){
                                getallpat();
                              }else if(user1[0]=="N"||user1[0]=="n"){
                                getallnur();
                              }
                            }
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  /*late Autogenerated autogenerated;
  void f(){

    web().all().then((a){

      autogenerated=Autogenerated.fromJson(a[1]);

      print(autogenerated.sId.toString());
      print(autogenerated.password.toString());
      if(user.text==autogenerated.sId.toString()&&pass.text==autogenerated.password.toString()){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HospitalHome()));
      }

    });
  }

   */
  List<Autogenerated>?hos=[];
  List<Dlog>?doc=[];
  List<plog>?pat=[];
  List<Nlog>?nur=[];
  late repo r=api();
  get all{
    return hos;

  }
  get alldoc{
    return doc;

  }
  get allpat{
    return pat;

  }
  get allnur{
    return nur;

  }
  Future<void>getallHos()async{
    List?list=await r.getAll(user_url);
    hos!.addAll(list!.map((e) => Autogenerated.fromJson(e)).toList());
    print(hos);
    for(int i=0;i<hos!.length;i++){
      if(hos![i].sId==user.text&&hos![i].password==pass.text){
        id=user.text;
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HospitalHome()));
      }
      print(hos![i].sId);
    }


  }
  Future<void>getallpat()async {
    List?list1 = await r.getAll(patient_url);
    pat!.addAll(list1!.map((e) => plog.fromJson(e)).toList());
    print(pat);
    for (int i = 0; i < pat!.length; i++) {
      if (pat![i].sId == user.text && pat![i].password == pass.text) {
        id=user.text;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Patient_home()));

      }
      print(pat![i].sId);
    }
  }
  Future<void>getalldoc()async {
    List?list2 = await r.getAll(Doctor_url);
    doc!.addAll(list2!.map((e) => Dlog.fromJson(e)).toList());
    print(doc);
    for (int i = 0; i < doc!.length; i++) {
      if (doc![i].sId == user.text && doc![i].password == pass.text) {
        id=user.text;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Doc_home()));

      }
      print(doc![i].sId);
    }
  }
  Future<void>getallnur()async {
    List?list3 = await r.getAll(Nurse_url);
    nur!.addAll(list3!.map((e) => Nlog.fromJson(e)).toList());
    print(nur);
    for (int i = 0; i < nur!.length; i++) {
      if (nur![i].sId == user.text && nur![i].password == pass.text) {
        id=user.text;
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Nurse()));

      }
      print(nur![i].sId);
    }
  }
}
