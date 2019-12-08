import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/app/core/helpers/logger.dart';
import 'package:learning_flutter/app/locator.dart';
import 'package:learning_flutter/app/pages/forget-password/forget-password.bloc.dart';
import 'package:learning_flutter/app/shared/misc/widget-utility.dart';
import 'package:learning_flutter/app/widgets/full-width.dart';
import 'package:provider/provider.dart';

class ForgetPassowrdView extends StatelessWidget with WidgetUtility {

  _offset([double height = 30]) {
    return SizedBox(
      height: height,
    );
  }

  submitContinue() async {
    await bloc.canProcces();
  }

  getFieldSuffex(EForgetPasswordState state) {
    switch (state) {
      case EForgetPasswordState.inProgress:
        return SizedBox(child: CircularProgressIndicator(strokeWidth: 2), width: 20, height: 20);

      case EForgetPasswordState.wrong:
        return Icon(Icons.error_outline, color: Colors.red);

      case EForgetPasswordState.passed:
        return Icon(Icons.check, color: Colors.green);
      default:
    }
  }

  ForgetPasswordBloc get bloc => locator<ForgetPasswordBloc>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ChangeNotifierProvider(
        builder: (BuildContext context) => bloc,
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 50),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FractionallySizedBox(
                    widthFactor: 0.25,
                    child: CachedNetworkImage(
                      imageUrl: 'http://www.afabc.org/wp-content/uploads/2016/07/Lock-Icon.png',
                    ),
                  ),
                  _offset(),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Forget Password',
                          style: TextStyle(
                            color: Colors.black87,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        _offset(),
                        Text(
                          'Enter your Username to recovery your password',
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 18, color: Colors.grey.shade800),
                        ),
                      ],
                    ),
                  ),
                  _offset(),
                  Selector<ForgetPasswordBloc, bool>(
                    selector: (ctx, bloc) => bloc.flowState == EForgetPasswordState.wrong,
                    builder: (BuildContext ctx, isWrongState, child) {
                      return showIf(
                        condition: isWrongState,
                        widget: Container(
                          margin: EdgeInsets.only(bottom: 15),
                          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          decoration: BoxDecoration(color: Colors.red.shade100),
                          child: Row(
                            children: <Widget>[
                              Icon(Icons.error, color: Colors.pink.shade700, size: 35),
                              SizedBox(width: 10),
                              Flexible(
                                child: Text(
                                  'Sorry this information does not match our records, Please try again',
                                  style: TextStyle(color: Colors.pink.shade700, fontSize: 16),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                  Selector<ForgetPasswordBloc, EForgetPasswordState>(
                    selector: (ctx, bloc) => bloc.flowState,
                    builder: (BuildContext ctx, isWrongState, child) {
                      return TextFormField(
                        onChanged: bloc.username,
                        decoration: InputDecoration(
                          isDense: true,
                          border: OutlineInputBorder(borderSide: BorderSide(color: Colors.green, width: 0)),
                          labelText: 'Username',
                          suffix: getFieldSuffex(bloc.flowState),
                          // suffixIcon: Icon(Icons.check, color: Colors.green),
                        ),
                      );
                    },
                  ),
                  _offset(),
                  Text(
                    'Forgot your Username',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      decoration: TextDecoration.underline,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  _offset(),
                  Selector<ForgetPasswordBloc, bool>(
                    builder: (BuildContext context, shouldEnable, child) {
                      return FullWidth(
                        child: FlatButton(
                          disabledColor: Theme.of(context).primaryColor.withOpacity(0.3),
                          key: Key('login_button'),
                          color: Theme.of(context).primaryColor,
                          onPressed: shouldEnable ? submitContinue : null,
                          textTheme: ButtonTextTheme.primary,
                          padding: EdgeInsets.all(20),
                          child: Text('Continue', style: TextStyle(fontSize: 20)),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                        ),
                      );
                    },
                    selector: (_, bloc) {
                      return bloc.shouldEnableContinueButton();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
