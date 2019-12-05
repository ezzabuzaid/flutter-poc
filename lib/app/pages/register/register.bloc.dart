import 'package:country_pickers/country.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:learning_flutter/app/shared/models/portal.model.dart';

class RegisterBloc extends ChangeNotifier {
  Placemark placeDetails = Placemark(isoCountryCode: 'AE');
  final payload = RegisterModel();

  void changeCountry(Country country) {
    this.placeDetails = Placemark(country: country.name, isoCountryCode: country.isoCode);
  }

  void password(String value) {
    this.payload.password = value;
  }

  void username(String value) {
    this.payload.username = value;
  }

  void email(String newValue) {
    this.payload.email = newValue;
  }

  void mobile(String newValue) {
    this.payload.mobile = newValue;
  }

  void role(int newValue) {
    this.payload.role = newValue;
  }
}
