import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:learning_flutter/app/widgets/to-cart.dart';
import '../../layout/index.dart';
import '../../layout/toolbar.dart';
import 'index.dart';

class _MealsCard extends StatelessWidget {
  final MealsModel meal;
  _MealsCard(this.meal);

  @override
  Widget build(BuildContext context) {
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
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Expanded(
          child: Container(
            height: height,
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
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
                    Text(
                      this.meal.recipe,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
                ToCart(
                  meal: this.meal,
                )
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
      appBar: Toolbar(
        title: 'Meals',
        context: context,
      ),
      drawer: Navigation(),
      body: StreamBuilder(
        stream: mealsBloc.fetchMeals(mealId),
        builder:
            (BuildContext context, AsyncSnapshot<List<MealsModel>> snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return _MealsCard(snapshot.data[index]);
            },
            itemCount: snapshot.data.length,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(height: 0);
            },
          );
        },
      ),
    );
  }
}
