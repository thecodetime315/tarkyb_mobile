class ChatRoomModel {
  int? id;
  int? orderId;
  SenderId? senderId;
  String? message;
  String? readAt;
  String? createdAt;

  ChatRoomModel(
      {this.id,
        this.orderId,
        this.senderId,
        this.message,
        this.readAt,
        this.createdAt});

  ChatRoomModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    senderId = json['sender_id'] != null
        ? new SenderId.fromJson(json['sender_id'])
        : null;
    message = json['message'];
    readAt = json['read_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['order_id'] = this.orderId;
    if (this.senderId != null) {
      data['sender_id'] = this.senderId!.toJson();
    }
    data['message'] = this.message;
    data['read_at'] = this.readAt;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class SenderId {
  int? id;
  String? name;
  String? image;

  SenderId({this.id, this.name, this.image});

  SenderId.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}
