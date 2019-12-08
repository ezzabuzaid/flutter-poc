import 'package:flutter/material.dart';
import 'package:learning_flutter/app/core/helpers/logger.dart';
import 'package:learning_flutter/app/locator.dart';
import 'package:learning_flutter/app/shared/models/portal.model.dart';
import 'package:learning_flutter/app/shared/services/user/user.service.dart';

enum EForgetPasswordState {
  initial,
  wrong,
  inProgress,
  passed,
}

class ForgetPasswordBloc extends ChangeNotifier {
  final payload = ForgetPasswordModel();

  EForgetPasswordState flowState = EForgetPasswordState.initial;

  username(String value) {
    payload.username = value;
    notifyListeners();
  }

  Future<void> canProcces() async {
    flowState = EForgetPasswordState.inProgress;
    try {
      await UserService().forgotPassword(payload);
      flowState = EForgetPasswordState.passed;
      print('success');
    } catch (error) {
      print('error');
      flowState = EForgetPasswordState.wrong;
    }
    this.notifyListeners();
  }

  bool shouldEnableContinueButton() {
    return payload.username != '';
  }
}
