import 'package:cached_network_image/cached_network_image.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/pages/portal/portal.bloc.dart';
import 'package:learning_flutter/pages/portal/portal.model.dart';
import 'package:learning_flutter/widgets/full-width.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final bloc = PortalBloc();
  final formKey = GlobalKey<FormState>();
  String username = '';
  String password = '';
  FocusNode passwordFocusNode;
  final logoUrl =
      'https://seeklogo.com/images/N/nodejs-logo-FBE122E377-seeklogo.com.png';

  void initState() {
    super.initState();
    passwordFocusNode = new FocusNode();
    passwordFocusNode.addListener(
      () => print('focusNode updated: hasFocus: ${passwordFocusNode.hasFocus}'),
    );
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
            CachedNetworkImage(
              imageUrl: logoUrl,
              fit: BoxFit.contain,
              height: 150,
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    autofocus: true,
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
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter some text';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      this.username = value;
                    },
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    focusNode: passwordFocusNode,
                    decoration: InputDecoration(
                      labelText: 'Password',
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
                      this.password = value;
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
                            onPressed: () {
                              if (this.formKey.currentState.validate()) {
                                formKey.currentState.save();
                                this.bloc.login(
                                      LoginModel(
                                        password: this.password,
                                        username: this.username,
                                      ),
                                    );
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text(
                                    'Username ${this.username} || password ${this.password}',
                                  )),
                                );
                              }
                            },
                            textColor: Colors.white,
                            child: Text('Login'),
                          ),
                        ),
                        FullWidth(
                          child: OutlineButton(
                            child: Text('Signup'),
                            onPressed: () {
                              if (formKey.currentState.validate()) {
                                Scaffold.of(context).showSnackBar(
                                    SnackBar(content: Text('Processing Data')));
                              }
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
