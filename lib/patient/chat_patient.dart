import 'package:flutter/material.dart';
import 'package:hospital/chat2.dart';
import 'package:hospital/components/components.dart';
import 'package:hospital/patient/chat4.dart';


class Patient_Chat extends StatefulWidget {
  const Patient_Chat({Key? key}) : super(key: key);

  @override
  State<Patient_Chat> createState() => _Patient_ChatState();
}

class _Patient_ChatState extends State<Patient_Chat> {
  Color c = const Color.fromARGB(232,234,245,245);
  var search = TextEditingController();
  bool change=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
        backgroundColor: Colors.blue.shade800,
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left:130.0),
            child: Text('Chatting',style: TextStyle(
                fontSize: 30,
                color: Colors.white
            ),),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 38,left: 10),
              child:Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right:20.0,left: 5,),
                        child: Container(
                          child:  change ? Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.blue.shade100,
                              child: IconButton(
                                onPressed:(){setState(() {
                                  change=!change;
                                  print('hi');
                                });} ,
                                icon: Icon(Icons.search),
                                color: Colors.black,
                                iconSize: 30,
                              ),
                            ),
                          )
                              :
                          form(
                            color: Colors.white,
                            controlled_text: search,
                            text: 'Search here',
                            input_type: TextInputType.text,
                            prefix_icon: Icons.search,
                            suffix_icon: Icons.cancel,
                            visible_function: (){setState(() {
                              change=!change;
                            });}
                          ),
                        ),
                      )
                    ],
                  )
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
              child:  Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        child: ListView.separated(
                          itemBuilder:(context,index)=>chatting(
                            ontap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Chat4()));}
                          )
                          , separatorBuilder: (context,index)=>SizedBox(height: 25,)
                          , itemCount:10 ,scrollDirection: Axis.vertical,),
                      ),
                    ),
                  ],
                ),
              ),

            ),
          )
        ],
      )
    );
  }
}
