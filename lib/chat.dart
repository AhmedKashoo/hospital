import 'package:flutter/material.dart';

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
      backgroundColor: c,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text('Chatting',style: TextStyle(
            fontSize: 30,
            color: Colors.black
          ),),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15)
                ),
                child: form(
                  color: Colors.white,
                  controlled_text: search,
                    text: 'Search here',
                    input_type: TextInputType.text,
                  prefix_icon: Icons.search,
                )
            ),
            SizedBox(height: 15,),
            Expanded(
              child: Container(
                child: ListView.separated(
                  itemBuilder:(context,index)=>chatting()
                  , separatorBuilder: (context,index)=>SizedBox(height: 15,)
                  , itemCount:10 ,scrollDirection: Axis.vertical,),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
