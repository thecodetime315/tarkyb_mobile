class ServicesModel {
  int? id;
  String? name;
  String? description;
  String? price;
  String? image;
  int? status;

  ServicesModel(
      {this.id,
      this.name,
      this.description,
      this.price,
      this.image,
      this.status});

  ServicesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    price = json['price'];
    image = json['image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['price'] = this.price;
    data['image'] = this.image;
    data['status'] = this.status;
    return data;
  }
}
