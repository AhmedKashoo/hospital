class NShu {
  String? sId;
  String? day;
  bool? examination;
  String? note;
  String? nurseID;
  String? patientID;
  int? iV;

  NShu(
      {this.sId,
        this.day,
        this.examination,
        this.note,
        this.nurseID,
        this.patientID,
        this.iV});

  NShu.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    day = json['day'];
    examination = json['examination'];
    note = json['note'];
    nurseID = json['nurseID'];
    patientID = json['patientID'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['day'] = this.day;
    data['examination'] = this.examination;
    data['note'] = this.note;
    data['nurseID'] = this.nurseID;
    data['patientID'] = this.patientID;
    data['__v'] = this.iV;
    return data;
  }
}