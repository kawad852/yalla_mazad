class ResetPasswordPhoneNumberModel {
  bool? status;
  int? code;
  String? msg;

  ResetPasswordPhoneNumberModel({this.status, this.code, this.msg});

  ResetPasswordPhoneNumberModel.fromJson(Map<String, dynamic> json) {
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
