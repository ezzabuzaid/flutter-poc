import 'package:flutter/material.dart';
import 'package:learning_flutter/app/core/constants/index.dart';
import 'package:learning_flutter/app/core/helpers/logger.dart';
import 'package:learning_flutter/app/core/helpers/token.dart';
import 'package:learning_flutter/app/core/http/http.dart';
import 'package:learning_flutter/app/locator.dart';
import 'package:learning_flutter/app/shared/models/portal.model.dart';
import 'package:learning_flutter/app/shared/models/user.model.dart';

class UserService {
  final tokenHelper = locator<TokenHelper>();
  Future<void> logout(BuildContext context) async {
    Navigator.of(context).pushNamedAndRemoveUntil(
      RoutesConstants.LOGIN,
      (Route<dynamic> route) => false,
    );
    await tokenHelper.removeToken();
  }

  Future<void> login(LoginModel payload, bool rememberMe) async {
    logger.w('From Button');
    final response = await http.post('portal/login', data: payload.toJson()).then((response) {
      return UserModel.fromJson(response.data);
    });
    if (rememberMe) {
      tokenHelper.setToken(response.token);
    }
  }

  Future<bool> isAuthenticated() async {
    final token = await tokenHelper.getToken();
    return token != null;
    // TODO: use a jwt token to verify that it's not expaired and valid token
  }

  getInformation() {}

  setInformation(UserModel data) {}

  register(RegisterModel payload) {
    return http.post('users', data: payload.toJson());
  }

  Future forgotPassword(ForgetPasswordModel payload) {
    return http.post('portal/forgetpassword', data: payload.toJson());
  }
}
