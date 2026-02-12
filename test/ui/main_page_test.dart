import 'package:flutter/material.dart';
import 'package:flutter_notes/state/notes_view_model.dart';
import 'package:flutter_notes/ui/pages/main_page.dart';
import 'package:flutter_notes/ui/widgets/empty_state.dart';
import 'package:flutter_notes/ui/widgets/note_card.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets('User can add a note via FAB', (tester) async {
    await tester.pumpWidget(
      ChangeNotifierProvider(
        create: (_) => NotesViewModel(),
        child: const MaterialApp(
          home: MainPage(),
        ),
      ),
    );

    // initially: EmptyState
    expect(find.byType(EmptyState), findsOneWidget);

    // tap FAB
    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();

    // Find fields in the form
    final textFields = find.byType(TextFormField);
    expect(textFields, findsNWidgets(2));

    // First field - title (with autofocus, so it will be in focus)
    await tester.enterText(textFields.at(0), 'Title');

    // Second field - description
    await tester.enterText(textFields.at(1), 'Desc');

    // Find save button by icon 
    await tester.tap(find.byIcon(Icons.check));
    await tester.pumpAndSettle();

    // now: list with one NoteCard
    expect(find.byType(NoteCard), findsOneWidget);
    expect(find.text('Title'), findsOneWidget);
  });
}
