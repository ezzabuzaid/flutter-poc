import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:country_pickers/countries.dart';
import 'package:country_pickers/country.dart';
import 'package:learning_flutter/app/core/helpers/logger.dart';
import 'package:provider/provider.dart';

class CountryField extends StatelessWidget {
  final Country initialCountry;
  final Function onChange;
  CountryField({
    Key key,
    @required isoCode,
    @required this.onChange,
  })  : assert(isoCode != null),
        assert(onChange != null),
        initialCountry = countryList.firstWhere((el) => el.isoCode == isoCode),
        super(key: key);

  Widget build(BuildContext context) {
    Country country;
    return Provider(
      builder: (BuildContext context) => initialCountry,
      child: DropdownButtonFormField(
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
        value: country ?? initialCountry,
        onChanged: (value) {
          // this.country = value;
          logger.w('Provider.of<Country>(context) ${Provider.of<Country>(context)}');
          final callback = onChange ?? (value) {};
          callback(value);
        },
        items: _buildList(),
      ),
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
