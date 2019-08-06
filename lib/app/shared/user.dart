import 'package:flutter/material.dart';
import 'package:learning_flutter/app/core/constants.dart';
import 'package:learning_flutter/app/core/helpers/token.dart';
import 'package:rxdart/subjects.dart';

class User {
  factory User() => User._internal();
  User._internal();

  final _subject = BehaviorSubject();

  logout(BuildContext context) async {
    Navigator.of(context).pushNamedAndRemoveUntil(
      RoutesConstants.LOGIN,
      (Route<dynamic> route) => false,
    );
    await TokenHelper().removeToken();
  }

  isAuthenticated() async {
    return (await TokenHelper().getToken()) != null;
    // TODO: use a jwt token to verify that it's not expaired and valid token
  }

  getInformation() {
    return _subject.stream;
  }

  setInformation(data) {
    _subject.sink.add(data);
  }

  dispose() {
    _subject.close();
  }
}
