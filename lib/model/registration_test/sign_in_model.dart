// class SignInModel {
//   SignInModel({
//     this.status,
//     this.code,
//     this.msg,
//     this.data,
//   });
//
//   SignInModel.fromJson(dynamic json) {
//     status = json['status'];
//     code = json['code'];
//     msg = json['msg'];
//     data = json['data'] != null ? Data.fromJson(json['data']) : null;
//   }
//   bool? status;
//   int? code;
//   String? msg;
//   Data? data;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['status'] = status;
//     map['code'] = code;
//     map['msg'] = msg;
//     if (data != null) {
//       map['data'] = data?.toJson();
//     }
//     return map;
//   }
// }
//
// class Data {
//   Data({
//     this.token,
//     this.user,
//   });
//
//   Data.fromJson(dynamic json) {
//     token = json['token'];
//     user = json['user'] != null ? User.fromJson(json['user']) : null;
//   }
//   String? token;
//   User? user;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['token'] = token;
//     if (user != null) {
//       map['user'] = user?.toJson();
//     }
//     return map;
//   }
// }
//
// class User {
//   User({
//     this.id,
//     this.name,
//     this.lastName,
//     this.phone,
//     this.email,
//     this.image,
//   });
//
//   User.fromJson(dynamic json) {
//     id = json['id'];
//     name = json['name'];
//     lastName = json['last_name'];
//     phone = json['phone'];
//     email = json['email'];
//     image = json['image'];
//   }
//   int? id;
//   String? name;
//   String? lastName;
//   String? phone;
//   String? email;
//   String? image;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['name'] = name;
//     map['last_name'] = lastName;
//     map['phone'] = phone;
//     map['email'] = email;
//     map['image'] = image;
//     return map;
//   }
// }
