import 'package:oiec_app/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('Application should be able to log in and access Competitions', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    // Locate and interact with login form fields
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

    // Open the navigation drawer
    final Finder drawerButton = find.byTooltip('Open navigation menu');
    await tester.tap(drawerButton);
    await tester.pumpAndSettle();

    // Navigate to the Competitions page
    final Finder competitionsButton = find.text('Competencias');
    await tester.tap(competitionsButton);
    await tester.pumpAndSettle();

    // Verify the Competitions page loads correctly
    expect(find.text('Competencias'), findsOneWidget);

    // Check if data is loading
    expect(find.byType(CircularProgressIndicator), findsOneWidget);

    // Simulate data being loaded (you may want to mock the DatabaseService to control this)
    await tester.pumpAndSettle();

    // Verify tabs are present
    expect(find.text('Pasadas'), findsOneWidget);
    expect(find.text('Futuras'), findsOneWidget);

    // Verify content in 'Pasadas' tab
    await tester.tap(find.text('Pasadas'));
    await tester.pumpAndSettle();
    expect(find.text('No hay competencias pasadas disponibles.'), findsOneWidget); 

    // Verify content in 'Futuras' tab
    await tester.tap(find.text('Futuras'));
    await tester.pumpAndSettle();
    expect(find.text('No hay competencias futuras disponibles.'), findsOneWidget); 

    expect(find.text('ONI2024F1'), findsWidgets);
  });
}
