import 'package:learning_flutter/app/pages/login/login.model.dart';
import 'package:learning_flutter/app/pages/login/login.service.dart';

class LoginBloc {
  Future login(LoginModel payload) {
    return loginService.login(payload);
  }
}

final loginBloc = LoginBloc();
