class FavoritesModel<T> {
  String sId;
  String type;
  String userId;
  String itemId;
  String createdAt;
  String updatedAt;
  T items;

  FavoritesModel({
    this.sId,
    this.type,
    this.userId,
    this.itemId,
    this.createdAt,
    this.updatedAt,
    this.items,
  });

  FavoritesModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    type = json['type'];
    userId = json['user_id'];
    itemId = json['item_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['item_id'] = this.itemId;
    return data;
  }
}
