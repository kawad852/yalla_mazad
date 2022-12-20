class PostAddAuctionModel {
  String? name;
  String? content;
  String? startPrice;
  String? endDate;
  String? status;
  String? buyNowPrice;
  String? views;
  String? numberOfBids;
  String? userId;
  String? categoryId;

  PostAddAuctionModel({
    required this.name,
    required this.userId,
    required this.content,
    required this.status,
    required this.views,
    required this.categoryId,
    required this.buyNowPrice,
    required this.endDate,
    required this.numberOfBids,
    required this.startPrice,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['content'] = content;
    data['start_price'] = startPrice;
    data['end_date'] = endDate;
    data['status'] = status;
    data['buy_now_price'] = buyNowPrice;
    data['views'] = views;
    data['number_of_bids'] = numberOfBids;
    data['user_id'] = userId;
    data['category_id'] = categoryId;
    return data;
  }
}
