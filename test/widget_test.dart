import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import 'package:Arillo_advmobprog/main.dart';
import 'package:Arillo_advmobprog/providers/theme_provider.dart';

void main() {
  testWidgets('App loads', (tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => ThemeProvider(),
        child: const MyApp(),
      ),
    );

    expect(find.text('Product Explorer'), findsOneWidget);
  });
}
