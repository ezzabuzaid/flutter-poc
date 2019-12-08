import 'dart:convert';

class UserModel {
  String image =
      'https://i.pinimg.com/originals/21/fd/c5/21fdc52d3b5f3847d2a982f99f419328.png';
  final String token;

  UserModel({this.token});

  factory UserModel.fromJson(String encodedJson) {
    return UserModel(token: json.decode(encodedJson)['token']);
  }
}
