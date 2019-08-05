import 'package:learning_flutter/app/core/http.dart';
import 'package:learning_flutter/app/pages/login/login.model.dart';

class _LoginService {
  Future login(LoginModel payload) {
    print(payload.toJson());
    return http.post('portal/login/user', body: payload.toJson()).then((e) {
      print(e.body);
    });
  }
}

final loginService = _LoginService();
