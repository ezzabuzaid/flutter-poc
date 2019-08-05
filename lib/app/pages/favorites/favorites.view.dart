import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:learning_flutter/app/pages/favorites/index.dart';
import 'package:learning_flutter/app/pages/meals/index.dart';
import '../../layout/index.dart';
import '../../layout/toolbar.dart';
import '../../partials/meals-details.dart';

class _ItemCard extends StatelessWidget {
  final MealsModel item;
  _ItemCard(this.item);

  @override
  Widget build(BuildContext context) {
    Color primaryColor = Theme.of(context).primaryColor;
    const double height = 190;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CachedNetworkImage(
          imageUrl: this.item.image,
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
                          this.item.name,
                          style: Theme.of(context).textTheme.subtitle,
                        ),
                        IconButton(
                          icon: Icon(Icons.favorite_border),
                          onPressed: () {},
                        )
                      ],
                    ),
                    Text(
                      this.item.recipe,
                      style: Theme.of(context).textTheme.caption,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Card(
                      child: Container(
                        child: Text('\$ 18.00'),
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
                                return MealsDetails(meal: this.item);
                              },
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class _FavoritesBody extends StatelessWidget {
  const _FavoritesBody({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<MealsModel>>(
      stream: favoritesBloc.fetchFavorites().stream,
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
            return _ItemCard(snapshot.data[index]);
          },
          itemCount: snapshot.data.length,
          separatorBuilder: (BuildContext context, int index) {
            return Divider(height: 0);
          },
        );
      },
    );
  }
}

class FavoritesView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(
        title: 'Favorites',
        context: context,
      ),
      drawer: Navigation(),
      body: _FavoritesBody(),
    );
  }
}

// class BottomBar extends StatelessWidget {
//   const BottomBar({Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return BottomNavigationBar(
//       currentIndex: 0,
//       items: [
//         BottomNavigationBarItem(
//           title: Text('List'),
//           icon: GestureDetector(
//             child: Icon(Icons.list),
//             onTap: () {
//               Navigator.pushReplacementNamed(
//                 context,
//                 RoutesConstants.OLHC,
//               );
//             },
//           ),
//         ),
//         BottomNavigationBarItem(
//           title: Text('Chart'),
//           icon: GestureDetector(
//             child: Icon(Icons.multiline_chart),
//             onTap: () {
//               Navigator.pushReplacementNamed(
//                 context,
//                 RoutesConstants.OLHC_CHART,
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
