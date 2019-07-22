import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_flutter/app/pages/portal/portal.bloc.dart';
import 'package:learning_flutter/app/pages/portal/register/register.model.dart';
import 'package:learning_flutter/app/partials/about.dart';
import 'package:learning_flutter/app/partials/logo.dart';
import 'package:learning_flutter/app/routes.dart';
import 'package:learning_flutter/app/widgets/country-field.dart';
import 'package:learning_flutter/app/widgets/full-width.dart';
import 'package:learning_flutter/app/shared/validators.dart' as validators;

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final bloc = PortalBloc();
  final formKey = GlobalKey<FormState>();
  final payload = RegisterModel();
  FocusNode emailFocusNode = FocusNode();
  FocusNode countryFocusNode = FocusNode();
  FocusNode mobileFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();

  void initState() {
    // phone.RegionInfo()
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
                    inputFormatters: [
                      LengthLimitingTextInputFormatter(16),
                      // WhitelistingTextInputFormatter(RegExp(r'^[a-zA-Z0-9_\-\.]+$'))
                      // TODO prevent special char
                    ],
                    onFieldSubmitted: (v) {
                      this.setFocus(this.emailFocusNode);
                    },
                    validator: validators.validate([
                      validators.Required('This field is required'),
                      validators.Between(
                        'Username must be between 8 and 16 char',
                        max: 16,
                        min: 8,
                      ),
                    ]),
                    onSaved: (value) {
                      this.payload.username = value;
                    },
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    focusNode: emailFocusNode,
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
                    validator: validators.validate([
                      validators.Required('This field is required'),
                      validators.Email('Please enter the email correctly'),
                    ]),
                    onFieldSubmitted: (v) {
                      this.setFocus(this.countryFocusNode);
                    },
                    onSaved: (value) {
                      this.payload.email = value;
                    },
                  ),
                  SizedBox(height: 25),
                  CountryField(),
                  SizedBox(height: 25),
                  TextFormField(
                    focusNode: this.mobileFocusNode,
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
                      // TODO Find a way to do the async validation
                      // TODO move the validation to validation module
                      // phone.PhoneNumberUtil.isValidPhoneNumber(
                      //   isoCode: this.selectedCountry.isoCode,
                      //   phoneNumber: value,
                      // );
                      return null;
                    },
                    onSaved: (value) {
                      this.payload.username = value;
                    },
                    onFieldSubmitted: (v) {
                      this.setFocus(this.passwordFocusNode);
                    },
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    focusNode: passwordFocusNode,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      helperText:
                          'It should contain at least 8 char, and one uppercase and one lower',
                      isDense: true,
                      labelStyle: Theme.of(context).textTheme.body1,
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.grey.shade300,
                          width: .5,
                        ),
                      ),
                    ),
                    // TODO Password char check if it has uppercase and lowercase
                    validator: validators.validate([
                      validators.Required(),
                      validators.MinLength(8),
                    ]),
                    onSaved: (value) {
                      this.payload.password = value;
                    },
                    onFieldSubmitted: (v) {
                      this.setFocus(this.confirmPasswordFocusNode);
                    },
                  ),
                  SizedBox(height: 25),
                  TextFormField(
                    focusNode: confirmPasswordFocusNode,
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
                                    onChanged: (bool value) {
                                      // TODO Implement rememeber me feature
                                    },
                                    value: true,
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
                        Navigator.pushNamed(context, RoutesConstants.LOGIN);
                      },
                    ),
                  ),
                  Center(
                    child: FlatButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => About(),
                        );
                      },
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
