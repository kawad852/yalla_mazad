class AddAdvertisementToFavoritesModel {
  bool? status;
  int? code;
  String? msg;
  Data? data;

  AddAdvertisementToFavoritesModel(
      {this.status, this.code, this.msg, this.data});

  AddAdvertisementToFavoritesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    code = json['code'];
    msg = json['msg'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['code'] = code;
    data['msg'] = msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  User? user;
  Advertisement? advertisement;

  Data({this.id, this.user, this.advertisement});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    advertisement = json['advertisement'] != null
        ? Advertisement.fromJson(json['advertisement'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (advertisement != null) {
      data['advertisement'] = advertisement!.toJson();
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
        badges!.add(Badges.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['image'] = image;
    data['phone'] = phone;
    if (badges != null) {
      data['badges'] = badges!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['image'] = image;
    return data;
  }
}

class Advertisement {
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

  Advertisement(
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

  Advertisement.fromJson(Map<String, dynamic> json) {
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
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['content'] = content;
    data['start_price'] = startPrice;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['status'] = status;
    data['buy_now_price'] = buyNowPrice;
    data['views'] = views;
    data['number_of_bids'] = numberOfBids;
    data['image'] = image;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (images != null) {
      data['images'] = images!.map((v) => v.toJson()).toList();
    }
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
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
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
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['image'] = image;
    data['advertisement'] = advertisement;
    return data;
  }
}
