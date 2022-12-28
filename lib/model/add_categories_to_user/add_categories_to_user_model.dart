class AddCategoriesToUserModel {
  bool? status;
  int? code;
  String? msg;

  AddCategoriesToUserModel({this.status, this.code, this.msg});

  AddCategoriesToUserModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['code'] = code;
    data['msg'] = msg;
    return data;
  }
}
