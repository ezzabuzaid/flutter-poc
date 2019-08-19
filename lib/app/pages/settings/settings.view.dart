import 'package:flutter/material.dart';
import 'package:learning_flutter/app/app.dart';
import 'package:learning_flutter/app/core/auth.service.dart';
import 'package:learning_flutter/app/core/constants.dart';
import 'package:learning_flutter/app/core/helpers/logger.dart';
import 'package:learning_flutter/app/core/helpers/service-locator.dart';
import 'package:learning_flutter/app/pages/settings/settings.bloc.dart';
import 'package:learning_flutter/app/pages/settings/settings.model.dart';
import 'package:learning_flutter/app/shared/user.dart';
import 'package:learning_flutter/app/widgets/full-width.dart';
import '../../layout/index.dart';
import '../../layout/toolbar.dart';

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
    return StreamBuilder(
      stream: settingsBloc.settings.stream,
      builder: (context, AsyncSnapshot<SettingsModel> snapshot) {
        // FIXME: Make it generic
        if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator());
        }
        final data = snapshot.data;
        logger.w(data.toJson());
        return Column(
          children: <Widget>[
            SwitchListTile(
              value: data.darkMode,
              onChanged: (value) {
                data.darkMode = value;
                ThemeSwitcher.of(context).switchTheme(
                    value == true ? Brightness.dark : Brightness.light);
                settingsBloc.setSettings(data);
              },
              title: _Text('Dark mode'.toUpperCase()),
            ),
            _Divider(),
            SwitchListTile(
              value: data.notification,
              onChanged: (value) {
                data.notification = value;
                settingsBloc.setSettings(data);
              },
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
      },
    );
  }
}

class SettingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(context: context),
      drawer: Navigation(),
      body: _SettingBody(),
    );
  }
}
