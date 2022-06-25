import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/components/components.dart';
import 'package:intl/intl.dart';

class nursing extends StatefulWidget {
  const nursing({Key? key}) : super(key: key);

  @override
  _doctorState createState() => _doctorState();
}

class _doctorState extends State<nursing> {
  bool floatbot = false;
  var scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();
  var namecontroll = TextEditingController();
  var idcontroll = TextEditingController();
  var datecontroll = TextEditingController();
  var patientdatecontroll = TextEditingController();
  var hourscontroll = TextEditingController();
  var numpatientscontroll = TextEditingController();
  var searchcontroll = TextEditingController();
  var pass = TextEditingController();
  var phone = TextEditingController();
  var address = TextEditingController();
  String ?dropdownValue = null;
  String ?gender = null;

  bool isvisible = true;
  Color c = const Color.fromARGB(232,234,245,245);
  late Color color;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: scaffoldkey,
      backgroundColor: c,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: Center(child: Text('Nurse List',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),
        ),
        backgroundColor: Colors.blue.shade800,
      ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [

          Center(
            child: Column(
              children: <Widget>[
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: DataTable(
                    headingRowColor:
                    MaterialStateColor.resolveWith((states) => Colors.blue.shade800),
                    onSelectAll: (val) {
                      setState(() {
                        selectedIndex = -1;
                      });
                    },
                    columns: [
                      DataColumn(label: Text('Photo',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                      DataColumn(label: Text('Name',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                      DataColumn(label: Text('Email',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                      DataColumn(label: Text('Age',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                      DataColumn(label: Text('Specialization',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                      DataColumn(label: Text('Doctor Schedule',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),

                    ],
                    rows: [
                      DataRow(
                          selected: 0 == selectedIndex,
                          onSelectChanged: (val) {
                            setState(() {
                              selectedIndex = 0;

                            });
                          },
                          cells: [
                            DataCell(
                              CircleAvatar(
                                backgroundImage: AssetImage('image/doc.png'),
                              ),
                              onTap: () {
                                setState(() {
                                  color = Colors.lightBlueAccent;
                                });
                              },
                            ),
                            DataCell(
                              Center(child: Text('Doctor Name',style: TextStyle(fontWeight: FontWeight.bold),)),
                            ),
                            DataCell(
                              Center(child: Text('Doctor@gmail.com',style: TextStyle(fontWeight: FontWeight.bold),)),
                            ),
                            DataCell(
                              Center(child: Text('44',style: TextStyle(fontWeight: FontWeight.bold),)),
                            ),
                            DataCell(
                              Center(child: Text('heart disease',style: TextStyle(fontWeight: FontWeight.bold),)),
                            ),
                            DataCell(
                              GestureDetector(
                                  onTap: (){},
                                  child: Center(child:  Image(image: AssetImage('image/patient.png',),height: 40,width: 40,))),
                            ),
                          ]),
                      DataRow(
                          selected: 1 == selectedIndex,
                          onSelectChanged: (val) {
                            setState(() {
                              selectedIndex = 1;

                            });
                          },
                          cells: [
                            DataCell(
                              CircleAvatar(
                                backgroundImage: AssetImage('image/doc.png'),
                              ),
                              onTap: () {
                                setState(() {
                                  color = Colors.lightBlueAccent;
                                });
                              },
                            ),
                            DataCell(
                              Center(child: Text('Doctor Name',style: TextStyle(fontWeight: FontWeight.bold),)),
                            ),
                            DataCell(
                              Center(child: Text('Doctor@gmail.com',style: TextStyle(fontWeight: FontWeight.bold),)),
                            ),
                            DataCell(
                              Center(child: Text('44',style: TextStyle(fontWeight: FontWeight.bold),)),
                            ),
                            DataCell(
                              Center(child: Text('heart disease',style: TextStyle(fontWeight: FontWeight.bold),)),
                            ),
                            DataCell(
                              GestureDetector(
                                  onTap: (){},
                                  child: Center(child:  Image(image: AssetImage('image/patient.png',),height: 40,width: 40,))),
                            ),
                          ]),
                      DataRow(
                          selected: 2 == selectedIndex,
                          onSelectChanged: (val) {
                            setState(() {
                              selectedIndex = 2;

                            });
                          },
                          cells: [
                            DataCell(
                              CircleAvatar(
                                backgroundImage: AssetImage('image/doc.png'),
                              ),
                              onTap: () {
                                setState(() {
                                  color = Colors.lightBlueAccent;
                                });
                              },
                            ),
                            DataCell(
                              Center(child: Text('Doctor Name',style: TextStyle(fontWeight: FontWeight.bold),)),
                            ),
                            DataCell(
                              Center(child: Text('Doctor@gmail.com',style: TextStyle(fontWeight: FontWeight.bold),)),
                            ),
                            DataCell(
                              Center(child: Text('44',style: TextStyle(fontWeight: FontWeight.bold),)),
                            ),
                            DataCell(
                              Center(child: Text('heart disease',style: TextStyle(fontWeight: FontWeight.bold),)),
                            ),
                            DataCell(
                              GestureDetector(
                                  onTap: (){},
                                  child: Center(child:  Image(image: AssetImage('image/patient.png',),height: 40,width: 40,))),
                            ),
                          ]),
                      DataRow(
                          selected: 3 == selectedIndex,
                          onSelectChanged: (val) {
                            setState(() {
                              selectedIndex = 3;

                            });
                          },
                          cells: [
                            DataCell(
                              CircleAvatar(
                                backgroundImage: AssetImage('image/doc.png'),
                              ),
                              onTap: () {
                                setState(() {
                                  color = Colors.lightBlueAccent;
                                });
                              },
                            ),
                            DataCell(
                              Center(child: Text('Doctor Name',style: TextStyle(fontWeight: FontWeight.bold),)),
                            ),
                            DataCell(
                              Center(child: Text('Doctor@gmail.com',style: TextStyle(fontWeight: FontWeight.bold),)),
                            ),
                            DataCell(
                              Center(child: Text('44',style: TextStyle(fontWeight: FontWeight.bold),)),
                            ),
                            DataCell(
                              Center(child: Text('heart disease',style: TextStyle(fontWeight: FontWeight.bold),)),
                            ),
                            DataCell(
                              GestureDetector(
                                  onTap: (){},
                                  child: Center(child:  Image(image: AssetImage('image/patient.png',),height: 40,width: 40,))),
                            ),
                          ]),
                      DataRow(
                          selected: 4 == selectedIndex,
                          onSelectChanged: (val) {
                            setState(() {
                              selectedIndex = 4;

                            });
                          },
                          cells: [
                            DataCell(
                              CircleAvatar(
                                backgroundImage: AssetImage('image/doc.png'),
                              ),
                              onTap: () {
                                setState(() {
                                  color = Colors.lightBlueAccent;
                                });
                              },
                            ),
                            DataCell(
                              Center(child: Text('Doctor Name',style: TextStyle(fontWeight: FontWeight.bold),)),
                            ),
                            DataCell(
                              Center(child: Text('Doctor@gmail.com',style: TextStyle(fontWeight: FontWeight.bold),)),
                            ),
                            DataCell(
                              Center(child: Text('44',style: TextStyle(fontWeight: FontWeight.bold),)),
                            ),
                            DataCell(
                              Center(child: Text('heart disease',style: TextStyle(fontWeight: FontWeight.bold),)),
                            ),
                            DataCell(
                              GestureDetector(
                                  onTap: (){
                                    Dialog errorDialog = Dialog(
                                      elevation: 3,
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(15.0),
                                          side: BorderSide(color: Colors.blue,width: 2)
                                      ), //this right here
                                      child: Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Container(
                                          height: 320.0,
                                          width: 400.0,

                                          child: SingleChildScrollView(
                                            child: Padding(
                                              padding: const EdgeInsets.only(top: 10),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: <Widget>[
                                                  Text('Nurse Schedule',style: TextStyle(
                                                      color: Colors.blue,
                                                      fontSize: 20,
                                                      fontWeight: FontWeight.bold
                                                  ),
                                                  ),
                                                  SizedBox(height: 10,),
                                                  form(
                                                      bordercercuilar: 15.0,
                                                      controlled_text:hourscontroll
                                                      , text: 'Work hours',
                                                      input_type: TextInputType.number,
                                                      prefix_icon: Icons.lock_clock
                                                  ),
                                                  SizedBox(height: 10,),


                                                  form(
                                                    controlled_text: patientdatecontroll,
                                                    text: 'Day',
                                                    tap: () {
                                                      showDatePicker(
                                                          context: context,
                                                          initialDate: DateTime.now(),
                                                          firstDate: DateTime(1960,8),
                                                          lastDate: DateTime.parse(
                                                              '2022-11-20'))
                                                          .then((value) {
                                                        patientdatecontroll.text =
                                                            DateFormat.yMMMd()
                                                                .format(value!);
                                                      });
                                                    },
                                                    prefix_icon: Icons.calendar_today,
                                                    input_type: TextInputType.datetime,
                                                  ),
                                                  SizedBox(height: 10,),
                                                  Container(
                                                    height: 50,
                                                    width: 250,
                                                    child: form(
                                                        controlled_text: searchcontroll,
                                                        text:'Add Patient' ,
                                                        input_type:TextInputType.number,
                                                        prefix_icon: Icons.person_add
                                                    ),
                                                  ),
                                                  SizedBox(height: 20,),
                                                  Padding(padding: EdgeInsets.only(top: 10.0)),
                                                  TextButton(onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                      child: Text('Done', style: TextStyle(color: Colors.blue, fontSize: 18.0),))
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                    showDialog(context: context, builder: (BuildContext context) => errorDialog);}
                                  ,
                                  child: Center(child:  Image(image: AssetImage('image/patient.png',),height: 40,width: 40,))),
                            ),
                          ]),
                      DataRow(
                          selected: 5 == selectedIndex,
                          onSelectChanged: (val) {
                            setState(() {
                              selectedIndex = 5;

                            });
                          },
                          cells: [
                            DataCell(
                              CircleAvatar(
                                backgroundImage: AssetImage('image/doc.png'),
                              ),
                              onTap: () {
                                setState(() {
                                  color = Colors.lightBlueAccent;
                                });
                              },
                            ),
                            DataCell(
                              Center(child: Text('Doctor Name',style: TextStyle(fontWeight: FontWeight.bold),)),
                            ),
                            DataCell(
                              Center(child: Text('Doctor@gmail.com',style: TextStyle(fontWeight: FontWeight.bold),)),
                            ),
                            DataCell(
                              Center(child: Text('44',style: TextStyle(fontWeight: FontWeight.bold),)),
                            ),
                            DataCell(
                              Center(child: Text('heart disease',style: TextStyle(fontWeight: FontWeight.bold),)),
                            ),
                            DataCell(
                              GestureDetector(
                                  onTap: (){},
                                  child: Center(child:  Image(image: AssetImage('image/patient.png',),height: 40,width: 40,))),
                            ),
                          ]),
                      DataRow(
                          selected: 6 == selectedIndex,
                          onSelectChanged: (val) {
                            setState(() {
                              selectedIndex = 6;

                            });
                          },
                          cells: [
                            DataCell(
                              CircleAvatar(
                                backgroundImage: AssetImage('image/doc.png'),
                              ),
                              onTap: () {
                                setState(() {
                                  color = Colors.lightBlueAccent;
                                });
                              },
                            ),
                            DataCell(
                              Center(child: Text('Doctor Name',style: TextStyle(fontWeight: FontWeight.bold),)),
                            ),
                            DataCell(
                              Center(child: Text('Doctor@gmail.com',style: TextStyle(fontWeight: FontWeight.bold),)),
                            ),
                            DataCell(
                              Center(child: Text('44',style: TextStyle(fontWeight: FontWeight.bold),)),
                            ),
                            DataCell(
                              Center(child: Text('heart disease',style: TextStyle(fontWeight: FontWeight.bold),)),
                            ),
                            DataCell(
                              GestureDetector(
                                  onTap: (){},
                                  child: Center(child:  Image(image: AssetImage('image/patient.png',),height: 40,width: 40,))),
                            ),

                          ]),

                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: button(
              text: 'Add Nurse',
              function: (){
                scaffoldkey.currentState
                    ?.showBottomSheet(
                        (context)=>Form(
                      key: formkey,
                      child: StatefulBuilder(
                        builder: (BuildContext context, StateSetter setbotstate)=>Container(
                          color: c,
                          padding: EdgeInsets.all(20),
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
                                  hint: Text('Doctor\'s specialty'),
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
                                  items: <String>['Dentist', 'Cardiologist', 'Neurologist', 'Dermatologist','Emergency','Psychiatrist','Surgeon','Pediatrician ','Radiologist','Hematologist','Oncologist']
                                      .map<DropdownMenuItem<String>>((String value) {
                                    return DropdownMenuItem<String>(
                                      value: value,
                                      child: Text(value),
                                    );
                                  }).toList(),
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
                              form(
                                controlled_text: idcontroll,
                                text: 'ID',
                                prefix_icon: Icons.perm_identity,
                                input_type: TextInputType.emailAddress,
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
                              button(
                                  text: 'Apply',
                                  color: Colors.blue.shade800,
                                  function: (){
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