class MySubscriptionModel {
  bool? status;
  int? code;
  String? msg;
  List<Data>? data;

  MySubscriptionModel({this.status, this.code, this.msg, this.data});

  MySubscriptionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['code'] = code;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? startDate;
  String? endDate;
  String? status;
  User? user;
  Plan? plan;

  Data(
      {this.id,
      this.startDate,
      this.endDate,
      this.status,
      this.user,
      this.plan});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    plan = json['plan'] != null ? Plan.fromJson(json['plan']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['status'] = status;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (plan != null) {
      data['plan'] = plan!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? image;
  String? phone;
  List<Badges>? badges;

  User({this.id, this.name, this.email, this.image, this.phone, this.badges});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    image = json['image'];
    phone = json['phone'];
    if (json['badges'] != null) {
      badges = <Badges>[];
      json['badges'].forEach((v) {
        badges!.add(Badges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['image'] = image;
    data['phone'] = phone;
    if (badges != null) {
      data['badges'] = badges!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Badges {
  int? id;
  String? image;

  Badges({this.id, this.image});

  Badges.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['image'] = image;
    return data;
  }
}

class Plan {
  int? id;
  String? name;
  String? details;
  String? price;
  int? numberOfAuction;

  ///TODO: not sure
  String? time;

  Plan(
      {this.id,
      this.name,
      this.details,
      this.price,
      this.numberOfAuction,
      this.time});

  Plan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    details = json['details'];
    price = json['price'];
    numberOfAuction = json['number_of_auction'];
    time = json['time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['details'] = details;
    data['price'] = price;
    data['number_of_auction'] = numberOfAuction;
    data['time'] = time;
    return data;
  }
}
