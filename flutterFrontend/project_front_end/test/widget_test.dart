import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:project_front_end/main.dart'; // Assuming your main file is named main.dart

void main() {
  testWidgets('MyHomePage UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that 'EcoChrono' text is present.
    expect(find.text('EcoChrono'), findsOneWidget);

    // Verify that 'CALCULATE THE TREE AGE' text is present.
    expect(find.text('CALCULATE THE TREE AGE'), findsOneWidget);

    // Verify that 'TREE DIAMETER' text is present.
    expect(find.text('TREE DIAMETER'), findsOneWidget);

    // Verify that 'PREVIOUS TREE HISTORY' text is present.
    expect(find.text('PREVIOUS TREE HISTORY'), findsOneWidget);
  });
}
