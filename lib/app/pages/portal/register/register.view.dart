import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_flutter/app/core/constants.dart';
import 'package:learning_flutter/app/core/helpers/logger.dart';
import 'package:learning_flutter/app/pages/portal/portal.bloc.dart';
import 'package:learning_flutter/app/pages/portal/register/register.model.dart';
import 'package:learning_flutter/app/partials/about.dart';
import 'package:learning_flutter/app/partials/logo.dart';
import 'package:learning_flutter/app/widgets/country-field.dart';
import 'package:learning_flutter/app/widgets/full-width.dart';
import 'package:form_validators/form_validators.dart' as validators;
import 'package:geolocator/geolocator.dart';
import 'package:libphonenumber/libphonenumber.dart' as phone;
import 'package:permission_handler/permission_handler.dart';
import 'package:system_setting/system_setting.dart' as system;
// await system.SystemSetting.goto(system.SettingTarget.LOCATION);

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final bloc = PortalBloc();
  final formKey = GlobalKey<FormState>();
  final confirmPasswordKey = GlobalKey<FormFieldState>();
  final payload = RegisterModel();
  FocusNode emailFocusNode = FocusNode();
  FocusNode countryFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();
  Position position;
  List<Placemark> placeDetails;
  String isoCountryCode;

  Future<List<Placemark>> getCurrentLocation() {
    return Geolocator().isLocationServiceEnabled().then((value) {
      if (value) {
        return Geolocator()
            .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      } else {
        return throw Error();
      }
    }).then(Geolocator().placemarkFromPosition);
  }

  void initState() {
    super.initState();
  }

  void setFocus(node) {
    FocusScope.of(context).requestFocus(node);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder(
        future: this.getCurrentLocation(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Placemark>> snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.hasError.toString());
          }
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          this.isoCountryCode = snapshot?.data[0].isoCountryCode;
          return Container(
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
                      CountryField(
                        onChange: (Country country) {
                          this.isoCountryCode = country.isoCode;
                        },
                        isoCode: this.isoCountryCode,
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
                        // validator: validators.validate([IsPhoneNumber()]),
                        onSaved: (value) async {
                          this.payload.mobile = value;
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
                        key: confirmPasswordKey,
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
                        validator: validators.validate(
                          [
                            validators.Equals(
                              this.payload.password,
                              "Passwords doesn't matches",
                            ),
                          ],
                        ),
                        onFieldSubmitted: (value) {
                          this.formKey.currentState.save();
                          if (this.payload.password != value) {
                            this.setFocus(this.confirmPasswordFocusNode);
                          }
                          this.confirmPasswordKey.currentState.validate();
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
                            onPressed: () async {
                              if (this.formKey.currentState.validate()) {
                                formKey.currentState.save();
                                this.payload.mobile =
                                    await phone.PhoneNumberUtil
                                        .normalizePhoneNumber(
                                            isoCode: 'JO',
                                            phoneNumber: this.payload.mobile);
                                final response =
                                    await this.bloc.register(payload);
                                String message =
                                    'Successfully registerd, please see you email to verify your account and then come to login';
                                if (response.code >= 400 ||
                                    response.code < 500) {
                                  message =
                                      'Request shouldnt go to server unless email, username and mobile validated async as well you need to send verifcation to email';
                                } else {
                                  Navigator.pushNamed(
                                    context,
                                    RoutesConstants.LOGIN,
                                  );
                                }
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(message),
                                  ),
                                );
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
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                                context, RoutesConstants.LOGIN);
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
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    passwordFocusNode.dispose();
    super.dispose();
  }
}

// TODO Find a way to do the async validation
// TODO move the validation to validation module
class IsPhoneNumber implements validators.IValidator {
  @override
  call(String value) async {
    final belong = await phone.PhoneNumberUtil.isValidPhoneNumber(
      isoCode: 'JO',
      phoneNumber: value,
    );
    return !belong;
  }

  @override
  String get message => 'Test messsgae';
}
