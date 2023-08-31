class FilterModel {
  int? serviceId;
  int? cityId;
  int? areaId;
  String? date;
  int? vip;

  FilterModel({this.serviceId, this.cityId, this.areaId, this.date, this.vip});

  FilterModel.fromJson(Map<String, dynamic> json) {
    serviceId = json['service_id'];
    cityId = json['city_id'];
    areaId = json['area_id'];
    date = json['date'];
    vip = json['vip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['service_id'] = this.serviceId;
    data['city_id'] = this.cityId;
    data['area_id'] = this.areaId;
    data['date'] = this.date;
    data['vip'] = this.vip;
    return data;
  }
}
