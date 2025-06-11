import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pay_example/chatbot_screen.dart'; // Assuming your package name is pay_example

void main() {
  testWidgets('ChatbotScreen basic UI elements test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MaterialApp(home: ChatbotScreen()));

    // Verify that the initial AI welcome message is present.
    expect(find.text('Greetings! What brings you to my humble abode?'), findsOneWidget);

    // Verify that the TextField for input is present.
    expect(find.byType(TextField), findsOneWidget);

    // Verify that the send IconButton is present.
    expect(find.byIcon(Icons.send), findsOneWidget);
  });
}
