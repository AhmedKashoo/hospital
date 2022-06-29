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
  MedicalPic? medicalPic;
  int? iV;

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
        this.medicalPic,
        this.iV});

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
    medicalPic = json['medicalPic'] != null
        ? new MedicalPic.fromJson(json['medicalPic'])
        : null;
    iV = json['__v'];
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
    if (this.medicalPic != null) {
      data['medicalPic'] = this.medicalPic!.toJson();
    }
    data['__v'] = this.iV;
    return data;
  }
}

class MedicalPic {
  String? fieldname;
  String? originalname;
  String? encoding;
  String? mimetype;
  String? destination;
  String? filename;
  String? path;
  int? size;

  MedicalPic(
      {this.fieldname,
        this.originalname,
        this.encoding,
        this.mimetype,
        this.destination,
        this.filename,
        this.path,
        this.size});

  MedicalPic.fromJson(Map<String, dynamic> json) {
    fieldname = json['fieldname'];
    originalname = json['originalname'];
    encoding = json['encoding'];
    mimetype = json['mimetype'];
    destination = json['destination'];
    filename = json['filename'];
    path = json['path'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fieldname'] = this.fieldname;
    data['originalname'] = this.originalname;
    data['encoding'] = this.encoding;
    data['mimetype'] = this.mimetype;
    data['destination'] = this.destination;
    data['filename'] = this.filename;
    data['path'] = this.path;
    data['size'] = this.size;
    return data;
  }
}