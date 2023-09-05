class WorkingTimeModel {
  int? id;
  String? name;
  String? from;
  String? to;
  int? active;

  WorkingTimeModel({this.id, this.name, this.from, this.to, this.active});

  WorkingTimeModel.fromJson(Map<String, dynamic> json) {
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
