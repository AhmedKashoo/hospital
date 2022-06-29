class Medical {
  String? sId;
  String? password;
  String? fullName;
  String? bloodType;
  int? height;
  int? weight;
  String? phone;
  String? birthDate;
  String? gender;
  String? address;
  bool? donate;
  int? iV;


  Medical(
      {this.sId,
        this.password,
        this.fullName,
        this.bloodType,
        this.height,
        this.weight,
        this.phone,
        this.birthDate,
        this.gender,
        this.address,
        this.donate,
        this.iV,
        });

  Medical.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    password = json['password'];
    fullName = json['fullName'];
    bloodType = json['bloodType'];
    height = json['height'];
    weight = json['weight'];
    phone = json['phone'];
    birthDate = json['birthDate'];
    gender = json['gender'];
    address = json['address'];
    donate = json['donate'];
    iV = json['__v'];
    if (json['medical_record'] != null) {

      json['medical_record'].forEach((v) {

      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['password'] = this.password;
    data['fullName'] = this.fullName;
    data['bloodType'] = this.bloodType;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['phone'] = this.phone;
    data['birthDate'] = this.birthDate;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['donate'] = this.donate;
    data['__v'] = this.iV;

    return data;
  }
}

class MedicalRecord {
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
  String? medicalPic;

  MedicalRecord(
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
        this.medicalPic});

  MedicalRecord.fromJson(Map<String, dynamic> json) {
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
    medicalPic = json['medicalPic'];
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
    data['medicalPic'] = this.medicalPic;
    return data;
  }
}