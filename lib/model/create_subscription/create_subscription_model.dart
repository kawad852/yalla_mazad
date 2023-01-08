class CreateSubscriptionModel {
  bool? status;
  int? code;
  String? msg;
  Data? data;

  ///TODO: format
  CreateSubscriptionModel({this.status, this.code, this.msg, this.data});

  CreateSubscriptionModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ?  Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = this.status;
    data['code'] = this.code;
    data['msg'] = this.msg;
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
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    plan = json['plan'] != null ? new Plan.fromJson(json['plan']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.plan != null) {
      data['plan'] = this.plan!.toJson();
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
        badges!.add(new Badges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['image'] = this.image;
    data['phone'] = this.phone;
    if (this.badges != null) {
      data['badges'] = this.badges!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['user'] = this.user;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['details'] = this.details;
    data['price'] = this.price;
    data['number_of_auction'] = this.numberOfAuction;
    data['time'] = this.time;
    data['point_one'] = this.pointOne;
    data['point_two'] = this.pointTwo;
    data['point_three'] = this.pointThree;
    return data;
  }
}
