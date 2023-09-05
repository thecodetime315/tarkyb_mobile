

class OrdersModel {
  int? id;
  String? datetime;
  String? status;
  List<Services>? services;

  OrdersModel({this.id, this.datetime, this.status, this.services});

  OrdersModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    datetime = json['datetime'];
    status = json['status'];
    if (json['services'] != null) {
      services = <Services>[];
      json['services'].forEach((v) {
        services!.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['datetime'] = this.datetime;
    data['status'] = this.status;
    if (this.services != null) {
      data['services'] = this.services!.map((v) => v.toJson()).toList();
    }
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
