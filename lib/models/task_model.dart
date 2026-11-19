
class TaskModel {
  final String id;
  final String title;
  final String description;
  final DateTime scheduledAt;
  final String priority;
  final String category;
  final bool isCompleted;

  TaskModel({
    required this.id,
    required this.title,
    required this.description,
    required this.scheduledAt,
    required this.priority,
    required this.category,
    this.isCompleted = false,
  });

  TaskModel copyWith({
    String? title,
    String? description,
    DateTime? scheduledAt,
    String? priority,
    String? category,
    bool? isCompleted,
  }) {
    return TaskModel(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      scheduledAt: scheduledAt ?? this.scheduledAt,
      priority: priority ?? this.priority,
      category: category ?? this.category,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}
