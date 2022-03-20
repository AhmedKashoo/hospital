import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/components/components.dart';

class doctor extends StatefulWidget {
  const doctor({Key? key}) : super(key: key);

  @override
  _doctorState createState() => _doctorState();
}

class _doctorState extends State<doctor> {
  Color c = const Color.fromARGB(232,234,245,245);
  late Color color;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: c,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: Center(child: Text('Doctor List',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold))),
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
                          ]),
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
                          ]),
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
                          ]),
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
                          ]),
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
                          ]),
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
                          ]),
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
                          ]),

                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: button(text: 'Create Doctor', function: null,color: Colors.blue.shade900),
          )

        ],
      ),
    );
  }
}