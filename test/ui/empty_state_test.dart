import 'package:flutter/material.dart';
import 'package:flutter_notes/ui/widgets/empty_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('EmptyState shows default title and subtitle', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(body: EmptyState()),
      ),
    );

    expect(find.text('No notes yet'), findsOneWidget);
    expect(find.text('Tap + to add a note'), findsOneWidget);
    expect(find.byIcon(Icons.note_outlined), findsOneWidget);
  });
}
