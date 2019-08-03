import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/app/pages/meals/index.dart';

class MealsDetails extends StatelessWidget {
  final MealsModel meal;
  MealsDetails({Key key, this.meal}) : super(key: key);

  Widget buttonBox(Widget child) {
    return SizedBox(
      height: 25,
      width: 40,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
          bottomRight: Radius.circular(5),
          bottomLeft: Radius.circular(5),
        ),
      ),
      contentPadding: EdgeInsets.all(0),
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          child: CachedNetworkImage(
            imageUrl: this.meal.image,
            colorBlendMode: BlendMode.hardLight,
            color: Colors.black54,
            fit: BoxFit.cover,
            height: 175,
            // placeholder: (context, url) => CircularProgressIndicator(),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    this.meal.name,
                    style: Theme.of(context).textTheme.title,
                  ),
                  IconButton(
                    icon: Icon(Icons.favorite_border),
                    onPressed: () {},
                  )
                ],
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 5)),
              Text(
                this.meal.recipe,
                style: Theme.of(context).textTheme.caption,
              ),
              Divider(
                height: 10,
              ),
              Row(
                children: <Widget>[
                  Text('Quantity', style: Theme.of(context).textTheme.title),
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
                                right: BorderSide(color: Colors.black),
                              ),
                            ),
                            child: FlatButton(
                              padding: EdgeInsets.symmetric(horizontal: 2),
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
                              left: BorderSide(color: Colors.black),
                            ),
                          ),
                          child: FlatButton(
                            padding: EdgeInsets.symmetric(horizontal: 2),
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
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
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
                      color: Theme.of(context).primaryColor,
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
  }
}
