import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:learning_flutter/layout/navigation.dart';
import 'package:learning_flutter/layout/toolbar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:learning_flutter/pages/meals/meal.model.dart';

class _MealsCard extends StatelessWidget {
  final MealsModel meal;
  _MealsCard(this.meal);

  Widget buttonBox(Widget child) {
    return SizedBox(
      height: 25,
      width: 40,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    final subtitle = Text(
      this.meal.recipe,
      style: Theme.of(context).textTheme.caption,
    );

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
                builder: ((BuildContext context) {
                  return SimpleDialog(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(10)),
                    ),
                    contentPadding: EdgeInsets.all(0),
                    children: <Widget>[
                      CachedNetworkImage(
                        imageUrl: this.meal.image,
                        colorBlendMode: BlendMode.overlay,
                        color: Colors.black54,
                        fit: BoxFit.cover,
                        height: 150,
                        // placeholder: (context, url) => CircularProgressIndicator(),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                      Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(this.meal.name,
                                style: Theme.of(context).textTheme.title),
                            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
                            subtitle,
                            Divider(
                              height: 10,
                            ),
                            Row(
                              children: <Widget>[
                                Text('Quantity',
                                    style: Theme.of(context).textTheme.title),
                                Container(
                                  margin: EdgeInsets.only(left: 15),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(3),
                                      border: Border.all(width: 1)),
                                  child: Row(
                                    children: <Widget>[
                                      buttonBox(
                                        Container(
                                          decoration: BoxDecoration(
                                            border: Border(
                                              right: BorderSide(
                                                  color: Colors.black),
                                            ),
                                          ),
                                          child: FlatButton(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2),
                                            onPressed: null,
                                            child: Icon(Icons.remove, size: 13),
                                            color: Colors.green,
                                          ),
                                        ),
                                      ),
                                      buttonBox(Center(child: Text('2'))),
                                      buttonBox(Container(
                                        decoration: BoxDecoration(
                                          border: Border(
                                            left:
                                                BorderSide(color: Colors.black),
                                          ),
                                        ),
                                        child: FlatButton(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 2),
                                          onPressed: null,
                                          child: Icon(Icons.add, size: 13),
                                          color: Colors.green,
                                        ),
                                      )),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 10),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  flex: 2,
                                  child: OutlineButton(
                                    color: Colors.black,
                                    textColor: Colors.black,
                                    borderSide: BorderSide(color: Colors.black),
                                    onPressed: () {},
                                    child: Center(
                                      child: Text('Close'),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: FlatButton(
                                    color: primaryColor,
                                    textColor: Colors.white,
                                    child: Text('Add to cart'),
                                    onPressed: () {},
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                }));
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
                    Text(this.meal.name,
                        style: Theme.of(context).textTheme.subtitle),
                    Padding(padding: EdgeInsets.symmetric(vertical: 10)),
                    subtitle
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[priceWidget, addWidget],
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
      appBar: Toolbar('Meals'),
      body: Text('context')
      //  ListView.separated(
      //   itemBuilder: (BuildContext context, int index) {
      //     return _MealsCard(manager.model.meals[index]);
      //   },
      //   itemCount: manager.model.meals.length,
      //   separatorBuilder: (BuildContext context, int index) =>
      //       Divider(height: 0),
      // )
      ,
      drawer: Navigation(),
    );
  }
}
