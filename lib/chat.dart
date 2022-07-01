import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:hospital/chat2.dart';

import 'LoginMode.dart';
import 'Network/dio/repo.dart';
import 'Network/dio/web.dart';
import 'components/components.dart';
import 'constant.dart';
import 'messagemodel.dart';

class Hospital_Chat extends StatefulWidget {
  const Hospital_Chat({Key? key}) : super(key: key);

  @override
  State<Hospital_Chat> createState() => _Hospital_ChatState();
}

class _Hospital_ChatState extends State<Hospital_Chat> {
  Color c = const Color.fromARGB(232,234,245,245);
  var search = TextEditingController();
  bool change=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.blue.shade800,

      body: FutureBuilder(
        future: getallHos(),
        builder: (context,dynamic){
          return Stack(
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
                              itemBuilder:(context,index)=>Container(

                                height: 80,

                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.transparent),

                                    borderRadius: BorderRadius.circular(15),

                                    color: Colors.white

                                ),

                                child:   Container(
                                  child: Row(

                                    children: [

                                      Expanded(
                                        child: CircleAvatar(

                                          radius: 30,

                                          child: Image.asset('image/logo2.png'),

                                        ),
                                      ),

                                      SizedBox(width: 8,),

                                      Expanded(
                                        flex: 2,
                                        child: Padding(
                                          padding: const EdgeInsets.only(bottom: 22 ),
                                          child: Column(

                                            crossAxisAlignment:CrossAxisAlignment.start ,
                                            mainAxisAlignment: MainAxisAlignment.end,

                                            children: [


                                              Text(hos![index].sId.toString(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18)
                                                ,maxLines: 1,overflow: TextOverflow.ellipsis,),
                                              Text('Hello My name is '+hos![index].name.toString(),maxLines: 2,overflow: TextOverflow.ellipsis),



                                            ],

                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Row(
                                          children: [
                                            SizedBox(width: 10,),
                                            IconButton(onPressed: (){
                                              recid=hos![index].sId;
                                              print(recid);
                                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Chatting2()));
                                            },
                                                icon: Icon(Icons.message,color: Colors.blue,)
                                            )
                                          ],

                                        ),
                                      ),

                                    ],

                                  ),
                                ),

                              )

                              , separatorBuilder: (context,index)=>SizedBox(height: 25,)
                              , itemCount:hos!.length ,scrollDirection: Axis.vertical,),
                          ),
                        ),
                      ],
                    ),
                  ),

                ),
              )
            ],
          );
        }
      )
    );
  }
  List<Autogenerated>?hos=[];
  get all{
    return hos;

  }
  late repo r=api();
  Future<void>getallHos()async{
    List?list=await r.getAll(user_url);
    hos!.addAll(list!.map((e) => Autogenerated.fromJson(e)).toList());
    print(hos);
    for(int i=0;i<hos!.length;i++){
      if(hos![i].sId==id){
        continue;
      }


      print(hos!.length);
    }


  }

}
