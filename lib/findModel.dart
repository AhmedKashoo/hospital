class FindMedic {
  String? sId;
  String? day;
  bool? examination;
  String? prescription;
  int? dose;
  String? period;
  String? nextAppointment;
  String? note;
  String? doctorID;
  String? patientID;
  bool? expired;
  int? iV;
  String?medicalPic;

  FindMedic(
      {this.sId,
        this.day,
        this.examination,
        this.prescription,
        this.dose,
        this.period,
        this.nextAppointment,
        this.note,
        this.doctorID,
        this.patientID,
        this.expired,
        this.iV,
        this.medicalPic
      });

  FindMedic.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    day = json['day'];
    examination = json['examination'];
    prescription = json['prescription'];
    dose = json['dose'];
    period = json['period'];
    nextAppointment = json['nextAppointment'];
    note = json['note'];
    doctorID = json['doctorID'];
    patientID = json['patientID'];
    expired = json['expired'];
    iV = json['__v'];
    medicalPic=json['medicalPic'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['day'] = this.day;
    data['examination'] = this.examination;
    data['prescription'] = this.prescription;
    data['dose'] = this.dose;
    data['period'] = this.period;
    data['nextAppointment'] = this.nextAppointment;
    data['note'] = this.note;
    data['doctorID'] = this.doctorID;
    data['patientID'] = this.patientID;
    data['expired'] = this.expired;
    data['__v'] = this.iV;
    data['medicalPic']=this.medicalPic;
    return data;
  }
}