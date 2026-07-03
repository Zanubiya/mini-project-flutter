import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_project_flutter/Widget/login_widget.dart';

void main() {
  testWidgets('Valid login test', (WidgetTester tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: LoginWidget(),
      ),
    );

    final textFields = find.byType(TextField);
#login test
    await tester.enterText(textFields.at(0), 'admin1@gmail.com');
    await tester.enterText(textFields.at(1), '123456');

    await tester.tap(find.text('Login'));
    await tester.pump();

    // Replace this with what your app actually shows after login
    expect(find.text('Login Successful!'), findsOneWidget);
  });
}
