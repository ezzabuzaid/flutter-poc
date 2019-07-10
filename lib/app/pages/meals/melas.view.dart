import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:learning_flutter/app/layout/index.dart';
import 'package:learning_flutter/app/layout/toolbar.dart';
import 'package:learning_flutter/app/pages/meals/index.dart';
import 'package:learning_flutter/app/pages/meals/meal.model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:learning_flutter/app/partials/meals-details.dart';

class _MealsCard extends StatelessWidget {
  final MealsModel meal;
  _MealsCard(this.meal);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    final addWidget = Padding(
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
    );
    final priceWidget = Card(
      child: Container(
        child: Text('\$ 18.00'),
        padding: EdgeInsets.fromLTRB(10, 3, 10, 3),
      ),
      color: Colors.green,
    );
    const double height = 190;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CachedNetworkImage(
          imageUrl: this.meal.image,
          height: height,
          colorBlendMode: BlendMode.overlay,
          color: Colors.black54,
          width: 125,
          fit: BoxFit.cover,
          // placeholder: (context, url) => CircularProgressIndicator(),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Expanded(
          child: Container(
            height: height,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            // margin: EdgeInsets,
            child: Wrap(
              runSpacing: 15,
              runAlignment: WrapAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          this.meal.name,
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        IconButton(
                          icon: Icon(Icons.favorite_border),
                          onPressed: () {},
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    Text(
                      this.meal.recipe,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[priceWidget, addWidget],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class MealsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String mealId = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: Toolbar('Meals'),
      body: StreamBuilder(
        stream: mealsBloc.fetchMeals(mealId),
        builder:
            (BuildContext context, AsyncSnapshot<List<MealsModel>> snapshot) {
          if (snapshot.hasError) return Text(snapshot.error.toString());
          if (!snapshot.hasData) return const Text('Connecting...');
          return ListView.separated(
            itemBuilder: (BuildContext context, int index) => _MealsCard(
                  snapshot.data[index],
                ),
            itemCount: snapshot.data.length,
            separatorBuilder: (BuildContext context, int index) =>
                Divider(height: 0),
          );
        },
      ),
      drawer: Navigation(),
    );
  }
}
