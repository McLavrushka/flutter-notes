import 'package:flutter_notes/models/note.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Note', () {
    test('hasDescription returns true when description is non-empty', () {
      final note = Note(title: 'Title', description: 'Desc');
      expect(note.hasDescription, isTrue);
    });

    test('hasDescription returns false when description is null or empty', () {
      expect(Note(title: 'Title').hasDescription, isFalse);
      expect(Note(title: 'Title', description: '').hasDescription, isFalse);
    });

    test('hasLongDescription returns true only for long descriptions', () {
      final short = Note(title: 'Title', description: 'short');
      final long = Note(
        title: 'Title',
        description: 'x' * 100,
      );

      expect(short.shouldReserveThreeLines, isFalse);
      expect(long.shouldReserveThreeLines, isTrue);
    });
  });
}
