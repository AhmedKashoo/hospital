class SheduleD {
  String? sId;
  String? day;
  int? from;
  int? to;
  String? doctorID;
  int? iV;

  SheduleD({this.sId, this.day, this.from, this.to, this.doctorID, this.iV});

  SheduleD.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    day = json['day'];
    from = json['from'];
    to = json['to'];
    doctorID = json['doctorID'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['day'] = this.day;
    data['from'] = this.from;
    data['to'] = this.to;
    data['doctorID'] = this.doctorID;
    data['__v'] = this.iV;
    return data;
  }
}