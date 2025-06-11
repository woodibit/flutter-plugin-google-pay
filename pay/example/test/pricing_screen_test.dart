import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pay_example/pricing_screen.dart'; // Assuming your package name is pay_example

void main() {
  testWidgets('PricingScreen basic UI elements test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: PricingScreen()));

    // Verify that the AppBar title is present.
    expect(find.text('Pricing Plans'), findsOneWidget);

    // Verify that at least one of the pricing tier titles is present.
    expect(find.text('Apprentice Diviner'), findsOneWidget);
    expect(find.text('Seasoned Sorceress'), findsOneWidget);
    expect(find.text('Arch-Mage Mystic'), findsOneWidget);

    // Verify that "Choose Plan" buttons are present.
    // We expect to find multiple such buttons, one for each plan.
    expect(find.text('Choose Plan'), findsWidgets);
  });
}
