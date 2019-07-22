import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:libphonenumber/libphonenumber.dart' as phone;
// import 'package:country_code_picker/country_code_picker.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/countries.dart';
import 'package:country_pickers/country.dart';

class CountryField extends StatefulWidget {
  final FocusNode focusNode;
  CountryField({Key key, this.focusNode}) : super(key: key);

  _CountryFieldState createState() => _CountryFieldState();
}

class _CountryFieldState extends State<CountryField> {
  Country selectedCountry;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: 'Country',
        labelStyle: Theme.of(context).textTheme.body1,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: .5,
          ),
        ),
      ),
      value: this.selectedCountry,
      onChanged: (value) {
        this.setState(() {
          this.selectedCountry = value;
        });
      },
      items: this._buildList(),
    );
  }

  _buildList() {
    return countryList
        .map(
          (country) => DropdownMenuItem<Country>(
                value: country,
                child: Row(
                  children: <Widget>[
                    CountryPickerUtils.getDefaultFlagImage(country),
                    SizedBox(width: 8.0),
                    Text(
                      "(${country.isoCode}) +${country.phoneCode}",
                    ),
                  ],
                ),
              ),
        )
        .toList();
  }
}
