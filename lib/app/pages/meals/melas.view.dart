import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:learning_flutter/app/core/helpers/logger.dart';
import 'package:learning_flutter/app/locator.dart';
import 'package:learning_flutter/app/pages/favorites/index.dart';
import 'package:learning_flutter/app/widgets/to-cart.dart';
import 'package:provider/provider.dart';
import '../../layout/index.dart';
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
                          onPressed: () {
                            // TODO: here it should be weather remove or add, find a way to set favorites meals
                            favoritesBloc.addToFavoritesMeals(
                              FavoritesModel(itemId: this.meal.sId),
                            );
                            // TODO: update the icon to be filled, and meal details as well
                          },
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
    return Scaffold(
      appBar: Toolbar(context: context),
      drawer: Navigation(),
      body: ChangeNotifierProvider<MealsBloc>(
        builder: (_) => locator<MealsBloc>(),
        child: Consumer<MealsBloc>(
          builder: (ctx, bloc, child) {
            logger.w('bloc.meals =>${bloc.meals}');
            return ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return _MealsCard(bloc.meals[index]);
              },
              itemCount: bloc.meals.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider(height: 0);
              },
            );
          },
        ),
      ),
    );
  }
}
