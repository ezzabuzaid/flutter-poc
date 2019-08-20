class FavoritesModel<T> {
  String id;
  String type;
  String userId;
  String itemId;
  DateTime createdAt;
  DateTime updatedAt;
  T items;

  FavoritesModel({
    this.id,
    this.type,
    this.userId,
    this.itemId,
    this.createdAt,
    this.updatedAt,
    this.items,
  });

  factory FavoritesModel.fromJson(Map<String, dynamic> json) {
    return FavoritesModel(
      id: json["_id"],
      type: json["type"],
      userId: json["user_id"],
      itemId: json["item_id"],
      createdAt: DateTime.parse(json["createdAt"]),
      updatedAt: DateTime.parse(json["updatedAt"]),
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['item_id'] = this.itemId;
    return data;
  }
}
