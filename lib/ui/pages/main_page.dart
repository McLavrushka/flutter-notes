import 'package:flutter/material.dart';
import 'package:flutter_notes/core/constants/values_manager.dart'
    show AppSpacing;
import 'package:flutter_notes/core/navigation/slide_route.dart';
import 'package:flutter_notes/state/notes_view_model.dart';
import 'package:flutter_notes/ui/pages/note_page.dart';
import 'package:flutter_notes/ui/widgets/empty_state.dart';
import 'package:flutter_notes/ui/widgets/note_card.dart';
import 'package:provider/provider.dart';

/// Main page that displays the list of notes.
class MainPage extends StatelessWidget {
  const MainPage({super.key});

  /// Navigates to [NotePage] and waits for the result.
  /// If a note was created, adds it to the list via [NotesViewModel].
  Future<void> _navigateToAddNote(BuildContext context) async {
    final result = await Navigator.of(context).push<Map<String, String?>>(
      slideFromRightPageRoute(const NotePage()),
    );
    // Add the note only if the widget is still mounted and a result was returned.
    if (result != null && context.mounted) {
      final viewModel = context.read<NotesViewModel>();
      viewModel.addNote(
        result['title']!,
        result['description'],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final notes = context.watch<NotesViewModel>().notes;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter notes'),
        elevation: 2,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddNote(context),
        tooltip: 'Add note',
        child: const Icon(Icons.add),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          // Simple adaptive layout based on available width.
          final isWide = constraints.maxWidth > 600;

          return notes.isEmpty
              ? const EmptyState()
              : ListView.builder(
                  padding: EdgeInsets.all(
                    isWide ? AppSpacing.s16 : AppSpacing.s8,
                  ),
                  itemCount: notes.length,
                  itemBuilder: (context, index) {
                    return NoteCard(note: notes[index]);
                  },
                );
        },
      ),
    );
  }
}
