import 'package:flutter/material.dart';
import 'package:flutter_notes/core/theme/app_theme.dart';
import 'package:flutter_notes/state/notes_view_model.dart';
import 'package:flutter_notes/ui/pages/main_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NotesViewModel(),
      child: MaterialApp(
        title: 'Flutter Notes',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.system,
        home: const MainPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
