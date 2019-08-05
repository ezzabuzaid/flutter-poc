import 'package:flutter/material.dart';
import 'package:learning_flutter/app/partials/logo.dart';
import 'package:learning_flutter/app/widgets/full-width.dart';

class PortalView extends StatelessWidget {
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
                    onPressed: () {},
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
                      onPressed: () {},
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
