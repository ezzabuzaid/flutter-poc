import 'dart:convert';
import 'package:learning_flutter/app/core/helpers/token.dart';
import 'package:learning_flutter/app/core/http.dart';
import 'package:learning_flutter/app/pages/login/login.model.dart';

class _LoginService {
  Future login(LoginModel payload) {
    return http
        .post('portal/login/user', body: payload.toJson())
        .then((response) {
      final token = json.decode(response.body)['token'];
      return TokenHelper().addToken(token);
    });
  }
}

final loginService = _LoginService();
