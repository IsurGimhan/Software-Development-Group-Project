import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_front_end/about_us.dart';
import 'package:project_front_end/web_view_container.dart';
void main() {
  testWidgets('AboutUS widget test', (WidgetTester tester) async {
    // Build our widget and trigger a frame.
    await tester.pumpWidget(MaterialApp(home: AboutUS(title: 'Test Title')));

    // Wait for a moment to ensure text rendering
    await tester.pump(Duration(milliseconds: 500));

    // Verify that the title text is rendered.
    expect(find.text('ABOUT US'), findsOneWidget);
    
    // Verify that the motivation text is rendered.
    expect(find.text("Building the Future of Tree Identification"), findsOneWidget);

    // Verify that the motivation text is rendered.
    expect(find.text("Our Motivation:"), findsOneWidget);

    // Verify that the commitment text is rendered.
    expect(find.text("Our Commitment:"), findsOneWidget);

    // Verify that the ElevatedButton is rendered.
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Tap on the ElevatedButton and trigger navigation.
    await tester.tap(find.byType(ElevatedButton));
    await tester.pumpAndSettle();

    // Verify that the WebViewContainer widget is pushed.
    expect(find.byType(WebViewContainer), findsOneWidget);
  });
}
