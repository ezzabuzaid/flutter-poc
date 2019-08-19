import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:learning_flutter/app/core/helpers/logger.dart';
import 'package:learning_flutter/app/pages/home/home.bloc.dart';
import 'package:learning_flutter/app/pages/meals/index.dart';
import 'package:learning_flutter/app/pages/menus/index.dart';
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

class HomeBody extends StatelessWidget {
  HomeBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(height: 25),
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 100,
              ),
            ],
          ),
          height: 40,
          child: MenusWidget(),
        ),
        SizedBox(height: 15),
        MealsWidget(),
      ],
    );
  }
}

class MenusWidget extends StatefulWidget {
  MenusWidget({Key key}) : super(key: key);

  _MenusWidgetState createState() => _MenusWidgetState();
}

class _MenusWidgetState extends State<MenusWidget> {
  _MenusWidgetState() {
    // menuBloc.fetchMenus();
  }
  String menuId;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: menuBloc.menus.stream,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final data = snapshot.data;
          homeBloc.getMealsByMenuId(data[0].id);
          menuId = data[0].id;
          return ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 25),
            scrollDirection: Axis.horizontal,
            itemCount: data.length,
            itemBuilder: (BuildContext context, int index) {
              return Row(
                children: <Widget>[
                  FlatButton(
                    color: menuId == data[index].id
                        ? Colors.grey.shade200
                        : Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text(
                      data[index].name,
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        menuId = data[index].id;
                        homeBloc.getMealsByMenuId(data[index].id);
                      });
                    },
                  ),
                  SizedBox(width: 20),
                ],
              );
            },
          );
        });
  }
}

class MealsWidget extends StatelessWidget {
  const MealsWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: homeBloc.meals.stream,
        builder: (context, AsyncSnapshot<List<MealsModel>> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          final data = snapshot.data;
          return Expanded(
            child: GridView.extent(
              children: List.generate(
                data.length,
                (index) {
                  return FullWidth(child: _HomeCard(data[index]));
                },
              ),
              maxCrossAxisExtent: 250,
            ),
          );
        });
  }
}

int count = 0;

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    logger.w('BUILD COUNT ${count++}');
    return Scaffold(
        appBar: Toolbar(context: context),
        drawer: Navigation(),
        body: HomeBody());
  }
}
