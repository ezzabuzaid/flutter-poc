import 'package:flutter/material.dart';
import 'package:learning_flutter/app/pages/meals/meals.model.dart';
import 'package:learning_flutter/app/partials/meals-details.dart';

class ToCart extends StatelessWidget {
  final MealsModel meal;
  ToCart({this.meal});

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Card(
          child: Container(
            child: Text('\$ ${this.meal.price}'),
            padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
          ),
          color: Colors.green,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: SizedBox(
            height: 25,
            width: 55,
            child: OutlineButton(
              borderSide: BorderSide(width: 1, color: primaryColor),
              color: primaryColor,
              child: Text(
                'Add',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return MealsDetails(meal: this.meal);
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
