class AllTipsModel {
  bool? status;
  int? code;
  String? msg;
  List<Data>? data;

  AllTipsModel({this.status, this.code, this.msg, this.data});

  AllTipsModel.fromJson(Map<String, dynamic> json) {
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
  String? note;

  Data({this.id, this.note});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    note = json['note'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['note'] = note;
    return data;
  }
}
