import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:learning_flutter/app/shared/models/user.model.dart';
import 'package:learning_flutter/app/shared/services/user/user.service.dart';
import '../../layout/index.dart';
import '../../layout/toolbar.dart';

class _AccountBody extends StatelessWidget {
  _AccountBody() {
    UserService().setInformation(UserModel());
  }
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: UserService().getInformation(),
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
        });
  }
}

class AccountView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(context: context),
      drawer: Navigation(),
      body: _AccountBody(),
    );
  }
}
