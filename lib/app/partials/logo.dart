import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

// TODO: not tested
// it should be tested when online and offline to see the result
class Logo extends StatelessWidget {
  const Logo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: 'https://bit.ly/2Gjlh3y',
      fit: BoxFit.cover,
      height: 150,
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
