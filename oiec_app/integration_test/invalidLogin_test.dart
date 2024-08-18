import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:oiec_app/screens/login.dart';
import 'package:oiec_app/main.dart' as app;

void main(){
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Application should fail at login in', (WidgetTester tester) async {

    app.main();
    await tester.pumpAndSettle();
    final Finder correoField = find.byKey(Key('correo'));
    final Finder passwordField = find.byKey(Key('contrasenia'));
    final Finder loginButton = find.byKey(Key('loginButton'));
  
    expect(correoField, findsOneWidget);
    expect(passwordField, findsOneWidget);
    expect(loginButton, findsOneWidget);

    await tester.enterText(correoField, 'zzz@zzz.com');
    await tester.enterText(passwordField, 'admin123');

    await tester.tap(loginButton);
    await tester.pumpAndSettle();

    expect(find.text('El correo o contraseña no es válido.'), findsOneWidget);

  });

}