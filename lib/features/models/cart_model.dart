
class CartModel {
  int? id;
  int? vip;
  num? total;
  List<Services>? services;
  User? user;
  Technician? technician;

  CartModel({this.services, this.user, this.technician,this.total,this.id,this.vip});

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    vip = json['vip'];
    total = json['total'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    technician = json['technician'] != null
        ? new Technician.fromJson(json['technician'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.technician != null) {
      data['technician'] = this.technician!.toJson();
    }
    return data;
  }
}

class Services {
  int? id;
  String? name;
  String? image;
  num? price;
  num? unitPrice;
  int? quantity;

  Services({this.id, this.name, this.image, this.price, this.quantity});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    price = json['price'];
    unitPrice = json['unit_price'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? phone;

  User({this.id, this.name, this.email, this.phone});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    return data;
  }
}

class Technician {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? image;
  String? city;
  String? about;
  int? age;
  List<String>? workingDays;
  List<WorkingPeriods>? workingPeriods;
  String? drivingLicense;
  String? carLicense;
  String? nationalId;
  String? ratingsAvgRating;

  Technician(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.image,
        this.city,
        this.about,
        this.age,
        this.workingDays,
        this.workingPeriods,
        this.drivingLicense,
        this.carLicense,
        this.nationalId,
        this.ratingsAvgRating});

  Technician.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    city = json['city'];
    about = json['about'];
    age = json['age'];
    workingDays = json['working_days'].cast<String>();
    if (json['working_periods'] != null) {
      workingPeriods = <WorkingPeriods>[];
      json['working_periods'].forEach((v) {
        workingPeriods!.add(new WorkingPeriods.fromJson(v));
      });
    }
    drivingLicense = json['driving_license'];
    carLicense = json['car_license'];
    nationalId = json['national_id'];
    ratingsAvgRating = json['ratings_avg_rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['city'] = this.city;
    data['about'] = this.about;
    data['age'] = this.age;
    data['working_days'] = this.workingDays;
    if (this.workingPeriods != null) {
      data['working_periods'] =
          this.workingPeriods!.map((v) => v.toJson()).toList();
    }
    data['driving_license'] = this.drivingLicense;
    data['car_license'] = this.carLicense;
    data['national_id'] = this.nationalId;
    data['ratings_avg_rating'] = this.ratingsAvgRating;
    return data;
  }
}

class WorkingPeriods {
  String? day;
  List<Values>? values;

  WorkingPeriods({this.day, this.values});

  WorkingPeriods.fromJson(Map<String, dynamic> json) {
    day = json['day'];
    if (json['values'] != null) {
      values = <Values>[];
      json['values'].forEach((v) {
        values!.add(new Values.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['day'] = this.day;
    if (this.values != null) {
      data['values'] = this.values!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Values {
  int? id;
  String? name;
  String? from;
  String? to;
  int? active;

  Values({this.id, this.name, this.from, this.to, this.active});

  Values.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    from = json['from'];
    to = json['to'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['from'] = this.from;
    data['to'] = this.to;
    data['active'] = this.active;
    return data;
  }
}
