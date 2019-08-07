import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:learning_flutter/app/app.dart';
import 'package:learning_flutter/app/core/auth.service.dart';
import 'package:learning_flutter/app/core/constants.dart';
import 'package:learning_flutter/app/core/helpers/logger.dart';
import 'package:learning_flutter/app/core/helpers/service-locator.dart';
import 'package:learning_flutter/app/shared/user.dart';
import 'package:learning_flutter/app/widgets/full-width.dart';
import '../../layout/index.dart';
import '../../layout/toolbar.dart';

final storage = FlutterSecureStorage();

class _Text extends StatelessWidget {
  final String title;
  _Text(this.title);
  @override
  Widget build(BuildContext context) {
    return Text(
      this.title,
      style: Theme.of(context).textTheme.subtitle,
    );
  }
}

class _ButtonListTile extends StatelessWidget {
  final String title;
  final String route;
  final Function onClick;
  _ButtonListTile(this.title, {this.route, this.onClick});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FullWidth(
          child: InkWell(
            child: Container(
              child: _Text(this.title),
              padding: EdgeInsets.all(19),
            ),
            onTap: () {
              this.onClick();
              if (this.route != null) {
                // TODO: Enable this when finish setup all pages
                // Navigator.pushNamed(context, this.route);
              }
            },
          ),
        ),
        _Divider(),
      ],
    );
  }
}

class _Divider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Divider(height: 3, color: Colors.grey);
  }
}

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
        FutureBuilder<Object>(
          future: storage.read(key: ''),
          builder: (context, snapshot) {
            return SwitchListTile(
              value: snapshot.data,
              onChanged: (v) {
                ThemeSwitcher.of(context).switchTheme(Brightness.light);
              },
              title: _Text('night mode'.toUpperCase()),
            );
          }
        ),
        _Divider(),
        SwitchListTile(
          value: true,
          onChanged: (v) {},
          title: _Text('notification'.toUpperCase()),
        ),
        _Divider(),
        _ButtonListTile(
          'Auth',
          onClick: () async {
            logger.d('LocalAuthenticationService');
            await locator.get<LocalAuthenticationService>().authenticate();
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
          child: DropdownButtonHideUnderline(
            child: DropdownButton(
              isExpanded: true,
              value: 'en-us',
              items: <DropdownMenuItem>[
                DropdownMenuItem(child: _Text('Arabic'), value: 'ar-jo'),
                DropdownMenuItem(child: _Text('English'), value: 'en-us')
              ],
              onChanged: (value) {},
            ),
          ),
        ),
        _Divider(),
        _ButtonListTile(
          'Give me your feedback',
          route: RoutesConstants.FEEDBACK,
        ),
        _ButtonListTile('Contect me', route: RoutesConstants.CONTACT),
        _ButtonListTile('About me', route: RoutesConstants.ABOUT),
        _ButtonListTile(
          'Logout',
          route: RoutesConstants.LOGIN,
          onClick: () {
            User().logout(context);
          },
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
