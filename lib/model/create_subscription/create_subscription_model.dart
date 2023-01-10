class CreateSubscriptionModel {
  bool? status;
  int? code;
  String? msg;
  Data? data;

  CreateSubscriptionModel({this.status, this.code, this.msg, this.data});

  CreateSubscriptionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['code'] = code;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? startDate;
  String? endDate;
  User? user;
  Plan? plan;

  Data({this.id, this.startDate, this.endDate, this.user, this.plan});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    plan = json['plan'] != null ? Plan.fromJson(json['plan']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
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
  int? user;

  Badges({this.id, this.image, this.user});

  Badges.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    user = json['user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['image'] = image;
    data['user'] = user;
    return data;
  }
}

class Plan {
  int? id;
  String? name;
  String? details;
  String? price;
  int? numberOfAuction;
  int? time;
  String? pointOne;
  String? pointTwo;
  String? pointThree;

  Plan(
      {this.id,
      this.name,
      this.details,
      this.price,
      this.numberOfAuction,
      this.time,
      this.pointOne,
      this.pointTwo,
      this.pointThree});

  Plan.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    details = json['details'];
    price = json['price'];
    numberOfAuction = json['number_of_auction'];
    time = json['time'];
    pointOne = json['point_one'];
    pointTwo = json['point_two'];
    pointThree = json['point_three'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['details'] = details;
    data['price'] = price;
    data['number_of_auction'] = numberOfAuction;
    data['time'] = time;
    data['point_one'] = pointOne;
    data['point_two'] = pointTwo;
    data['point_three'] = pointThree;
    return data;
  }
}
