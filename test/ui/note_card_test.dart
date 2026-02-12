import 'package:flutter/material.dart';
import 'package:flutter_notes/models/note.dart';
import 'package:flutter_notes/ui/widgets/note_card.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('NoteCard shows title and description', (tester) async {
    final note = Note(
      title: 'Title',
      description: 'Description',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: NoteCard(note: note),
        ),
      ),
    );

    expect(find.text('Title'), findsOneWidget);
    expect(find.text('Description'), findsOneWidget);
  });

  testWidgets('NoteCard hides subtitle when there is no description',
      (tester) async {
    final note = Note(title: 'Title');

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: NoteCard(note: note),
        ),
      ),
    );

    expect(find.text('Title'), findsOneWidget);
    expect(find.byType(ListTile), findsOneWidget);
    expect(
        find
            .descendant(of: find.byType(ListTile), matching: find.byType(Text))
            .evaluate()
            .length,
        1);
  });
}
