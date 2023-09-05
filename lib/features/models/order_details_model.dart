class OrderDetailsModel {
  int? id;
  User? user;
  Technician? technician;
  List<Services>? services;
  Address? address;
  String? datetime;
  Values? period;
  String? total;
  String? status;
  String? orderType;
  String? paymentStatus;
  int? vip;

  OrderDetailsModel(
      {this.id,
        this.user,
        this.technician,
        this.services,
        this.address,
        this.datetime,
        this.period,
        this.total,
        this.status,
        this.orderType,
        this.paymentStatus,
        this.vip});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    technician = json['technician'] != null
        ? new Technician.fromJson(json['technician'])
        : null;
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
    datetime = json['datetime'];
    period =
    json['period'] != null ? new Values.fromJson(json['period']) : null;
    total = json['total'];
    status = json['status'];
    orderType = json['order_type'];
    paymentStatus = json['payment_status'];
    vip = json['vip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.technician != null) {
      data['technician'] = this.technician!.toJson();
    }
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['datetime'] = this.datetime;
    if (this.period != null) {
      data['period'] = this.period!.toJson();
    }
    data['total'] = this.total;
    data['status'] = this.status;
    data['order_type'] = this.orderType;
    data['payment_status'] = this.paymentStatus;
    data['vip'] = this.vip;
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

class Services {
  int? id;
  String? name;
  String? description;
  String? image;
  String? price;
  int? status;
  int? orderQuantity;

  Services(
      {this.id,
        this.name,
        this.description,
        this.image,
        this.price,
        this.status,
        this.orderQuantity});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    status = json['status'];
    orderQuantity = json['order_quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['price'] = this.price;
    data['status'] = this.status;
    data['order_quantity'] = this.orderQuantity;
    return data;
  }
}

class Address {
  int? id;
  int? userId;
  int? cityId;
  int? areaId;
  String? address;
  String? long;
  String? lat;

  Address(
      {this.id,
        this.userId,
        this.cityId,
        this.areaId,
        this.address,
        this.long,
        this.lat});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    cityId = json['city_id '];
    areaId = json['area_id '];
    address = json['address'];
    long = json['long'];
    lat = json['lat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['city_id '] = this.cityId;
    data['area_id '] = this.areaId;
    data['address'] = this.address;
    data['long'] = this.long;
    data['lat'] = this.lat;
    return data;
  }
}
