import 'package:flutter/material.dart';
import 'package:flutter_notes/models/note.dart';

/// ViewModel для управления состоянием заметок
class NotesViewModel extends ChangeNotifier {
  final List<Note> _notes = [];

  List<Note> get notes => List.unmodifiable(_notes);

  void addNote(String title, String? description) {
    final note = Note(
      title: title,
      description: description?.isEmpty == true ? null : description,
    );
    _notes.add(note);
    notifyListeners();
  }

  void removeNote(Note note) {
    _notes.remove(note);
    notifyListeners();
  }
}
