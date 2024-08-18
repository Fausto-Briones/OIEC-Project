import 'package:oiec_app/main.dart' as app;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Application should be able to log in and access News', (WidgetTester tester) async {

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

    expect(find.text('Noticias'), findsOneWidget);

    final Finder drawerButton = find.byTooltip('Open navigation menu'); // Finds the drawer button by tooltip
    await tester.tap(drawerButton);
    await tester.pumpAndSettle();

    final Finder newsButton = find.text('Noticias'); // Assuming 'News' is the text of the button
    await tester.tap(newsButton);
    await tester.pumpAndSettle();

    expect(find.text('Noticias'), findsOneWidget); // Replace with a widget/text unique to the News page


  });

}