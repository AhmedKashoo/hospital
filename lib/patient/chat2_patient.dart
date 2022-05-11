import 'package:flutter/material.dart';
import 'package:hospital/components/components.dart';

class Chatting2_patient extends StatefulWidget {
  const Chatting2_patient({Key? key}) : super(key: key);

  @override
  State<Chatting2_patient> createState() => _Chatting2_patientState();
}

class _Chatting2_patientState extends State<Chatting2_patient> {
  var chat = TextEditingController();
  Color c = const Color.fromARGB(232,234,245,245);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Colors.blue.shade800,
        elevation: 0,
      ),
      backgroundColor: Colors.blue.shade800,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 25,left: 30),
              child: Text('Dr. Abdelrahman Elbhery',style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.normal,
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  height: 1
              ),
              ),
            ),
          ),
      Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius:BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40)),
            color: Colors.white,
          ),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: form(
                    controlled_text: chat,
                    text: 'Type Your Message',
                    input_type: TextInputType.text,
                  bordercercuilar: 30,
                  visible_function: (){
                      chat.clear();
                  },
                  suffix_icon: Icons.send,
                  suffix_color: Colors.blue,
                  border_colors: Colors.transparent
                ),
              )
            ],
          ),
        ),
      )
        ],
      ),
    );
  }
}
