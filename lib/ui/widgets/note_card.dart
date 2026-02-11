import 'package:flutter/material.dart';
import 'package:flutter_notes/core/constants/values_manager.dart';
import 'package:flutter_notes/models/note.dart';

/// A card that displays a single note.
class NoteCard extends StatelessWidget {
  final Note note;

  const NoteCard({
    super.key,
    required this.note,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(note.title, style: Theme.of(context).textTheme.titleMedium),
        subtitle: note.hasDescription
            ? Padding(
                padding: const EdgeInsets.only(top: AppSpacing.s4),
                child: Text(
                  note.description!,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            : null,
        isThreeLine: note.shouldReserveThreeLines,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.s16,
          vertical: AppSpacing.s8,
        ),
      ),
    );
  }
}
