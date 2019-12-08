import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:form_validators/form_validators.dart';
import 'package:learning_flutter/app/core/constants/index.dart';
import 'package:learning_flutter/app/locator.dart';
import 'package:learning_flutter/app/partials/logo.dart';
import 'package:learning_flutter/app/shared/misc/widget-utility.dart';
import 'package:learning_flutter/app/shared/models/portal.model.dart';
import 'package:learning_flutter/app/shared/services/user/user.service.dart';
import 'package:learning_flutter/app/widgets/full-width.dart';

class LoginForm extends StatefulWidget {
  LoginForm({Key key}) : super(key: key);
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> with WidgetUtility {
  final formKey = GlobalKey<FormState>();
  final payload = LoginModel();
  final passwordFocusNode = new FocusNode();
  bool rememberMe = true;
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
        child: Column(
          children: <Widget>[
            Logo(),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    key: Key('username'),
                    autofocus: true,
                    textInputAction: TextInputAction.next,
                    decoration: inputDecoration(context, label: 'Username'),
                    onSaved: (value) => this.payload.username = value,
                    onEditingComplete: () => this.setFocus(context),
                    validator: validate([Required('This field is required')]),
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    key: Key('password'),
                    focusNode: passwordFocusNode,
                    decoration: inputDecoration(context, label: 'Password'),
                    onSaved: (value) => this.payload.password = value,
                    validator: validate([Required('This field is required')]),
                    obscureText: true,
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            child: FormField(
                              builder: (context) => Checkbox(
                                onChanged: (bool value) {
                                  setState(() {
                                    rememberMe = value;
                                  });
                                },
                                value: rememberMe,
                              ),
                            ),
                            width: 20,
                          ),
                          SizedBox(width: 10),
                          Text('Remember me!'),
                        ],
                      ),
                      FlatButton(
                        padding: EdgeInsets.all(0),
                        child: Text(
                          'Forgot password',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RoutesConstants.FORGET_PASSWORD);
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: Column(
                      children: <Widget>[
                        FullWidth(
                          child: FlatButton(
                            key: Key('login_button'),
                            color: Theme.of(context).primaryColor,
                            onPressed: () async {
                              if (this.formKey.currentState.validate()) {
                                formKey.currentState.save();
                                final user = locator<UserService>();
                                await user.login(this.payload, this.rememberMe);
                                await Navigator.pushReplacementNamed(
                                  context,
                                  RoutesConstants.Home,
                                );
                              }
                            },
                            textColor: Colors.white,
                            child: Text('Login'),
                          ),
                        ),
                        FullWidth(
                          child: OutlineButton(
                            key: Key('register_button'),
                            child: Text('Register'),
                            onPressed: () {
                              Navigator.popAndPushNamed(
                                context,
                                RoutesConstants.REGISTER,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {},
                        color: Color(0xFF3B5998),
                        textColor: Colors.white,
                        child: Icon(EvaIcons.facebook),
                      ),
                      RaisedButton(
                        onPressed: () {},
                        textColor: Colors.white,
                        color: Color(0xFFDD4B39),
                        child: Icon(EvaIcons.google),
                      ),
                      RaisedButton(
                        textColor: Colors.white,
                        onPressed: () {},
                        child: Icon(EvaIcons.github),
                        color: Color(0xFF444444),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    passwordFocusNode.dispose();
    super.dispose();
  }
}

class LoginView extends StatelessWidget {
  static final globalKey = GlobalKey<_LoginFormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: LoginForm(key: globalKey));
  }
}
