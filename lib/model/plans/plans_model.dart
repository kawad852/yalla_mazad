class PlansModel {
  bool? status;
  int? code;
  String? msg;
  List<Data>? data;

  PlansModel({this.status, this.code, this.msg, this.data});

  PlansModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? details;
  String? price;
  int? numberOfAuction;
  int? time;
  String? pointOne;
  String? pointTwo;
  String? pointThree;

  Data({
    this.id,
    this.name,
    this.details,
    this.price,
    this.numberOfAuction,
    this.time,
    this.pointOne,
    this.pointThree,
    this.pointTwo,
  });

  Data.fromJson(Map<String, dynamic> json) {
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
