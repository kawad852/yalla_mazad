class MyBadgesModel {
  bool? status;
  int? code;
  String? msg;
  List<Data>? data;

  MyBadgesModel({this.status, this.code, this.msg, this.data});

  MyBadgesModel.fromJson(Map<String, dynamic> json) {
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
  String? image;
  int? user;

  Data({this.id, this.image, this.user});

  Data.fromJson(Map<String, dynamic> json) {
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
