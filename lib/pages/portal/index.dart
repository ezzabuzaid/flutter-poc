import 'package:flutter/material.dart';
import 'package:learning_flutter/pages/portal/login/login.view.dart';

export './login/login.view.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginForm());
  }
}
