import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String? senderid;
  String ?reciverid;
  Timestamp? date;
  String ?text;

  MessageModel({
    this.senderid,
    this.reciverid,
    this.date,
    this.text,
  });

  MessageModel.fromJson(Map<String, dynamic> json)
  {
    senderid = json['senderid'];
    reciverid = json['reciverid'];
    date = json['date'];
    text = json['text'];
  }

  Map<String, dynamic> toMap()
  {
    return {
      'senderid':senderid,
      'reciverid':reciverid,
      'date':date,
      'text':text,
    };
  }
}