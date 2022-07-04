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


class donation extends StatefulWidget {
  const donation({Key? key}) : super(key: key);

  @override
  _donationState createState() => _donationState();

}

class _donationState extends State<donation> {
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
  Color c = const Color.fromARGB(232, 234, 245, 245);
  late Color color;
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(future: getallpat3(),
      builder: (context, dynamic) =>
          Scaffold(
            key: scaffoldkey,
            backgroundColor: c,
            appBar: AppBar(
              title: Padding(
                padding: const EdgeInsets.only(right: 50.0),
                child: Center(child: Text('Patient List', style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.bold))),
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
                              MaterialStateColor.resolveWith((states) =>
                              Colors.blue.shade800),
                                  columns: [
                                    DataColumn(label: Text('Name',
                                      style: TextStyle(color: Colors.white),)),
                                    DataColumn(label: Text('password',
                                      style: TextStyle(color: Colors.white),)),
                                    DataColumn(label: Text('Id',
                                      style: TextStyle(color: Colors.white),)),
                                  ], rows: m.map((e) =>
                                      DataRow(
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


                        ]
                    ),
                  ),
                ),


              ],
            ),
          ),
    );
  }

  List<plog>?pat = [];
  late repo r = api();

  get all {
    return pat;
  }
  List<plog>m=[];

  Future<void> getallpat3() async {
    List?list1 = await r.getAll(patient_url);
    pat!.addAll(list1!.map((e) => plog.fromJson(e)).toList());
    for (int i = 0; i < pat!.length; i++) {
      if (pat![i].donate == true) {
        print(pat?[i].sId);
        m.add(pat![i]);
      }

    }
  }
}

