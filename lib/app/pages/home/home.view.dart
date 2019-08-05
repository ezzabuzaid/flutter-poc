import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:learning_flutter/app/pages/meals/index.dart';
import 'package:learning_flutter/app/widgets/full-width.dart';
import 'package:learning_flutter/app/widgets/to-cart.dart';
import '../../layout/index.dart';
import '../../layout/toolbar.dart';

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

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(
        title: 'Home',
        context: context,
      ),
      drawer: Navigation(),
      body: StreamBuilder(
        stream: mealsBloc.fetchMeals(null),
        builder:
            (BuildContext context, AsyncSnapshot<List<MealsModel>> snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final data = snapshot.data;
          return GridView.extent(
            children: List.generate(
              data.length,
              (index) {
                return FullWidth(child: _HomeCard(data[index]));
              },
            ),
            maxCrossAxisExtent: 250,
            // mainAxisSpacing: 10,
          );
        },
      ),
    );
  }
}
