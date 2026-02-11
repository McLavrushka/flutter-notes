/// A note with a title and an optional description.
class Note {
  final String title;
  final String? description;

  const Note({
    required this.title,
    this.description,
  });

  /// Whether note has a description
  bool get hasDescription => description != null && description!.isNotEmpty;

  /// Whether the subtitle should reserve space for three lines.
  bool get shouldReserveThreeLines => hasDescription && description!.length > 50;
}
