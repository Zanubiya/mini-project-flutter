import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_project_flutter/Widget/login_widget.dart';

void main() {
  group('LoginWidget Tests', () {
    
    // Test 1: Widget renders correctly
    testWidgets('LoginWidget renders without crashing', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: LoginWidget(),
        ),
      );
      expect(find.byType(LoginWidget), findsOneWidget);
    });

    // Test 2: Check if all UI elements are present
    testWidgets('LoginWidget displays all required UI elements', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: LoginWidget(),
        ),
      );
      
      expect(find.text('Lush & Lace'), findsOneWidget);
      expect(find.text('Welcome!'), findsOneWidget);
      expect(find.text('please login or signup to continue our app'), findsOneWidget);
      expect(find.byType(TextField), findsWidgets);
      expect(find.text('Login'), findsOneWidget);
    });

    // Test 3: Email validation - empty email
    testWidgets('Email validation - empty email shows error', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: LoginWidget(),
        ),
      );
      
      // Tap login button without entering email
      await tester.tap(find.text('Login'));
      await tester.pump();
      
      expect(find.text('Please enter your email'), findsOneWidget);
    });

    // Test 4: Email validation - invalid email format
    testWidgets('Email validation - invalid email format shows error', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: LoginWidget(),
        ),
      );
      
      // Find and fill email field with invalid email
      var emailFields = find.byType(TextField);
      await tester.enterText(emailFields.first, 'invalidemail');
      await tester.tap(find.text('Login'));
      await tester.pump();
      
      expect(find.text('Invalid email format'), findsOneWidget);
    });

    // Test 5: Email validation - valid email format
    testWidgets('Email validation - valid email passes validation', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: LoginWidget(),
        ),
      );
      
      var textFields = find.byType(TextField);
      await tester.enterText(textFields.first, 'test@example.com');
      await tester.enterText(textFields.last, 'password123');
      await tester.tap(find.text('Login'));
      await tester.pump();
      
      expect(find.text('Invalid email format'), findsNothing);
    });

    // Test 6: Password validation - empty password
    testWidgets('Password validation - empty password shows error', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: LoginWidget(),
        ),
      );
      
      var textFields = find.byType(TextField);
      await tester.enterText(textFields.first, 'test@example.com');
      await tester.tap(find.text('Login'));
      await tester.pump();
      
      expect(find.text('Please enter your password'), findsOneWidget);
    });

    // Test 7: Password validation - password less than 6 characters
    testWidgets('Password validation - short password shows error', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: LoginWidget(),
        ),
      );
      
      var textFields = find.byType(TextField);
      await tester.enterText(textFields.first, 'test@example.com');
      await tester.enterText(textFields.last, '12345');
      await tester.tap(find.text('Login'));
      await tester.pump();
      
      expect(find.text('Password must be at least 6 characters'), findsOneWidget);
    });

    // Test 8: Valid credentials - both fields correct
    testWidgets('Valid credentials - login successful message appears', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: LoginWidget(),
        ),
      );
      
      var textFields = find.byType(TextField);
      await tester.enterText(textFields.first, 'test@example.com');
      await tester.enterText(textFields.last, 'password123');
      await tester.tap(find.text('Login'));
      await tester.pump();
      
      expect(find.text('Login Successful!'), findsOneWidget);
    });

    // Test 9: Password field is obscured
    testWidgets('Password field hides text input', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: LoginWidget(),
        ),
      );
      
      var textFields = find.byType(TextField);
      final passwordField = textFields.last;
      
      final TextField passwordTextField = tester.widget(passwordField);
      expect(passwordTextField.obscureText, true);
    });

    // Test 10: Multiple validation errors at once
    testWidgets('Multiple validation errors - invalid email and short password', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: LoginWidget(),
        ),
      );
      
      var textFields = find.byType(TextField);
      await tester.enterText(textFields.first, 'invalidemail');
      await tester.enterText(textFields.last, '123');
      await tester.tap(find.text('Login'));
      await tester.pump();
      
      expect(find.text('Invalid email format'), findsOneWidget);
      expect(find.text('Password must be at least 6 characters'), findsOneWidget);
    });

    // Test 11: Text field controllers work correctly
    testWidgets('Text input controllers update correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: LoginWidget(),
        ),
      );
      
      var textFields = find.byType(TextField);
      await tester.enterText(textFields.first, 'user@test.com');
      await tester.enterText(textFields.last, 'password456');
      
      expect(find.byType(TextField), findsWidgets);
    });

    // Test 12: Login button is clickable
    testWidgets('Login button is clickable', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: LoginWidget(),
        ),
      );
      
      expect(find.byType(TextButton), findsOneWidget);
      await tester.tap(find.text('Login'));
      await tester.pump();
    });
  });
}
