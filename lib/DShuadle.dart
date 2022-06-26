class Shu {
  String? sId;
  String? day;
  bool? examination;
  String? note;
  String? doctorID;
  String? patientID;
  int? iV;

  Shu(
      {this.sId,
        this.day,
        this.examination,
        this.note,
        this.doctorID,
        this.patientID,
        this.iV});

  Shu.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    day = json['day'];
    examination = json['examination'];
    note = json['note'];
    doctorID = json['doctorID'];
    patientID = json['patientID'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['day'] = this.day;
    data['examination'] = this.examination;
    data['note'] = this.note;
    data['doctorID'] = this.doctorID;
    data['patientID'] = this.patientID;
    data['__v'] = this.iV;
    return data;
  }
}