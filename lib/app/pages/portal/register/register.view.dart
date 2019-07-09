import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/app/pages/portal/portal.bloc.dart';
import 'package:learning_flutter/app/pages/portal/register/register.model.dart';
import 'package:learning_flutter/app/widgets/full-width.dart';
 
class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final bloc = PortalBloc();
  final formKey = GlobalKey<FormState>();
  final payload = RegisterModel();
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
                      this.payload.username = value;
                    },
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    autovalidate: true,
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
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
                      this.payload.email = value;
                    },
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Mobile',
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
                      this.payload.username = value;
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
                      this.payload.password = value;
                    },
                    obscureText: true,
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    focusNode: passwordFocusNode,
                    decoration: InputDecoration(
                      labelText: 'Confirm password',
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
                      // TODO: setup on blur validate for confirm password field
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
                          Text('I agree terms and condition!'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Center(
                    child: FullWidth(
                      child: FlatButton(
                        color: Theme.of(context).primaryColor,
                        onPressed: () {
                          if (this.formKey.currentState.validate()) {
                            formKey.currentState.save();
                            this.bloc.register(payload);
                          }
                        },
                        textColor: Colors.white,
                        child: Text('Register'),
                      ),
                    ),
                  ),
                  Center(
                    child: FlatButton(
                      child: Text(
                        'Already have an account? Login.',
                        style: TextStyle(
                          decoration: TextDecoration.underline,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/portal/register');
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 25),
                    child: Center(
                      child: Text(
                        'Terms fo use. Privacy policy',
                        style: Theme.of(context).textTheme.overline,
                      ),
                    ),
                  ),
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

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  MyApp({Key key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
//  _formKey and _autoValidate

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  String _name;
  String _email;
  String _mobile;
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Form Validation'),
        ),
        body: new SingleChildScrollView(
          child: new Container(
            margin: new EdgeInsets.all(15.0),
            child: new Form(
              key: _formKey,
              autovalidate: _autoValidate,
              child: FormUI(),
            ),
          ),
        ),
      ),
    );
  }
// Here is our Form UI

  Widget FormUI() {
    return new Column(
      children: <Widget>[
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Name'),
          keyboardType: TextInputType.text,
        ),
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Mobile'),
          keyboardType: TextInputType.phone,
        ),
        new TextFormField(
          decoration: const InputDecoration(labelText: 'Email'),
          keyboardType: TextInputType.emailAddress,
        ),
        new SizedBox(
          height: 10.0,
        ),
        new RaisedButton(
          onPressed: _validateInputs,
          child: new Text('Validate'),
        )
      ],
    );
  }

  void _validateInputs() {}
}

