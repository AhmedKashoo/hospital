

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
  var mailcontroll = TextEditingController();
  var blod;
  var datecontroll = TextEditingController();
  var pass = TextEditingController();
  String ?dropdownValue = null;
  @override
  void initState() {

    super.initState();
    getallpat() ;
  }

  bool isvisible = true;
  Color c = const Color.fromARGB(232,234,245,245);
  late Color color;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {


    return FutureBuilder(future: getallpat() ,
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
                        DataColumn(label: Text('Add Medical Record',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),

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
                                Center(child: Text('Patient Name',style: TextStyle(fontWeight: FontWeight.bold),)),
                              ),
                              DataCell(
                                Center(child: Text('Patient@gmail.com',style: TextStyle(fontWeight: FontWeight.bold),)),
                              ),
                              DataCell(
                                Center(child: Text('44',style: TextStyle(fontWeight: FontWeight.bold),)),
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
                                    items: <String>['A', '+A', '-A', 'B','-B','+B','+AB','AB ','+AB','-AB','O','+O','-O']
                                        .map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
onSaved: (S){

   setState(() {
     blod=S;
   });
},
                                    //
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                form(
                                  controlled_text: mailcontroll,
                                  text: 'E-mail',
                                  prefix_icon: Icons.email,
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
                                button(
                                    text: 'Apply',
                                    color: Colors.blue.shade800,
                                    function: ()async{
                                      print(blod);
                                      http.Response response=await http.post(Uri.parse(patient_url),headers: {"Content-type": "application/json"},
                                          body: jsonEncode({"_id":mailcontroll.text,"password":pass.text,"fullName":namecontroll.text,"bloodType":"A+","height":175,"weight":60,"phone":"01031782430","birthDate":"1999-03-29T11:34:00.000Z","gender":"Male","address":"Mansoura,Dkahlia","donate":true,"__v":0}));
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
  List<plog>?pat=[];
  late repo r=api();
  get all{
    return pat;

  }
  Future<void>getallpat()async {
    List?list1 = await r.getAll(patient_url);
    pat!.addAll(list1!.map((e) => plog.fromJson(e)).toList());
    print(pat);

      }

    }

