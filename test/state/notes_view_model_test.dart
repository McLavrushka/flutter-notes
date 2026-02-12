import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_notes/state/notes_view_model.dart';

void main() {
  group('NotesViewModel', () {
    late NotesViewModel viewModel;

    setUp(() {
      viewModel = NotesViewModel();
    });

    test('starts with an empty notes list', () {
      expect(viewModel.notes, isEmpty);
    });

    test('addNote adds a note to the list', () {
      viewModel.addNote('Test Title', 'Test Description');

      expect(viewModel.notes.length, 1);
      expect(viewModel.notes.first.title, 'Test Title');
      expect(viewModel.notes.first.description, 'Test Description');
    });

    test('addNote allows null description', () {
      viewModel.addNote('Test Title', null);

      expect(viewModel.notes.length, 1);
      expect(viewModel.notes.first.title, 'Test Title');
      expect(viewModel.notes.first.description, isNull);
    });

    test('addNote converts empty description to null', () {
      viewModel.addNote('Test Title', '');

      expect(viewModel.notes.length, 1);
      expect(viewModel.notes.first.description, isNull);
    });

    test('removeNote removes note from the list', () {
      viewModel.addNote('Test Title', 'Test Description');
      final note = viewModel.notes.first;

      viewModel.removeNote(note);

      expect(viewModel.notes, isEmpty);
    });
  });
}
