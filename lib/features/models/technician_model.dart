class TechnicianModel {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? type;
  String? phone;
  String? image;
  String? city;
  int? age;

  String? about;
  String? status;
  String? balance;
  int? countryId;
  int? cityId;
  int? areaId;
  String? deviceToken;
  List<dynamic>? workingDays;
  String? drivingLicense;
  String? carLicense;
  String? nationalId;
  String? createdAt;
  String? updatedAt;
  int? vipService;
  int? special;
  String? ratingsAvgRating;

  TechnicianModel(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.type,
      this.phone,
      this.image,
      this.age,
      this.about,
      this.status,
      this.balance,
      this.city,
      this.countryId,
      this.cityId,
      this.areaId,
      this.deviceToken,
      this.workingDays,
      this.drivingLicense,
      this.carLicense,
      this.nationalId,
      this.createdAt,
      this.updatedAt,
      this.vipService,
      this.special,
      this.ratingsAvgRating});

  TechnicianModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    type = json['type'];
    phone = json['phone'];
    image = json['image'];
    age = json['age'];
    about = json['about'];
    status = json['status'];
    balance = json['balance'];
    countryId = json['country_id'];
    cityId = json['city_id'];
    areaId = json['area_id'];
    deviceToken = json['device_token'];
    workingDays = json['working_days'];
    drivingLicense = json['driving_license'];
    carLicense = json['car_license'];
    nationalId = json['national_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    city = json['city'];
    vipService = json['vip_service'];
    special = json['special'];
    ratingsAvgRating = json['ratings_avg_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['type'] = this.type;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['age'] = this.age;
    data['about'] = this.about;
    data['status'] = this.status;
    data['balance'] = this.balance;
    data['country_id'] = this.countryId;
    data['city_id'] = this.cityId;
    data['area_id'] = this.areaId;
    data['device_token'] = this.deviceToken;
    data['working_days'] = this.workingDays;
    data['driving_license'] = this.drivingLicense;
    data['car_license'] = this.carLicense;
    data['national_id'] = this.nationalId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['vip_service'] = this.vipService;
    data['special'] = this.special;
    data['ratings_avg_rating'] = this.ratingsAvgRating;
    return data;
  }
}
