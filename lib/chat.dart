import 'package:flutter/material.dart';
import 'package:hospital/components/chat2.dart';

import 'components/components.dart';

class Hospital_Chat extends StatefulWidget {
  const Hospital_Chat({Key? key}) : super(key: key);

  @override
  State<Hospital_Chat> createState() => _Hospital_ChatState();
}

class _Hospital_ChatState extends State<Hospital_Chat> {
  Color c = const Color.fromARGB(232,234,245,245);
  var search = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue.shade800,

      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(top: 80,left: 10),
              child:Container(
                  height: 60,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Center(
                      child: Text('Chatting',style: TextStyle(
                        fontSize: 30,
                        color: Colors.white
                  ),),
                    ),
                      SizedBox(height: 10,),
                      form(
                        color: Colors.white,
                        controlled_text: search,
                        text: 'Search here',
                        input_type: TextInputType.text,
                        prefix_icon: Icons.search,
                      ),
                    ],
                  )
              ),

            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
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
                            ontap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>Chatting2()));}
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
