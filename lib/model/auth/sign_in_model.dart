class SignInModel {
  SignInModel({
    this.status,
    this.code,
    this.msg,
    this.data,
  });

  SignInModel.fromJson(dynamic json) {
    status = json['status'];
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? status;
  int? code;
  String? msg;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['code'] = code;
    map['msg'] = msg;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }
}

class Data {
  Data({
    this.token,
    this.user,
  });

  Data.fromJson(dynamic json) {
    token = json['token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  String? token;
  User? user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token'] = token;
    if (user != null) {
      map['user'] = user?.toJson();
    }
    return map;
  }
}

class User {
  User({
    this.id,
    this.name,
    this.phone,
    this.email,
    this.image,
  });

  User.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    image = json['image'];
    if (json['badges'] != null) {
      badges = <Badge?>[];
      json['badges'].forEach((v) {
        badges!.add(Badge.fromJson(v));
      });
    }
  }
  int? id;
  String? name;
  String? email;
  String? image;
  String? phone;
  List<Badge?>? badges;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['phone'] = phone;
    map['email'] = email;
    map['image'] = image;
    if (badges != null) {
      map['badges'] = badges!.map((v) => v?.toJson()).toList();
    }
    return map;
  }
}

class Badge {
  Badge({
    this.id,
    this.image,
  });

  Badge.fromJson(dynamic json) {
    id = json['id'];
    image = json['image'];
  }
  int? id;
  String? image;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['image'] = image;
    return map;
  }
}
