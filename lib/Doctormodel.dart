class Dlog {
  String? sId;
  String? password;
  String? fullName;
  String? phone;
  String? birthDate;
  String? gender;
  String? address;
  String? speciality;
  String? hospitalID;
  int? iV;

  Dlog(
      {this.sId,
        this.password,
        this.fullName,
        this.phone,
        this.birthDate,
        this.gender,
        this.address,
        this.speciality,
        this.hospitalID,
        this.iV});

  Dlog.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    password = json['password'];
    fullName = json['fullName'];
    phone = json['phone'];
    birthDate = json['birthDate'];
    gender = json['gender'];
    address = json['address'];
    speciality = json['speciality'];
    hospitalID = json['hospitalID'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['password'] = this.password;
    data['fullName'] = this.fullName;
    data['phone'] = this.phone;
    data['birthDate'] = this.birthDate;
    data['gender'] = this.gender;
    data['address'] = this.address;
    data['speciality'] = this.speciality;
    data['hospitalID'] = this.hospitalID;
    data['__v'] = this.iV;
    return data;
  }
}