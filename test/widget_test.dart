// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hackernews/main.dart';

void main() {
  // TODO: Has to wait for network call
  testWidgets('clicking a tile opens it', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that there is no launch icon visible initially
    expect(find.byIcon(Icons.launch), findsNothing);

    // Tap on the first expansion tile
    await tester.tap(find.byType(ExpansionTile).first);
    await tester.pump();

    // Verify that there is one launch icon visible
    expect(find.byIcon(Icons.launch), findsOneWidget);
  }, skip: true);
}
