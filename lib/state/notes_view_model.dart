import 'package:flutter/material.dart';
import 'package:flutter_notes/models/note.dart';

class NotesViewModel extends ChangeNotifier {
  final List<Note> _notes = [];
  List<Note> get notes => List.unmodifiable(_notes);

  void addNote(String title, String? description) {
    _notes.add(Note(title, description));
    notifyListeners();
  }
}
