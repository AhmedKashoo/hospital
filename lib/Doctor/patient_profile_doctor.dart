import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/components/components.dart';
import 'package:image_picker/image_picker.dart';

class patient_profile_doctor extends StatefulWidget {
  const patient_profile_doctor({Key? key}) : super(key: key);

  @override
  State<patient_profile_doctor> createState() => _patient_profileState();
}

class _patient_profileState extends State<patient_profile_doctor> {
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
  var namecontroll = TextEditingController();


  Color c = const Color.fromARGB(232, 234, 245, 245);

    @override
    Widget build(BuildContext context) {
      return Scaffold(
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

                      Text('Patient Name', style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.blue.shade900),),
                      SizedBox(
                        height: 10,
                      ),
                      Text('0100400061', style: TextStyle(
                          fontSize: 15, color: Colors.blue.shade900),),

                      SizedBox(
                        height: 10,
                      ),
                      Text('Patient Name@gmal.com', style: TextStyle(
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
                        Text('City  :  Dahab', style: TextStyle(
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
                        Text('Gender  :  Male', style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.blue.shade900),),
                        SizedBox(
                          height: 10,
                        ),
                        Text('blood type  :  ِِAB+', style: TextStyle(
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
                                            controlled_text: namecontroll,
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
                                            function: () {
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
      );
    }
  }

