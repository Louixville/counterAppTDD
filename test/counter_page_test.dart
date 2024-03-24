import 'package:counterapptdd/counter_page.dart';
import 'package:counterapptdd/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  testWidgets('when CounterPage is rendered then it should display an appbar',
      (tester) async {
    const sut = ProviderScope(child: MyApp());
    await tester.pumpWidget(sut);
    await tester.pumpAndSettle();
    expect(find.byType(CounterPage), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
  });

  testWidgets(
      'when CounterPage is rendered then it should display an appbar with a text',
      (tester) async {
    const sut = ProviderScope(child: MyApp());
    await tester.pumpWidget(sut);
    await tester.pumpAndSettle();
    expect(find.byType(CounterPage), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('Counter App'), findsOneWidget);
  });

  testWidgets(
      'when CounterPage is rendered then it should display a body that contains a column with some text widgets',
      (tester) async {
    const sut = ProviderScope(child: MyApp());
    await tester.pumpWidget(sut);
    await tester.pumpAndSettle();
    expect(find.byType(CounterPage), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);
    expect(find.text('Current emitted value:'), findsOneWidget);
  });

  testWidgets(
      'when CounterPage is rendered then it should display a body that contains a column with two icon button widgets',
      (tester) async {
    const sut = ProviderScope(child: MyApp());
    await tester.pumpWidget(sut);
    await tester.pumpAndSettle();
    expect(find.byType(CounterPage), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(IconButton), findsNWidgets(2));
  });

  testWidgets(
      'when CounterPage is rendered then it should display a body that contains multiple sizedbox widgets',
      (tester) async {
    const sut = ProviderScope(child: MyApp());
    await tester.pumpWidget(sut);
    await tester.pumpAndSettle();
    expect(find.byType(CounterPage), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);
    expect(find.byType(SizedBox), findsWidgets);
  });

  testWidgets(
      'when CounterPage is rendered and increment button is pressed then emitted value should increment',
      (tester) async {
    const sut = ProviderScope(child: MyApp());
    await tester.pumpWidget(sut);
    await tester.pumpAndSettle();
    expect(find.byType(CounterPage), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pumpAndSettle();
    expect(find.text('1'), findsOneWidget);
  });

  testWidgets(
      'when CounterPage is rendered and decrement button is pressed then emitted value should decrement',
      (tester) async {
    const sut = ProviderScope(child: MyApp());
    await tester.pumpWidget(sut);
    await tester.pumpAndSettle();
    expect(find.byType(CounterPage), findsOneWidget);
    expect(find.byType(Column), findsOneWidget);
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pumpAndSettle();
    expect(find.text('-1'), findsOneWidget);
  });
}
