import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hospital/constant.dart';
import 'package:hospital/login.dart';
import 'package:hospital/patient_profile.dart';

import 'components/components.dart';
class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}
//ss

class _SearchPageState extends State<SearchPage> {
  String? _result;

  @override
  Widget build(BuildContext context) {
    var idCont=TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Center(child: Padding(
        padding: const EdgeInsets.only(right: 50.0),
        child: Text('Medical Record'),
      )),backgroundColor: Colors.blue.shade800,),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: form(
                controlled_text: idCont,
                text: 'Enter Patient Id',
                prefix_icon: Icons.email,
                input_type: TextInputType.text,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: button(
              color: Colors.blue.shade700,
    text: 'Get Patient Data',
    function: (){
      pid=idCont.text;
      print(pid);

      Navigator.push(context, MaterialPageRoute(builder: (context)=>patient_profile()));
    }
            ),
          )

        ],
      ),
  );
  }
}
//dd

