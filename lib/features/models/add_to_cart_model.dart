class AddToCartModel {
  int? technicianId;
  List<int>? serviceId;
  List<num>? price;
  int? vip;

  AddToCartModel({this.technicianId, this.serviceId, this.price,this.vip});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['technician_id'] = this.technicianId;
    data['vip'] = this.vip;

    for (int i = 0; i < serviceId!.length; i++) {
      data['service_id[$i]'] = serviceId![i];
    }
    for (int i = 0; i < price!.length; i++) {
      data['price[$i]'] = price![i];
    }
    return data;
  }
}
