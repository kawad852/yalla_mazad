class ResetPasswordNewPasswordModel {
  bool? status;
  int? code;
  String? msg;

  ResetPasswordNewPasswordModel({this.status, this.code, this.msg});

  ResetPasswordNewPasswordModel.fromJson(Map<String, dynamic> json) {
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
