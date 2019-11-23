import 'package:flutter/material.dart';
import 'package:learning_flutter/app/core/constants/index.dart';
import 'package:learning_flutter/app/partials/logo.dart';
import 'package:learning_flutter/app/widgets/full-width.dart';
import 'package:permission/permission.dart';

class PortalView extends StatelessWidget {
  // void getPermissionStatus() async {
  //   final permission = await PermissionHandler()
  //       .checkPermissionStatus(PermissionGroup.storage);
  //   if (permission == PermissionStatus.granted) {
  //   } else if (permission == PermissionStatus.denied ||
  //       permission == PermissionStatus.disabled ||
  //       permission == PermissionStatus.restricted) {
  //     await PermissionHandler().requestPermissions([PermissionGroup.storage]);
  //     getPermissionStatus();
  //   }
  // }

  // FIXME  PlatformException(ERROR_ALREADY_REQUESTING_PERMISSIONS, A request for permissions is already running, please wait for it to finish before doing another request (note that you can request multiple permissions at the same time)., null)
  requestPermission() {
    return Permission.requestPermissions([
      PermissionName.Calendar,
      PermissionName.Camera,
      PermissionName.Location,
      PermissionName.Phone,
      PermissionName.Storage,
    ]);
  }

  PortalView({Key key}) : super(key: key) {
    requestPermission();
  }

  @override
  Widget build(BuildContext context) {
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
                    key: Key('login_button'),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
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
                      key: Key('register_button'),
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
                  key: Key('visitor_button'),
                  padding: EdgeInsets.all(0),
                  child: Text(
                    'Explore the app as visitor',
                    style: TextStyle(decoration: TextDecoration.underline),
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
