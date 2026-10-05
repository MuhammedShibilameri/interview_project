import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:interview_project/main.dart';
import 'package:interview_project/models/user_model.dart';

void main() {
  group('User Model Tests', () {
    test('User.fromJson correctly parses nested JSON fields', () {
      final sampleJson = {
        'id': 1,
        'name': 'Leanne Graham',
        'username': 'Bret',
        'email': 'Sincere@april.biz',
        'address': {
          'street': 'Kulas Light',
          'suite': 'Apt. 556',
          'city': 'Gwenborough',
          'zipcode': '92998-3874',
          'geo': {'lat': '-37.3159', 'lng': '81.1496'},
        },
        'phone': '1-770-736-8031 x56442',
        'website': 'hildegard.org',
        'company': {
          'name': 'Romaguera-Crona',
          'catchPhrase': 'Multi-layered client-server neural-net',
          'bs': 'harness real-time e-markets',
        },
      };

      final user = User.fromJson(sampleJson);

      expect(user.id, 1);
      expect(user.name, 'Leanne Graham');
      expect(user.initial, 'L');
      expect(user.username, 'Bret');
      expect(user.email, 'Sincere@april.biz');
      expect(user.address.street, 'Kulas Light');
      expect(user.address.city, 'Gwenborough');
      expect(user.address.geo.lat, '-37.3159');
      expect(user.company.name, 'Romaguera-Crona');
      expect(
        user.address.formattedAddress,
        'Apt. 556, Kulas Light, Gwenborough - 92998-3874',
      );
    });
  });

  group('LoginScreen Widget Tests', () {
    testWidgets('LoginScreen displays email, password, and login button', (
      tester,
    ) async {
      await tester.pumpWidget(const MyApp());

      expect(find.text('Welcome Back'), findsOneWidget);
      expect(find.text('Email Address'), findsOneWidget);
      expect(find.text('Password'), findsOneWidget);
      expect(find.widgetWithText(FilledButton, 'Login'), findsOneWidget);
    });

    testWidgets('Submitting empty form shows validation errors', (
      tester,
    ) async {
      await tester.pumpWidget(const MyApp());

      // Tap login without entering details
      await tester.tap(find.widgetWithText(FilledButton, 'Login'));
      await tester.pumpAndSettle();

      expect(find.text('Please enter your email'), findsOneWidget);
      expect(find.text('Please enter your password'), findsOneWidget);
    });

    testWidgets(
      'Submitting invalid email and short password shows validation errors',
      (tester) async {
        await tester.pumpWidget(const MyApp());

        final emailField = find.byType(TextFormField).first;
        final passwordField = find.byType(TextFormField).last;

        await tester.enterText(emailField, 'notanemail');
        await tester.enterText(passwordField, '123');

        await tester.tap(find.widgetWithText(FilledButton, 'Login'));
        await tester.pumpAndSettle();

        expect(find.text('Please enter a valid email address'), findsOneWidget);
        expect(
          find.text('Password must be at least 6 characters'),
          findsOneWidget,
        );
      },
    );
  });
}
