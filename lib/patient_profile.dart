import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/constant.dart';
import 'package:hospital/patient/pModel.dart';
import 'package:image_picker/image_picker.dart';
import 'Network/dio/repo.dart';
import 'Network/dio/web.dart';
import 'components/components.dart';
import 'medModel.dart';
import 'package:http/http.dart'as http;


class patient_profile extends StatefulWidget {
  const patient_profile({Key? key}) : super(key: key);

  @override
  State<patient_profile> createState() => _patient_profileState();

}

class _patient_profileState extends State<patient_profile> {

  Future<void> take()async{
    final ImageFile =await ImagePicker.platform.pickImage(source: ImageSource.camera);
  }
  Future<void> takeG()async{
    final ImageFile =await ImagePicker.platform.pickImage(source: ImageSource.gallery);
  }
  Future<void>d()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();

  }
  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();
  var notecontroll = TextEditingController();

String?name;
String?phone;
String?id;
String?Address;
String?ginder;
String?blodtype;
  Color c = const Color.fromARGB(232, 234, 245, 245);
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getpatin();
  }
    @override
    Widget build(BuildContext context) {
      return FutureBuilder(
        future: getpatin(),
        builder: (context,dynamic)=> Scaffold(
          key: scaffoldkey,
          backgroundColor: c,
          appBar: AppBar(
            title: Padding(
              padding: const EdgeInsets.only(right: 50.0),
              child: Center(child: (Text('Patient Profile'))),
            ),
            backgroundColor: Colors.blue.shade800,
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue.shade900),

                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22)
                    ),
                    height: 180,
                    width: 300,
                    child: Column(
                      children: [
                        CircleAvatar(
                            radius: 32,
                            backgroundImage: AssetImage('image/nurse.jpg',)
                        ),
                        SizedBox(
                          height: 10,
                        ),

                        Text(name.toString(), style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.blue.shade900),),
                        SizedBox(
                          height: 10,
                        ),
                        Text(phone.toString(), style: TextStyle(
                            fontSize: 15, color: Colors.blue.shade900),),

                        SizedBox(
                          height: 10,
                        ),
                        Text(id.toString(), style: TextStyle(
                            fontSize: 15, color: Colors.blue.shade900),),


                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(

                        border: Border.all(color: Colors.blue.shade900),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22)
                    ),
                    height: 160,
                    width: 300,
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                          Text('City  : ' +Address.toString(), style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.blue.shade900),),

                          SizedBox(
                            height: 10,
                          ),

                          Text('Age  : 22', style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.blue.shade900),),
                          SizedBox(
                            height: 10,
                          ),
                          Text('Gender  :'+ginder.toString(), style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.blue.shade900),),
                          SizedBox(
                            height: 10,
                          ),
                          Text('blood type  :  '+blodtype.toString(), style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.blue.shade900),),


                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: button(
                  text: 'Add Medical Record',
                  function: () {
                    scaffoldkey.currentState
                        ?.showBottomSheet(
                            (context) =>
                            Form(
                              key: formkey,
                              child: StatefulBuilder(
                                builder: (BuildContext context,
                                    StateSetter setbotstate) =>
                                    Container(
                                      color: c,
                                      padding: EdgeInsets.all(20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          form(
                                              controlled_text: notecontroll,
                                              text: 'Add Note',
                                              prefix_icon: Icons
                                                  .system_update_alt_rounded,
                                              input_type: TextInputType.text),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Center(child: Text('Add File',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),)),
                                          Center(
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                Center(child: IconButton(onPressed: (){take();}, icon:Icon(Icons.camera_alt),iconSize: 30,color: Colors.blue.shade900,)),
                                                Container(height: 20,width: 2,color: Colors.black,),
                                                Center(child: IconButton(onPressed: (){takeG();}, icon:Icon(Icons.camera),iconSize: 30,color: Colors.blue.shade900,)),
                                                Container(height: 20,width: 2,color: Colors.black,),
                                                Center(child: IconButton(onPressed: (){d();}, icon:Icon(Icons.file_copy),iconSize: 30,color: Colors.blue.shade900,)),


                                              ],
                                            ),
                                          ),

                                          SizedBox(
                                            height: 10,
                                          ),

                                          SizedBox(
                                            height: 10,
                                          ),

                                          SizedBox(
                                            height: 10,
                                          ),

                                          button(
                                              text: 'Apply',
                                              color: Colors.blue.shade800,
                                              function: ()async {
                                                http.Response response=await http.post(Uri.parse("https://stark-lake-52973.herokuapp.com/medicalrecord/"),headers: {"Content-type": "application/json"},
                                                    body: jsonEncode(
                                                      {
                                                        "_id": "62b783753420c7f36d789ac9",
                                                        "day": "2022-07-02T00:00:00.000Z",
                                                        "examination": false,
                                                        "prescription": "pandolExtra",
                                                        "dose": 2,
                                                        "period": "breakfast,dinner",
                                                        "nextAppointment": "2022-07-06T00:00:00.000Z",
                                                        "note": notecontroll.text,
                                                        "doctorID": "d33956741876655",
                                                        "patientID": pid.toString(),
                                                        "expired": false,
                                                        "__v": 0
                                                      },

                                                    ));
                                                print(response.body);
                                                Navigator.pop(context);
                                              })
                                        ],
                                      ),
                                    ),
                              ),
                            ),
                        elevation: 15
                    );
                  },
                  color: Colors.blue.shade900,
                ),
              )


            ],
          ),
        ),
      );
    }
  List<plog>?pin=[];
  late repo r=api();
  get all{
    return pin;

  }
  Future<void>getpatin()async {
    List?list1 = await r.getAll(patient_url);
    pin!.addAll(list1!.map((e) => plog.fromJson(e)).toList());
    for (int i = 0; i < pin!.length; i++) {
      if (pin![i].sId==pid ) {
        print(pin![i].fullName);
        blodtype= pin![i].bloodType!;
        name= pin![i].fullName!;
        ginder= pin![i].gender!;
        phone= pin![i].phone!;
        id= pin![i].sId!;
        Address= pin![i].address!;
      }
    }


  }

  }

