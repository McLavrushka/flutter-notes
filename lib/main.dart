import 'package:flutter/material.dart';
import 'package:flutter_notes/state/notes_view_model.dart';
import 'package:flutter_notes/ui/pages/main_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => NotesViewModel(),
    child: NotesApp(),
  ));
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Notes',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: MainPage(),
    );
  }
}
