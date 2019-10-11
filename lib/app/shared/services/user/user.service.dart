import 'package:flutter/material.dart';
import 'package:learning_flutter/app/core/constants/index.dart';
import 'package:learning_flutter/app/core/helpers/logger.dart';
import 'package:learning_flutter/app/core/helpers/token.dart';
import 'package:learning_flutter/app/shared/services/user/user.model.dart';
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
    final token = await TokenHelper().getToken();
    logger.w('token $token');
    return token != null;
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
