class NotificationsModel {
  Data? data;
  String? createdAt;
  String? logo;

  NotificationsModel({this.data, this.createdAt, this.logo});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    createdAt = json['created_at'];
    logo = json['logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['created_at'] = this.createdAt;
    data['logo'] = this.logo;
    return data;
  }
}

class Data {
  String? title;
  String? body;
  String? type;
  Null? url;

  Data({this.title, this.body, this.type, this.url});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    body = json['body'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['body'] = this.body;
    data['type'] = this.type;
    return data;
  }
}
