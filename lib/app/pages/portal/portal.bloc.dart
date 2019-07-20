import 'package:learning_flutter/app/pages/portal/login/login.model.dart';
import 'package:learning_flutter/app/pages/portal/register/register.model.dart';

import 'portal.service.dart';

class PortalBloc {
  final _service = PortalService();

 Future login(LoginModel payload) {
    return this._service.login(payload);
  }

  register(RegisterModel payload) {
    this._service.register(payload);
  }
}

final portalBloc = PortalBloc();
