import 'package:flutter/material.dart';

/// Custom TextFormField widget
class AppTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String? hint;
  final String? Function(String?)? validator;
  final bool autofocus;
  final int? maxLines;
  final int? minLines;
  final TextCapitalization textCapitalization;

  const AppTextField({
    super.key,
    required this.controller,
    required this.label,
    this.hint,
    this.validator,
    this.autofocus = false,
    this.maxLines = 1,
    this.minLines,
    this.textCapitalization = TextCapitalization.sentences,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        alignLabelWithHint: maxLines != null && maxLines! > 1,
      ),
      textCapitalization: textCapitalization,
      maxLines: maxLines,
      minLines: minLines,
      validator: validator,
      autofocus: autofocus,
    );
  }
}
