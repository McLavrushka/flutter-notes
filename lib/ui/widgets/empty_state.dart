import 'package:flutter/material.dart';
import 'package:flutter_notes/core/constants/values_manager.dart'
    show AppIconSize, AppSpacing;

/// Displays an empty state for the notes page with an icon and message.
class EmptyState extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? subtitle;

  const EmptyState({
    super.key,
    this.icon = Icons.note_outlined,
    this.title = 'No notes yet',
    this.subtitle = 'Press + to add note',
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: AppIconSize.s64,
            color: colorScheme.onSurface.withValues(alpha: 0.3),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: AppSpacing.s16,
            ),
            child: Text(
              title,
              style: textTheme.titleLarge?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.6),
              ),
            ),
          ),
          if (subtitle != null) ...[
            Padding(
              padding: EdgeInsets.only(
                  left: AppSpacing.s32,
                  right: AppSpacing.s32,
                  top: AppSpacing.s8),
              child: Text(
                subtitle!,
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface.withValues(alpha: 0.5),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
