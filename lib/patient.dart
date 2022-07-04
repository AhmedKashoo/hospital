import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/components/components.dart';
import 'package:hospital/constant.dart';
import 'package:hospital/patient/pModel.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart'as http;

import 'Network/dio/repo.dart';
import 'Network/dio/web.dart';


class patient extends StatefulWidget {
  const patient({Key? key}) : super(key: key);

  @override
  _patientState createState() => _patientState();

}

class _patientState extends State<patient> {
  String ?name;
  String? id;
  String?password;

  bool floatbot = false;
  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();
  var namecontroll = TextEditingController();
  var IDcontroll = TextEditingController();
  var datecontroll = TextEditingController();
  var height = TextEditingController();
  var weight = TextEditingController();
  var phone = TextEditingController();
  var pass = TextEditingController();
  var address = TextEditingController();
  String ?dropdownValue = null;
  String ?gender = null;
  String ?donate = null;
  var donater = false;
  @override
  void initState() {

    super.initState();

  }
  bool isvisible = true;
  Color c = const Color.fromARGB(232,234,245,245);
  late Color color;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {


    return FutureBuilder(future: getallpat2() ,
      builder: (context,dynamic)=>
          Scaffold(
            key: scaffoldkey,
            backgroundColor: c,
            appBar: AppBar(
              title: Padding(
                padding: const EdgeInsets.only(right: 50.0),
                child: Center(child: Text('Patient List',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),
              ),
              backgroundColor: Colors.blue.shade800,
            ),
            body: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SingleChildScrollView(
                  child: Center(
                    child: Column(
                        children: <Widget>[
                          SingleChildScrollView(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(headingRowColor:
                                MaterialStateColor.resolveWith((states) => Colors.blue.shade800),
                                    columns: [
                                  DataColumn(label: Text('Name',style: TextStyle(color: Colors.white),)),
                                  DataColumn(label: Text('password',style: TextStyle(color: Colors.white),)),
                                  DataColumn(label: Text('Id',style: TextStyle(color: Colors.white),)),
                                ], rows: pat!.map((e) => DataRow(
                                    selected: true,
                                    onSelectChanged: (value) {},
                                    cells: [
                                      DataCell(Container(child:
                                      Text(e.fullName.toString()),)),
                                      DataCell(Container(child:
                                      Text(e.password.toString()),)),
                                      DataCell(Container(child:
                                      Text(e.sId.toString()),)),
                                    ]
                                )).toList()
                                ),

                            ),

                          ),

                          Padding(
                            padding: const EdgeInsets.all( 8.0),
                            child: button(
                              text: 'Add Patient',
                              function: (){
                                scaffoldkey.currentState
                                    ?.showBottomSheet(
                                        (context)=>Form(
                                      key: formkey,
                                      child: StatefulBuilder(
                                        builder: (BuildContext context, StateSetter setbotstate)=>Container(
                                          color: c,
                                          padding: EdgeInsets.all(20),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                form(
                                                    controlled_text: namecontroll,
                                                    text: 'Name',
                                                    prefix_icon: Icons.person,
                                                    input_type: TextInputType.text),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                form(
                                                  input_type: TextInputType.name,
                                                  text: 'Password',
                                                  controlled_text: pass,
                                                  prefix_icon: Icons.lock,
                                                  visible_function: (){
                                                    setbotstate(() {
                                                      isvisible = !isvisible;
                                                    });
                                                  },
                                                  suffix_icon: isvisible? Icons.visibility : Icons.visibility_off,
                                                  obscureText: isvisible,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  height: 65,
                                                  decoration: BoxDecoration(
                                                    color: c,
                                                    border: Border.all(
                                                        width: 0.5
                                                    ),
                                                    borderRadius: BorderRadius.circular(15),

                                                  ),
                                                  child: DropdownButtonFormField<String>(
                                                    hint: Text('blood types'),
                                                    value: dropdownValue,
                                                    decoration: InputDecoration(
                                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),

                                                    ),
                                                    icon: const Icon(Icons.arrow_downward),
                                                    style: const TextStyle(color: Colors.black,fontSize: 18),
                                                    onChanged: (String? newValue) {
                                                      setbotstate(() {
                                                        dropdownValue = newValue!;
                                                      });
                                                    },
                                                    items: <String>[ 'A+', 'A-', 'B-','B+','AB+','AB-','O+','O-']
                                                        .map<DropdownMenuItem<String>>((String value) {
                                                      return DropdownMenuItem<String>(
                                                        value: value,
                                                        child: Text(value),
                                                      );
                                                    }).toList(),
                                                    //
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  height: 65,
                                                  decoration: BoxDecoration(
                                                    color: c,
                                                    border: Border.all(
                                                        width: 0.5
                                                    ),
                                                    borderRadius: BorderRadius.circular(15),

                                                  ),
                                                  child: DropdownButtonFormField<String>(
                                                    hint: Text('Gender'),
                                                    value: gender,
                                                    decoration: InputDecoration(
                                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),

                                                    ),
                                                    icon: const Icon(Icons.arrow_downward),
                                                    style: const TextStyle(color: Colors.black,fontSize: 18),
                                                    onChanged: (String? newValue) {
                                                      setbotstate(() {
                                                        gender = newValue!;
                                                      });
                                                    },
                                                    items: <String>[ 'Male', 'Female',]
                                                        .map<DropdownMenuItem<String>>((String value) {
                                                      return DropdownMenuItem<String>(
                                                        value: value,
                                                        child: Text(value),
                                                      );
                                                    }).toList(),
                                                    //
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  height: 65,
                                                  decoration: BoxDecoration(
                                                    color: c,
                                                    border: Border.all(
                                                        width: 0.5
                                                    ),
                                                    borderRadius: BorderRadius.circular(15),

                                                  ),
                                                  child: DropdownButtonFormField<String>(
                                                    hint: Text('Donate'),
                                                    value: donate,
                                                    decoration: InputDecoration(
                                                      border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),

                                                    ),
                                                    icon: const Icon(Icons.arrow_downward),
                                                    style: const TextStyle(color: Colors.black,fontSize: 18),
                                                    onChanged: (String? newValue) {
                                                      setbotstate(() {
                                                        donate = newValue!;
                                                      });
                                                    },
                                                    items: <String>[ 'Yes', 'No']
                                                        .map<DropdownMenuItem<String>>((String value) {
                                                      return DropdownMenuItem<String>(
                                                        value: value,
                                                        child: Text(value),
                                                      );
                                                    }).toList(),
                                                    //
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),

                                                form(
                                                  controlled_text: IDcontroll,
                                                  text: 'ID',
                                                  prefix_icon: Icons.perm_identity,
                                                  input_type: TextInputType.emailAddress,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                form(
                                                  controlled_text: datecontroll,
                                                  text: 'Birth Date',
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

                                                form(
                                                  controlled_text: height,
                                                  text: 'Height',
                                                  prefix_icon: Icons.height,
                                                  input_type: TextInputType.number,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                form(
                                                  controlled_text: weight,
                                                  text: 'Weight',
                                                  prefix_icon: Icons.line_weight,
                                                  input_type: TextInputType.number,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                form(
                                                  controlled_text: address,
                                                  text: 'Address',
                                                  prefix_icon: Icons.home_outlined,
                                                  input_type: TextInputType.streetAddress,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                form(
                                                  controlled_text: phone,
                                                  text: 'Phone Number',
                                                  prefix_icon: Icons.phone,
                                                  input_type: TextInputType.number,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),

                                                button(
                                                    text: 'Apply',
                                                    color: Colors.blue.shade800,
                                                    function: ()async{
                                                      if(donate=='Yes'){
                                                        donater =true;
                                                      }
                                                      print(dropdownValue);
                                                      http.Response response=await http.post(Uri.parse(patient_url),headers: {"Content-type": "application/json"},
                                                          body: jsonEncode({"_id":IDcontroll.text,"password":pass.text,"fullName":namecontroll.text,"bloodType":dropdownValue,"height":height.text,"weight":weight.text,"phone":phone.text,"birthDate":"1999-03-29T11:34:00.000Z","gender":gender,"address":address.text,"donate":donater,"__v":0}));
                                                      print(response.body);
                                                      Navigator.pop(context);
                                                    })
                                              ],
                                            ),
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
                        ]
                    ),
                  ),
                ),


              ],
            ),
          ),
    );
  }
  List<plog>?pat=[];

  late repo r=api();
  get all{
    return pat;

  }
  Future<void>getallpat2()async {
    List?list1 = await r.getAll(patient_url);
    pat!.addAll(list1!.map((e) => plog.fromJson(e)).toList());

    print(pat);

  }


}

//frree
