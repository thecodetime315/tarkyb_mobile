class NotificationsModel {
  Notifications? notifications;

  NotificationsModel({this.notifications});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    notifications = json['notifications'] != null
        ? new Notifications.fromJson(json['notifications'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.notifications != null) {
      data['notifications'] = this.notifications!.toJson();
    }
    return data;
  }
}

class Notifications {
  Pagination? pagination;
  List<NotificationsBody>? notificationsBody;

  Notifications({this.pagination, this.notificationsBody});

  Notifications.fromJson(Map<String, dynamic> json) {
    pagination = json['pagination'] != null
        ? new Pagination.fromJson(json['pagination'])
        : null;
    if (json['data'] != null) {
      notificationsBody = <NotificationsBody>[];
      json['data'].forEach((v) {
        notificationsBody!.add(new NotificationsBody.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.pagination != null) {
      data['pagination'] = this.pagination!.toJson();
    }
    if (this.notificationsBody != null) {
      data['data'] = this.notificationsBody!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pagination {
  int? totalItems;
  int? countItems;
  int? perPage;
  int? totalPages;
  int? currentPage;
  String? nextPageUrl;
  String? pervPageUrl;

  Pagination(
      {this.totalItems,
        this.countItems,
        this.perPage,
        this.totalPages,
        this.currentPage,
        this.nextPageUrl,
        this.pervPageUrl});

  Pagination.fromJson(Map<String, dynamic> json) {
    totalItems = json['total_items'];
    countItems = json['count_items'];
    perPage = json['per_page'];
    totalPages = json['total_pages'];
    currentPage = json['current_page'];
    nextPageUrl = json['next_page_url'];
    pervPageUrl = json['perv_page_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['total_items'] = this.totalItems;
    data['count_items'] = this.countItems;
    data['per_page'] = this.perPage;
    data['total_pages'] = this.totalPages;
    data['current_page'] = this.currentPage;
    data['next_page_url'] = this.nextPageUrl;
    data['perv_page_url'] = this.pervPageUrl;
    return data;
  }
}

class NotificationsBody {
  String? id;
  String? type;
  String? title;
  String? body;
  Data? data;
  String? createdAt;

  NotificationsBody({this.id, this.type, this.title, this.body, this.data, this.createdAt});

  NotificationsBody.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    title = json['title'];
    body = json['body'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['title'] = this.title;
    data['body'] = this.body;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Data {
  int? sender;
  String? senderName;
  int? commentId;
  int? replyId;
  int? postId;
  String? type;
  String? titleAr;
  String? titleEn;
  String? bodyAr;
  String? bodyEn;

  Data(
      {this.sender,
        this.senderName,
        this.commentId,
        this.replyId,
        this.postId,
        this.type,
        this.titleAr,
        this.titleEn,
        this.bodyAr,
        this.bodyEn});

  Data.fromJson(Map<String, dynamic> json) {
    sender = json['sender'];
    senderName = json['sender_name'];
    commentId = json['comment_id'];
    replyId = json['reply_id'];
    postId = json['post_id'];
    type = json['type'];
    titleAr = json['title_ar'];
    titleEn = json['title_en'];
    bodyAr = json['body_ar'];
    bodyEn = json['body_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sender'] = this.sender;
    data['sender_name'] = this.senderName;
    data['comment_id'] = this.commentId;
    data['reply_id'] = this.replyId;
    data['post_id'] = this.postId;
    data['type'] = this.type;
    data['title_ar'] = this.titleAr;
    data['title_en'] = this.titleEn;
    data['body_ar'] = this.bodyAr;
    data['body_en'] = this.bodyEn;
    return data;
  }
}
