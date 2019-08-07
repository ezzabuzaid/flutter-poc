import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/app/shared/user.dart';
import '../../layout/index.dart';
import '../../layout/toolbar.dart';

class _AccountBody extends StatelessWidget {
  _AccountBody(){
    User().setInformation(UserModel());
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: User().getInformation(),
      builder: (context, AsyncSnapshot<UserModel> snapshot) {
        return Column(
          children: <Widget>[
            CachedNetworkImage(
              imageUrl: snapshot.data.image,
              colorBlendMode: BlendMode.overlay,
              color: Colors.black54,
              // height: 200,
              fit: BoxFit.cover,
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ],
        );
      }
    );
  }
}

class AccountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(
        title: 'Account',
        context: context,
      ),
      drawer: Navigation(),
      body: _AccountBody(),
    );
  }
}
