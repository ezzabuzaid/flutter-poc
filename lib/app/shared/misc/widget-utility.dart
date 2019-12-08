import 'package:flutter/material.dart';

class WidgetUtility {
  void setFocus(BuildContext context, [FocusNode node]) {
    node == null
        ? FocusScope.of(context).focusInDirection(TraversalDirection.down)
        : FocusScope.of(context).requestFocus(node);
  }

  Widget showIf({bool condition, Widget widget, elseWidget}) {
    return condition == true ? widget : elseWidget ?? Container();
  }
}

inputDecoration(BuildContext context, {String label, String helperText = ''}) {
  return InputDecoration(
    labelText: label,
    isDense: true,
    helperText: helperText,
    labelStyle: Theme.of(context).textTheme.body1,
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.shade300,
        width: .5,
      ),
    ),
  );
}
