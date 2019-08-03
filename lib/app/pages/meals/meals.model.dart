class MealsModel {
  final String sId;
  int price;
  String image;
  String recipe;
  String name;
  String menuId;
  String createdAt;
  String updatedAt;

  MealsModel(
    this.sId, {
    this.price,
    this.image,
    this.recipe,
    this.name,
    this.menuId,
    this.createdAt,
    this.updatedAt,
  });

  factory MealsModel.fromJson(Map<String, dynamic> json) {
    return MealsModel(
      json['_id'],
      price: json['price'],
      image: json['image'],
      recipe: json['recipe'],
      name: json['name'],
      menuId: json['menu_id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['price'] = this.price;
    data['image'] = this.image;
    data['recipe'] = this.recipe;
    data['name'] = this.name;
    data['menu_id'] = this.menuId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
