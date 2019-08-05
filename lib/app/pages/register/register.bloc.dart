import 'package:learning_flutter/app/pages/register/register.model.dart';
import 'package:learning_flutter/app/pages/register/register.service.dart';

class _RegisterBloc {
  Future register(RegisterModel payload) {
    return registerService.register(payload);
  }
}

final registerBloc = _RegisterBloc();
