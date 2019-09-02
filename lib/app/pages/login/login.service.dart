import 'dart:convert';
import 'package:learning_flutter/app/core/http/index.dart';
import 'package:learning_flutter/app/pages/login/login.model.dart';

class _LoginService {
  Future login(LoginModel payload) {
    return http
        .post('portal/login/user', body: payload.toJson())
        .then((response) {
      final decoded = json.decode(response.body);
      return decoded['token'];
    });
  }
}

final loginService = _LoginService();
