class SearchAdvertisementModel {
  bool? status;
  int? code;
  String? msg;
  List<Data>? data;

  SearchAdvertisementModel({this.status, this.code, this.msg, this.data});

  SearchAdvertisementModel.fromJson(Map<String, dynamic> json) {
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
  String? content;
  int? startPrice;
  String? startDate;
  String? endDate;
  String? status;
  int? buyNowPrice;
  int? views;
  int? numberOfBids;
  String? image;
  User? user;
  Category? category;
  List<Images>? images;

  Data(
      {this.id,
        this.name,
        this.content,
        this.startPrice,
        this.startDate,
        this.endDate,
        this.status,
        this.buyNowPrice,
        this.views,
        this.numberOfBids,
        this.image,
        this.user,
        this.category,
        this.images});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    content = json['content'];
    startPrice = json['start_price'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    status = json['status'];
    buyNowPrice = json['buy_now_price'];
    views = json['views'];
    numberOfBids = json['number_of_bids'];
    image = json['image'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['content'] = this.content;
    data['start_price'] = this.startPrice;
    data['start_date'] = this.startDate;
    data['end_date'] = this.endDate;
    data['status'] = this.status;
    data['buy_now_price'] = this.buyNowPrice;
    data['views'] = this.views;
    data['number_of_bids'] = this.numberOfBids;
    data['image'] = this.image;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category!.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
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
        badges!.add(new Badges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['image'] = this.image;
    data['phone'] = this.phone;
    if (this.badges != null) {
      data['badges'] = this.badges!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Badges {
  int? id;
  String? image;

  Badges({this.id, this.image});

  Badges.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}

class Category {
  int? id;
  String? name;
  String? image;

  Category({this.id, this.name, this.image});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    return data;
  }
}

class Images {
  int? id;
  String? image;
  int? advertisement;

  Images({this.id, this.image, this.advertisement});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    advertisement = json['advertisement'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['advertisement'] = this.advertisement;
    return data;
  }
}
