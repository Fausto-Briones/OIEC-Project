import 'package:oiec_app/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Application should be able to log in and access Payments', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    final Finder correoField = find.byKey(Key('correo'));
    final Finder passwordField = find.byKey(Key('contrasenia'));
    final Finder loginButton = find.byKey(Key('loginButton'));
  
    expect(correoField, findsOneWidget);
    expect(passwordField, findsOneWidget);
    expect(loginButton, findsOneWidget);

    await tester.enterText(correoField, 'admin@admin.com');
    await tester.enterText(passwordField, 'admin123');
    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    final Finder drawerButton = find.byTooltip('Open navigation menu');
    await tester.tap(drawerButton);
    await tester.pumpAndSettle();

    final Finder paymentsButton = find.text('Pagos');
    await tester.tap(paymentsButton);
    await tester.pumpAndSettle();

    expect(find.text('Pagos'), findsOneWidget);

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    await tester.pumpAndSettle();

    expect(find.text('No hay pagos disponibles.'), findsOneWidget); // Or check for loaded payments
    expect(find.text('None'), findsWidgets); // Replace with actual test data or keys
  });
}
