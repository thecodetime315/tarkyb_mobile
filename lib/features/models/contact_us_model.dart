

class ContactUsModel {
  String? name;
  String? email;
  String? phone;
  String? message;
  String? type;

  ContactUsModel({this.name, this.email, this.phone, this.message, this.type});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['message'] = this.message;
    data['type'] = this.type;
    return data;
  }
}
