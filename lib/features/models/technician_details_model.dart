class TechnicianDetailsModel {
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
  String? averageRate;
  List<Services>? services;
  List<Reviews>? reviews;

  TechnicianDetailsModel(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.image,
        this.city,
        this.about,
        this.age,
        this.averageRate,
        this.workingDays,
        this.workingPeriods,
        this.drivingLicense,
        this.carLicense,
        this.nationalId,
        this.services,
        this.reviews});

  TechnicianDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    image = json['image'];
    city = json['city'];
    about = json['about'];
    age = json['age'];
    averageRate = json['ratings_avg_rating'];
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
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
    if (json['reviews'] != null) {
      reviews = <Reviews>[];
      json['reviews'].forEach((v) {
        reviews!.add(new Reviews.fromJson(v));
      });
    }
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
    data['ratings_avg_rating'] = this.averageRate;
    data['age'] = this.age;
    data['working_days'] = this.workingDays;
    if (this.workingPeriods != null) {
      data['working_periods'] =
          this.workingPeriods!.map((v) => v.toJson()).toList();
    }
    data['driving_license'] = this.drivingLicense;
    data['car_license'] = this.carLicense;
    data['national_id'] = this.nationalId;
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
    if (this.reviews != null) {
      data['reviews'] = this.reviews!.map((v) => v.toJson()).toList();
    }
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
  String? status;

  Services(
      {this.id,
        this.name,
        this.description,
        this.image,
        this.price,
        this.status});

  Services.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['price'] = this.price;
    data['status'] = this.status;
    return data;
  }
}

class Reviews {
  String? reviewerId;
  int? reviewedId;
  int? rating;
  String? comment;

  Reviews({this.reviewerId, this.reviewedId, this.rating, this.comment});

  Reviews.fromJson(Map<String, dynamic> json) {
    reviewerId = json['reviewer_id'];
    reviewedId = json['reviewed_id'];
    rating = json['rating'];
    comment = json['comment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reviewer_id'] = this.reviewerId;
    data['reviewed_id'] = this.reviewedId;
    data['rating'] = this.rating;
    data['comment'] = this.comment;
    return data;
  }
}
