import 'package:flutter/material.dart';
import 'package:learning_flutter/app/core/constants/index.dart';
import 'package:learning_flutter/app/partials/logo.dart';
import 'package:learning_flutter/app/widgets/full-width.dart';
import 'package:permission_handler/permission_handler.dart' as permission;

class PortalView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    permission.PermissionHandler().requestPermissions([
      permission.PermissionGroup.camera,
      permission.PermissionGroup.location,
      permission.PermissionGroup.phone,
      permission.PermissionGroup.photos,
      permission.PermissionGroup.storage,
      permission.PermissionGroup.speech,
    ]);
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 30,
          horizontal: 50,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Center(
              child: Logo(),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Flutter',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'is',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Awesome',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                FullWidth(
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.all(20),
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushNamed(context, RoutesConstants.LOGIN);
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Yoy don't have an account?"),
                    FlatButton(
                      padding: EdgeInsets.all(0),
                      child: Text(
                        'Register here.',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, RoutesConstants.REGISTER);
                      },
                    )
                  ],
                ),
                FlatButton(
                  padding: EdgeInsets.all(0),
                  child: Text(
                    'Explore the app as visitor',
                    // style: Theme.of(context).textTheme.button,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, RoutesConstants.Home);
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
