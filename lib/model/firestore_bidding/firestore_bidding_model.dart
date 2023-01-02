class FireStoreBiddingModel {
  int amount;
  String image;
  String name;

  FireStoreBiddingModel({
    required this.amount,
    required this.image,
    required this.name,
  });

  static FireStoreBiddingModel fromJson(Map<String, dynamic> json) {
    return FireStoreBiddingModel(
      amount: json['amount'],
      image: json['image'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'image': image,
      'name': name,
    };
  }
}
