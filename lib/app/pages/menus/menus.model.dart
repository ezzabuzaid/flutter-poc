class MenusModel {
  String image;
  String recipe;
  String name;
  final String createdAt;
  final String updatedAt;
  final String sId;

  String get id => this.sId;

  MenusModel(
    this.sId, {
    this.image,
    this.recipe,
    this.name,
    this.createdAt,
    this.updatedAt,
  });

  factory MenusModel.fromJson(Map<String, dynamic> json) {
    return MenusModel(
      json['_id'],
      image: json['image'],
      recipe: json['recipe'],
      name: json['name'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['image'] = this.image;
    data['recipe'] = this.recipe;
    data['name'] = this.name;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
