import 'package:counterapptdd/counter_page.dart';
import 'package:counterapptdd/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  testWidgets('Test My App Widget', (tester) async {
    const sut = ProviderScope(child: MyApp());

    await tester.pumpWidget(sut);
    await tester.pumpAndSettle();
    expect(find.byType(CounterPage), findsOneWidget);
  });
}
