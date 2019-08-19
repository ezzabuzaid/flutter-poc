import 'package:flutter/material.dart';
import 'package:learning_flutter/app/core/constants.dart';
import 'package:learning_flutter/app/core/helpers/token.dart';
import 'package:rxdart/subjects.dart';

class User {
  factory User() => User._internal();
  User._internal();

  final _subject = BehaviorSubject<UserModel>();

  logout(BuildContext context) async {
    Navigator.of(context).pushNamedAndRemoveUntil(
      RoutesConstants.LOGIN,
      (Route<dynamic> route) => false,
    );
    await TokenHelper().removeToken();
  }

  Future<bool> isAuthenticated() async {
    return (await TokenHelper().getToken()) != null;
    // TODO: use a jwt token to verify that it's not expaired and valid token
  }

  Stream<UserModel> getInformation() {
    return _subject.stream;
  }

  setInformation(UserModel data) {
    _subject.sink.add(data);
  }

  dispose() {
    _subject.close();
  }
}

class UserModel {
  String image =
      'https://i.pinimg.com/originals/21/fd/c5/21fdc52d3b5f3847d2a982f99f419328.png';
}
