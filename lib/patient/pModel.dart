class plog {
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

  plog(
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
        this.iV});

  plog.fromJson(Map<String, dynamic> json) {
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