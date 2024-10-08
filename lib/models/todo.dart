class Todo {
  Todo({
    required this.title,
    required this.description,
    required this.createdDate,
    this.deadline,
  });

  final String title;
  final String description;
  final DateTime createdDate;
  DateTime? deadline;
}
