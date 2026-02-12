import 'package:flutter/material.dart';
import 'package:flutter_notes/core/constants/values_manager.dart'
    show AppSpacing;
import 'package:flutter_notes/ui/widgets/app_text_field.dart';

/// Page for adding new note
class NotePage extends StatefulWidget {
  const NotePage({super.key});

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  /// Validate the correctness of input and pop the screen with return value
  void _saveNote() {
    if (_formKey.currentState!.validate()) {
      final title = _titleController.text.trim();
      final descriptionText = _descriptionController.text.trim();
      final description = descriptionText.isEmpty ? null : descriptionText;

      Navigator.of(context).pop({
        'title': title,
        'description': description,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New note'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: AppSpacing.s8),
            child: IconButton(
              icon: const Icon(Icons.check),
              onPressed: _saveNote,
              tooltip: 'Save',
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.s16),
          children: [
            AppTextField(
              controller: _titleController,
              label: 'Title',
              hint: 'Add note title',
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Title is required';
                }
                return null;
              },
              autofocus: true,
            ),
            const SizedBox(height: AppSpacing.s16),
            AppTextField(
              controller: _descriptionController,
              label: 'Description',
              hint: 'Add description(not required)',
              maxLines: 8,
              minLines: 4,
            ),
          ],
        ),
      ),
    );
  }
}
