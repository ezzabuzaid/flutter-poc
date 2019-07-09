import 'package:flutter/material.dart';
import 'package:learning_flutter/app/pages/portal/login/login.view.dart';
import 'package:learning_flutter/app/pages/portal/register/register.view.dart';

export './login/login.view.dart';
export './register/register.view.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginForm());
  }
}

class RegisterView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: RegisterForm());
  }
}
