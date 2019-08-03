import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/app/core/constants.dart';
import 'package:learning_flutter/app/pages/portal/login/login.model.dart';
import 'package:learning_flutter/app/pages/portal/portal.bloc.dart';
import 'package:learning_flutter/app/partials/logo.dart';
import 'package:learning_flutter/app/routes.dart';
import 'package:learning_flutter/app/widgets/full-width.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final bloc = PortalBloc();
  final formKey = GlobalKey<FormState>();
  final payload = LoginModel();
  final passwordFocusNode = new FocusNode();

  void initState() {
    super.initState();
  }

  void setFocus(node) {
    FocusScope.of(context).requestFocus(node);
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
                    decoration: InputDecoration(
                      labelText: 'Username',
                      isDense: true,
                      labelStyle: Theme.of(context).textTheme.body1,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: .5,
                        ),
                      ),
                    ),
                    onSaved: (value) {
                      this.payload.username = value;
                    },
                    onEditingComplete: () {
                      this.setFocus(this.passwordFocusNode);
                    },
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    focusNode: passwordFocusNode,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      isDense: true,
                      labelStyle: Theme.of(context).textTheme.body1,
                      helperStyle: TextStyle(fontSize: 10),
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: .5,
                        ),
                      ),
                    ),
                    onSaved: (value) {
                      this.payload.password = value;
                    },
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
                                onChanged: (bool value) {},
                                value: false,
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
                          style: TextStyle(fontWeight: FontWeight.normal),
                        ),
                        onPressed: () {},
                      )
                    ],
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: Column(
                      children: <Widget>[
                        FullWidth(
                          child: FlatButton(
                            color: Theme.of(context).primaryColor,
                            onPressed: () async {
                              if (this.formKey.currentState.validate()) {
                                formKey.currentState.save();
                                this.bloc.login(this.payload);
                              }
                            },
                            textColor: Colors.white,
                            child: Text('Login'),
                          ),
                        ),
                        FullWidth(
                          child: OutlineButton(
                            child: Text('Register'),
                            onPressed: () {
                              Navigator.pushNamed(
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
