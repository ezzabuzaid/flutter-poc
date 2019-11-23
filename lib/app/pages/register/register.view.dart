import 'package:country_pickers/country.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_flutter/app/core/constants/index.dart';
import 'package:learning_flutter/app/core/helpers/logger.dart';
import 'package:learning_flutter/app/locator.dart';
import 'package:learning_flutter/app/pages/portal/portal.bloc.dart';
import 'package:learning_flutter/app/partials/about.dart';
import 'package:learning_flutter/app/partials/logo.dart';
import 'package:learning_flutter/app/shared/misc/current-position.dart';
import 'package:learning_flutter/app/shared/misc/widget-utility.dart';
import 'package:learning_flutter/app/shared/models/portal.model.dart';
import 'package:learning_flutter/app/shared/services/user/user.service.dart';
import 'package:learning_flutter/app/widgets/country-field.dart';
import 'package:learning_flutter/app/widgets/full-width.dart';
import 'package:form_validators/form_validators.dart' as validators;
import 'package:geolocator/geolocator.dart';
import 'package:libphonenumber/libphonenumber.dart' as phone;

class RegisterForm extends StatefulWidget {
  RegisterForm({Key key}) : super(key: key);
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> with WidgetUtility {
  final bloc = PortalBloc();
  final formKey = GlobalKey<FormState>();
  final confirmPasswordKey = GlobalKey<FormFieldState>(debugLabel: 'confirm_password');
  final payload = RegisterModel();
  final Placemark placeDetails = Placemark(isoCountryCode: 'AUS');
  String isoCountryCode;

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  FocusNode confirmPasswordFocusNode = FocusNode();
  Position position;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: FutureBuilder<Placemark>(
// TODO: find a way to test the geolocator getCurrentLocation(placeDetails)
        future: Future.value(placeDetails),
        initialData: placeDetails,
        builder: (BuildContext context, AsyncSnapshot<Placemark> snapshot) {
          isoCountryCode = snapshot?.data?.isoCountryCode;
          return Container(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
            child: Column(
              children: <Widget>[
                // TODO: assert that the logo is ready
                // Logo(),
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
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(16),
                          WhitelistingTextInputFormatter(RegExp(r'^[a-zA-Z0-9_\-\.]+$'))
                        ],
                        onSaved: (value) => this.payload.username = value,
                        onEditingComplete: () => this.setFocus(context),
                        validator: validators.validate([
                          // TODO: Store the string in json (Setup localization)
                          validators.Required('This field is required'),
                        ]),
                      ),
                      SizedBox(height: 25),
                      TextFormField(
                        key: Key('email'),
                        focusNode: emailFocusNode,
                        autovalidate: true,
                        keyboardType: TextInputType.emailAddress,
                        decoration: inputDecoration(context, label: 'Email'),
                        validator: validators.validate([
                          validators.Required('This field is required'),
                          validators.Email('Please enter the email correctly'),
                        ]),
                        onSaved: (value) {
                          this.payload.email = value;
                        },
                      ),
                      SizedBox(height: 25),
                      // TODO: Figure a way to give a custom widget focus node
                      // CountryField(
                      //   key: Key('country'),
                      //   onChange: (Country country) {
                      //     this.isoCountryCode = country.isoCode;
                      //   },
                      //   isoCode: this.isoCountryCode,
                      // ),
                      SizedBox(height: 25),
                      TextFormField(
                        key: Key('mobile'),
                        keyboardType: TextInputType.phone,
                        decoration: inputDecoration(context, label: 'Mobile'),
                        // validator: validators.validate([IsPhoneNumber()]),
                        onSaved: (value) async {
                          this.payload.mobile = value;
                        },
                        onFieldSubmitted: (v) {
                          this.setFocus(context);
                        },
                      ),
                      SizedBox(height: 25),
                      TextFormField(
                        key: Key('password'),
                        focusNode: passwordFocusNode,
                        obscureText: true,
                        decoration: inputDecoration(
                          context,
                          label: 'Password',
                          helperText: 'It should contain at least 8 char, and one uppercase and one lower',
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
                          this.setFocus(context);
                        },
                      ),
                      SizedBox(height: 25),
                      TextFormField(
                        key: confirmPasswordKey,
                        focusNode: confirmPasswordFocusNode,
                        decoration: inputDecoration(context, label: 'Confirm password'),
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
                            this.setFocus(context, this.confirmPasswordFocusNode);
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
                                this.payload.mobile = await phone.PhoneNumberUtil.normalizePhoneNumber(
                                    isoCode: 'JO', phoneNumber: this.payload.mobile);
                                final response = await locator<UserService>().register(payload);
                                String message =
                                    'Successfully registerd, please see you email to verify your account and then come to login';
                                if (response.code >= 400 || response.code < 500) {
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
                            style: TextStyle(decoration: TextDecoration.underline),
                          ),
                          onPressed: () {
                            Navigator.pushReplacementNamed(context, RoutesConstants.LOGIN);
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
    confirmPasswordFocusNode.dispose();
    emailFocusNode.dispose();
    super.dispose();
  }
}

// TODO Find a way to do the async validation
// TODO move the validation to validation module
class IsPhoneNumber implements validators.IValidator {
  final isoCode;
  IsPhoneNumber(this.isoCode);
  @override
  call(String value) async {
    final belong = await phone.PhoneNumberUtil.isValidPhoneNumber(
      isoCode: isoCode,
      phoneNumber: value,
    );
    return !belong;
  }

  @override
  String get message => 'Test messsgae';
}

class RegisterView extends StatelessWidget {
  static final globalKey = GlobalKey<_RegisterFormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: RegisterForm(key: globalKey));
  }
}
