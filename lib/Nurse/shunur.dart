class shuNur {
  String? sId;
  String? day;
  int? from;
  int? to;
  String? nurseID;
  int? iV;

  shuNur({this.sId, this.day, this.from, this.to, this.nurseID, this.iV});

  shuNur.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    day = json['day'];
    from = json['from'];
    to = json['to'];
    nurseID = json['nurseID'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['day'] = this.day;
    data['from'] = this.from;
    data['to'] = this.to;
    data['nurseID'] = this.nurseID;
    data['__v'] = this.iV;
    return data;
  }
}