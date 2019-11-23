import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:learning_flutter/app/routes.dart';

import 'navigation.mock.dart';

Finder findByKey(String key) {
  return find.byKey(Key(key));
}

Finder findByType(Type type) {
  return find.byType(type);
}

void expectOne(Finder widget) {
  expect(widget, findsOneWidget);
}

void expectNothing(Finder widget) {
  expect(widget, findsNothing);
}

void expectOneAtLeast(Finder widget) {
  expect(widget, findsWidgets);
}

void expectNumberOf(Finder widget, int number) {
  expect(widget, findsNWidgets(number));
}

Finder findDescendant(Finder of, Finder matching) {
  return find.descendant(
    of: of,
    matching: matching,
  );
}

Future<MockNavigatorObserver> buildPage(WidgetTester tester, Widget page) async {
  final mockObserver = MockNavigatorObserver();
  await tester.pumpWidget(
    MaterialApp(
      routes: routes,
      home: page,
      navigatorObservers: [mockObserver],
    ),
  );
  return mockObserver;
}
