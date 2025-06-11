import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pay_example/profile_screen.dart'; // Assuming your package name is pay_example

void main() {
  testWidgets('ProfileScreen basic UI elements test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: ProfileScreen()));

    // Verify that the AppBar title is present.
    expect(find.text('My Profile'), findsOneWidget);

    // Verify that the placeholder user name is present.
    expect(find.text('Enchanted User'), findsOneWidget);

    // Verify that at least one of the information labels is present.
    expect(find.text('Birthday'), findsOneWidget);
    expect(find.text('Zodiac Sign'), findsOneWidget);
    expect(find.text('Magical Profession'), findsOneWidget);

    // Verify that the logout button text is present.
    expect(find.text('Depart from this Realm (Logout)'), findsOneWidget);
  });
}
