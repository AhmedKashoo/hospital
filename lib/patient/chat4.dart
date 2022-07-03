import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:hospital/Network/dio/repo.dart';
import 'package:hospital/Network/dio/web.dart';
import 'package:hospital/components/components.dart';

import '../constant.dart';
import '../findModel.dart';
import '../messagemodel.dart';


class Chat4 extends StatefulWidget {
  const Chat4({Key? key}) : super(key: key);

  @override
  State<Chat4> createState() => _Chat4State();
}

class _Chat4State extends State<Chat4> {
  List<MessageModel> mess = [];
  var chat = TextEditingController();
  String?message;
  Color c = const Color.fromARGB(232,234,245,245);
  @override
  void initState() {
    // TODO: implement initState
    getallmed();
    super.initState();
    getMessages(receiverId: recid.toString());
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream:FirebaseFirestore.instance.collection('user').doc(id).collection('chat').doc(recid).collection('message')
            .orderBy('date')
            .snapshots(),
        builder:(context,snapsho){
          return Scaffold(
            appBar: AppBar(
              title: Padding(
                padding: const EdgeInsets.only(right: 50.0),
                child: Center(child: Text("Chat",style:TextStyle(color: Colors.white) ,)),
              ),
              backgroundColor:  Colors.blue.shade800,
              elevation: 0,
            ),
            backgroundColor: Colors.white,
            body: ConditionalBuilder(
              condition: mess.length > 0,
              builder: (context) => Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index)
                        {
                          var message = mess[index];

                          if(id == message.senderid)
                            return buildMyMessage(message);

                          return buildMessage(message);
                        },
                        separatorBuilder: (context, index) => SizedBox(
                          height: 15.0,
                        ),
                        itemCount: mess.length,

                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade300,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(
                          15.0,
                        ),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15.0,
                              ),
                              child: TextFormField(
                                controller: chat,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'type your message here ...',
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 50.0,
                            color: Colors.blue,
                            child: MaterialButton(
                              onPressed: () {
                                setState(() {
                                  sendMessage(
                                    recid: recid.toString(),
                                    date: Timestamp.now(),
                                    text: chat.text,
                                  );
                                  chat.clear();
                                  FocusScope.of(context).unfocus();
                                });

                              },
                              minWidth: 1.0,
                              child: Icon(
                                Icons.send,
                                size: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              fallback: (context) => Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        }
    );


  }
  void sendMessage({
    required String recid,
    required Timestamp date,
    required String text,
  }) {
    MessageModel model = MessageModel(
      text: text,
      senderid: id,
      reciverid: recid,
      date: date,
    );

    // set my chats

    FirebaseFirestore.instance
        .collection('user')
        .doc(id)
        .collection('chat')
        .doc(recid)
        .collection('message')
        .add(model.toMap())
        .then((value) {

    }).catchError((error) {
      print(error);
    });

    FirebaseFirestore.instance
        .collection('user')
        .doc(recid)
        .collection('chat')
        .doc(id)
        .collection('message')
        .add(model.toMap())
        .then((value) {
    }).catchError((error) {
      print(error);

    });
  }

  Future<void> getMessages({
    required String receiverId,
  }) async {
    FirebaseFirestore.instance
        .collection('user')
        .doc(id)
        .collection('chat')
        .doc(receiverId)
        .collection('message')
        .orderBy('date')
        .snapshots()
        .listen((event) {
      mess = [];

      event.docs.forEach((element) {
        mess.add(MessageModel.fromJson(element.data()));
      });


    });
  }
  Widget buildMessage(MessageModel model) => Align(
    alignment: AlignmentDirectional.centerStart,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadiusDirectional.only(
          bottomEnd: Radius.circular(
            10.0,
          ),
          topStart: Radius.circular(
            10.0,
          ),
          topEnd: Radius.circular(
            10.0,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      child: Text(
        model.text.toString(),
      ),
    ),
  );

  Widget buildMyMessage(MessageModel model) => Align(
    alignment: AlignmentDirectional.centerEnd,
    child: Container(
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(
          .2,
        ),
        borderRadius: BorderRadiusDirectional.only(
          bottomStart: Radius.circular(
            10.0,
          ),
          topStart: Radius.circular(
            10.0,
          ),
          topEnd: Radius.circular(
            10.0,
          ),
        ),
      ),
      padding: EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 10.0,
      ),
      child: Text(
        model.text.toString(),
      ),
    ),
  );
  List<FindMedic>?med=[];
  late repo r=api();
  get allmed{
    return med;

  }
  Future<dynamic>getallmed()async {
    List?list1 = await r.getAll("https://stark-lake-52973.herokuapp.com/medicalrecord/"+id.toString());
    med!.addAll(list1!.map((e) => FindMedic.fromJson(e)).toList());


    recid=med![med!.length-1].doctorID.toString();
    print(recid);


  }

}
