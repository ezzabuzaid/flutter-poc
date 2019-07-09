import 'package:learning_flutter/app/core/http.dart';
import 'package:learning_flutter/app/pages/portal/login/login.model.dart';
import 'package:learning_flutter/app/pages/portal/register/register.model.dart';

class PortalService {
  Future login(LoginModel payload) {
    return http.post('portal/login', body: payload.toJson());
  }

  Future register(RegisterModel payload) {
    return http.post('portal/register', body: payload.toJson());
  }
}
