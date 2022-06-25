class Nlog {
  String? sId;
  String? password;
  String? fullName;
  String? phone;
  String? birthDate;
  String? gender;
  String? address;
  String? department;
  String? hospitalID;
  int? iV;

  Nlog(
      {this.sId,
        this.password,
        this.fullName,
        this.phone,
        this.birthDate,
        this.gender,
        this.address,
        this.department,
        this.hospitalID,
        this.iV});

  Nlog.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    password = json['password'];
    fullName = json['fullName'];
    phone = json['phone'];
    birthDate = json['birthDate'];
    gender = json['gender'];
    address = json['address'];
    department = json['department'];
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
    data['department'] = this.department;
    data['hospitalID'] = this.hospitalID;
    data['__v'] = this.iV;
    return data;
  }
}