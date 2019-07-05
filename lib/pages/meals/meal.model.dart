class IMeal {
  String name;
  String recipe;
  String image;
  IMeal({this.recipe, this.name, this.image});
}

class MealModel {
  final List<IMeal> meals = [
    new IMeal(
      name: 'Special Thali - Veg',
      recipe:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s',
      image:
          'https://www.platingpixels.com/wp-content/uploads/2017/04/How-to-Grill-Chicken-Breast-that-are-Moist-and-Tender-recipe-6.jpg',
    ),
    new IMeal(
      name: 'Delux Thali - Veg',
      recipe:
          'vegetables, dal makhani, 3 roti, rice, curd, sald & Paped, vegetables, dal makhani, 3 roti, rice, curd, sald & Paped',
      image:
          'https://girlscangrill.com/wp-content/uploads/2018/10/cast-iron-chicken.jpg',
    ),
    new IMeal(
      name: 'Special Thali - Non Veg',
      recipe:
          'Lorem Ipsum is simply dummy text of the printing and typesetting, vegetables, dal makhani, 3 roti, rice, curd, sald & Paped',
      image:
          'https://www.kaleandcaramel.com/wp-content/uploads/2018/04/citrus-avocado-salad-black-pepper-almonds-12.jpg',
    ),
    new IMeal(
      name: 'Special Thali - Non Veg',
      recipe: 'vegetables, dal makhani, 3 roti, rice, curd, sald & Paped',
      image:
          'https://www.kaleandcaramel.com/wp-content/uploads/2018/04/citrus-avocado-salad-black-pepper-almonds-12.jpg',
    )
  ];
}
