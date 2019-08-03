import 'package:learning_flutter/app/core/helpers/logger.dart';
import 'package:learning_flutter/app/core/http.dart';
import 'package:learning_flutter/app/pages/portal/login/login.model.dart';
import 'package:learning_flutter/app/pages/portal/register/register.model.dart';
import 'package:learning_flutter/app/shared/response.dart';

class PortalService {
  Future login(LoginModel payload) {
    print(payload.toJson());
    return http.post('portal/login/user', body: payload.toJson()).then((e) {
      print(e.body);
    });
  }

  Future register(RegisterModel payload) async {
    // print(payload.toJson());
    // final response =await http.post('users', body: payload.toJson());
    // return Response.fromJson(response.body);
    return http.post('users', body: payload.toJson());
  }
}
