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
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['code'] = this.code;
    data['msg'] = this.msg;
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

  Data({this.id, this.name, this.details, this.price, this.numberOfAuction});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    details = json['details'];
    price = json['price'];
    numberOfAuction = json['number_of_auction'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['details'] = this.details;
    data['price'] = this.price;
    data['number_of_auction'] = this.numberOfAuction;
    return data;
  }
}
