class CreateBidModel {
  bool? status;
  int? code;
  String? msg;
  Data? data;

  CreateBidModel({this.status, this.code, this.msg, this.data});

  CreateBidModel.fromJson(Map<String, dynamic> json) {
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
  int? price;
  User? user;
  int? advertisementId;

  Data({this.id, this.price, this.user, this.advertisementId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    advertisementId = json['advertisement_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['price'] = price;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['advertisement_id'] = advertisementId;
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
