import 'package:flutter/widgets.dart';

class FullWidth extends StatelessWidget {
  const FullWidth({Key key, this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: child,
    );
  }
}
