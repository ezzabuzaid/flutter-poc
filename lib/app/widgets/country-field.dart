import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/countries.dart';
import 'package:country_pickers/country.dart';

class CountryField extends StatefulWidget {
  final Country initialCountry;
  final Function onChange;
  CountryField({
    Key key,
    isoCode,
    @required this.onChange,
  })  : this.initialCountry = countryList.firstWhere((el) => el.isoCode == isoCode),
        super(key: key);

  _CountryFieldState createState() => _CountryFieldState();
}

class _CountryFieldState extends State<CountryField> {
  Country _country;
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
      value: this._country,
      onChanged: (value) {
        this.setState(() {
          this._country = value;
          final function = this.widget.onChange ?? (value) {};
          function(value);
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
