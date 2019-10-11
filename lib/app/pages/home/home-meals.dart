import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:learning_flutter/app/pages/home/home.bloc.dart';
import 'package:learning_flutter/app/pages/meals/index.dart';
import 'package:learning_flutter/app/widgets/full-width.dart';
import 'package:learning_flutter/app/widgets/to-cart.dart';
import 'package:provider/provider.dart';

class MealsWidget extends StatelessWidget {
  const MealsWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeBloc>(builder: (c, bloc, x) {
      // TODO: if there's not meals an error thrown, so it should be handled by filtering out the empty menus or by showing an empty icon or whatever
      return Expanded(
        child: GridView.extent(
          children: List.generate(
            bloc.meals.length,
            (index) {
              return FullWidth(child: Text('test'));
            },
          ),
          maxCrossAxisExtent: 250,
        ),
      );
    });
  }
}

class _HomeCard extends StatelessWidget {
  final MealsModel meal;
  _HomeCard(this.meal);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: .9,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        elevation: 3,
        borderOnForeground: true,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ClipOval(
              child: CachedNetworkImage(
                imageUrl: this.meal.image,
                colorBlendMode: BlendMode.overlay,
                color: Colors.black54,
                fit: BoxFit.fill,
                height: 65,
                width: 65,
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            ),
            Column(
              children: <Widget>[
                Text(
                  this.meal.name,
                  style: Theme.of(context).textTheme.subtitle,
                ),
                Text('Menu name'),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ToCart(meal: this.meal),
            )
          ],
        ),
      ),
    );
  }
}
