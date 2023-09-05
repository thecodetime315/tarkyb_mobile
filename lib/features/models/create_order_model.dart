class CreateOrderModel {
  int? cityId;
  int? areaId;
  int? technicianId;
  int? periodId;
  int? vip;
  double? long;
  double? lat;
  String? datetime;
  String? paymentMethod;
  String? address;

  CreateOrderModel(
      {this.cityId,
        this.areaId,
        this.technicianId,
        this.periodId,
        this.vip,
        this.long,
        this.lat,
        this.datetime,
        this.paymentMethod,
        this.address});

  CreateOrderModel.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    areaId = json['area_id'];
    technicianId = json['technician_id'];
    periodId = json['period_id'];
    vip = json['vip'];
    long = json['long'];
    lat = json['lat'];
    datetime = json['datetime'];
    paymentMethod = json['payment_method'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city_id'] = this.cityId;
    data['area_id'] = this.areaId;
    data['technician_id'] = this.technicianId;
    data['period_id'] = this.periodId;
    data['vip'] = this.vip;
    data['long'] = this.long;
    data['lat'] = this.lat;
    data['datetime'] = this.datetime;
    data['payment_method'] = this.paymentMethod;
    data['address'] = this.address;
    return data;
  }
}
