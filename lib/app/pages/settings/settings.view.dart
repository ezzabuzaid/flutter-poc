import 'package:flutter/material.dart';
import '../../layout/index.dart';
import '../../layout/toolbar.dart';

class _SettingBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // CachedNetworkImage(
        //   imageUrl:
        //       'https://i.pinimg.com/originals/21/fd/c5/21fdc52d3b5f3847d2a982f99f419328.png',
        //   colorBlendMode: BlendMode.overlay,
        //   color: Colors.black54,
        //   // height: 200,
        //   fit: BoxFit.cover,
        //   errorWidget: (context, url, error) => Icon(Icons.error),
        // ),
        SwitchListTile(
          value: true,
          onChanged: (v) {},
          title: Text(
            'Night mode'.toUpperCase(),
            style: Theme.of(context).textTheme.subtitle,
          ),
        ),
        Divider(height: 5, color: Colors.grey),
        SwitchListTile(
          value: true,
          onChanged: (v) {},
          title: Text(
            'notification'.toUpperCase(),
            style: Theme.of(context).textTheme.subtitle,
          ),
        ),
        Divider(height: 5, color: Colors.grey),
        // Column(
        //   children: ListTile.divideTiles(
        //     color: Colors.grey,
        //     context: context,
        //     tiles: [
        //       ListTile(
        //         title: Text('Support'),
        //         subtitle: Text('Go to'),
        //       ),
        //     ],
        //   ).toList(),
        // ),
        // ListView.separated(
        //   itemBuilder: (BuildContext context, int index) {
        //     return ListTile(
        //       title: Text('Testsss'),
        //     );
        //   },
        //   itemCount: 1,
        //   separatorBuilder: (BuildContext context, int index) {
        //     return Divider(height: 0);
        //   },
        // )
        ListView.builder(
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Text('Test');
          },
          // itemBuilder: (BuildContext context, int index) {
          //   return Text('Test');
          // },
          // itemCount: 1,
          // separatorBuilder: (BuildContext context, int index) =>
          // Divider(height: 0),
        ),
      ],
    );
  }
}

class SettingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(
        title: 'Settings',
        context: context,
      ),
      drawer: Navigation(),
      body: _SettingBody(),
    );
  }
}
