import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:full_screen_image_null_safe/full_screen_image_null_safe.dart';
import 'package:hospital/Network/dio/repo.dart';
import 'package:hospital/Network/dio/web.dart';
import 'package:hospital/components/components.dart';
import 'package:hospital/constant.dart';
import 'package:hospital/patient/home.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:timelines/timelines.dart';

import '../findModel.dart';
import '../medModel.dart';
import 'doctor_home.dart';
import 'package:http/http.dart'as http;


class Doctor_patient extends StatefulWidget {

  @override
  State<Doctor_patient> createState() => _Doctor_patientState();
}

class _Doctor_patientState extends State<Doctor_patient> {
 File? pikedImage;
  Future<void> take()async{
    final ImageFile =await ImagePicker.platform.pickImage(source: ImageSource.camera);
    setState(() {
      pikedImage = File(ImageFile!.path);
    });

  }

  Future<void> takeG()async{
    final ImageFile =await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      pikedImage = File(ImageFile!.path);
    });
  }
  Future<void>d()async{
    FilePickerResult? result = await FilePicker.platform.pickFiles();

  }
  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();
  var notecontroll = TextEditingController();
  var datecontroll = TextEditingController();
  var prescription = TextEditingController();
  var dose = TextEditingController();
  var period = TextEditingController();
  int ? len;
  String ?name;
  String? blod;
  int? weight ;
  Color c = const Color.fromARGB(232, 234, 245, 245);
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
                        FullScreenWidget(child: Container(height: 50,width: 50,
                            child: Image.network(med![index].medicalPic!.path.toString(),))) ,
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
          key: scaffoldkey,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading:IconButton(color: Colors.blue,
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Doc_home()));
              },
              icon: Icon(Icons.arrow_back),),
            title: Padding(
              padding: const EdgeInsets.only(right: 50.0),
              child: Center(child: Text("My Profile",style: TextStyle(color: Colors.blue),)),
            ),
            actions: [
              IconButton(color: Colors.blue,
                onPressed: (){
                  scaffoldkey.currentState
                      ?.showBottomSheet(
                          (context) =>
                          SingleChildScrollView(
                            child: Form(
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
                                          form(
                                              controlled_text:prescription,
                                              text: 'Add prescriptions',
                                              prefix_icon: Icons
                                                  .system_update_alt_rounded,
                                              input_type: TextInputType.text),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          form(
                                              controlled_text: period,
                                              text: 'Add period',
                                              prefix_icon: Icons
                                                  .system_update_alt_rounded,
                                              input_type: TextInputType.text),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          form(
                                              controlled_text: dose,
                                              text: 'Add dose',
                                              prefix_icon: Icons
                                                  .system_update_alt_rounded,
                                              input_type: TextInputType.number),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          form(
                                            controlled_text: datecontroll,
                                            text: 'Next Appointment',
                                            tap: () {
                                              showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(1960,8),
                                                  lastDate: DateTime.parse(
                                                      '2022-11-20'))
                                                  .then((value) {
                                                datecontroll.text =
                                                    DateFormat.yMMMd()
                                                        .format(value!);
                                              });
                                            },
                                            prefix_icon: Icons.calendar_today,
                                            input_type: TextInputType.datetime,
                                          ),
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

                                             await   onUploadImage();


                                                Navigator.pop(context);
                                              }
                                              )
                                        ],
                                      ),
                                    ),
                              ),
                            ),
                          ),
                      elevation: 15
                  );
                },
                icon: Icon(Icons.medical_services_sharp),),

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
                          med!.length==null?CircularProgressIndicator():
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
  Future<dynamic>getallmed()async {
    List?list1 = await r.getAll("https://stark-lake-52973.herokuapp.com/medicalrecord/"+pid.toString());
    med!.addAll(list1!.map((e) => FindMedic.fromJson(e)).toList());

    print(med!.length);
    len=med!.length;
  }


   onUploadImage() async {
   var request = http.MultipartRequest(
     'POST',
     Uri.parse("https://stark-lake-52973.herokuapp.com/medicalrecord/"),
   );
   Map<String, String> headers = {"Content-type": "multipart/form-data"};
   request.files.add(
     http.MultipartFile(
       'medicalPic',
       pikedImage!.readAsBytes().asStream(),
       pikedImage!.lengthSync(),
       filename: pikedImage!.path.split('/').last,
     ),

   );
  // request.fields["_id"]= "62b783753420c7f36d789ac9";
   request.fields[  "prescription"]= prescription.text;
   request.fields["dose"] =dose.text;
   request.fields["period"]= period.text;
   request.fields[  "nextAppointment"]= datecontroll.text;
   request.fields["note"]= notecontroll.text;
   request.fields["doctorID"]= id.toString();
   request.fields ["patientID"]= pid.toString();
   request.headers.addAll(headers);
   print("request: " + request.toString());
   var res = await request.send();
   http.Response response = await http.Response.fromStream(res);
   print(response.body);
   print(pikedImage!.path);
 }



/*Future<void>upload() async{
var stream=new http.ByteStream(pikedImage!.openRead());
stream.cast();
var length=await pikedImage!.length();
var url=Uri.parse("https://stark-lake-52973.herokuapp.com/medicalrecord/");
var request=new http.MultipartRequest('POST', url);
request.fields['patientID']="P29956741876655";
request.fields['note']="hello";
var multiport=new http.MultipartFile("medicalPic",
    stream,
    length
);
request.files.add(multiport);
var response=await request.send();
print(response.stream.toString());
if(response.statusCode==200){
  print("uploaded");
}else{
  print("fail uploaded");
}
}
*/

}
