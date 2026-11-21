
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

  // Create a copy of the existing task with updated values.
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

  // Convert TaskModel into JSON-compatible Map.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'scheduledAt': scheduledAt.toIso8601String(),
      'priority': priority,
      'category': category,
      'isCompleted': isCompleted,
    };
  }

  // Convert JSON-compatible Map back into TaskModel.
  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      scheduledAt: DateTime.parse(json['scheduledAt'] as String),
      priority: json['priority'] as String,
      category: json['category'] as String,
      isCompleted: json['isCompleted'] as bool? ?? false,
    );
  }
}
