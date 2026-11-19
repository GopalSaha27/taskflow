
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

import '../models/task_model.dart';

class TaskProvider extends ChangeNotifier {
  final List<TaskModel> _tasks = [
    TaskModel(
      id: '1',
      title: 'Complete Flutter UI',
      description: 'Work on TaskFlow project',
      scheduledAt: DateTime.now().copyWith(hour: 9, minute: 0),
      priority: 'High',
      category: 'Work',
    ),
    TaskModel(
      id: '2',
      title: 'Practice English',
      description: 'Study for 30 minutes',
      scheduledAt: DateTime.now().copyWith(hour: 11, minute: 0),
      priority: 'Medium',
      category: 'Study',
    ),
    TaskModel(
      id: '3',
      title: 'Read a book',
      description: 'Personal development',
      scheduledAt: DateTime.now().copyWith(hour: 16, minute: 0),
      priority: 'Low',
      category: 'Personal',
      isCompleted: true,
    ),
  ];

  final Uuid _uuid = const Uuid();

  List<TaskModel> get tasks => List.unmodifiable(_tasks);

  int get totalTasks => _tasks.length;

  int get completedTasks =>
      _tasks.where((task) => task.isCompleted).length;

  int get pendingTasks => totalTasks - completedTasks;

  double get progress =>
      totalTasks == 0 ? 0 : completedTasks / totalTasks;

  void addTask({
    required String title,
    required String description,
    required DateTime scheduledAt,
    required String priority,
    required String category,
  }) {
    final newTask = TaskModel(
      id: _uuid.v4(),
      title: title,
      description: description,
      scheduledAt: scheduledAt,
      priority: priority,
      category: category,
    );

    _tasks.add(newTask);
    notifyListeners();
  }

  void toggleTask(String id) {
    final index = _tasks.indexWhere((task) => task.id == id);

    if (index == -1) return;

    _tasks[index] = _tasks[index].copyWith(
      isCompleted: !_tasks[index].isCompleted,
    );

    notifyListeners();
  }

  void deleteTask(String id) {
    _tasks.removeWhere((task) => task.id == id);
    notifyListeners();
  }

  void updateTask(TaskModel updatedTask) {
    final index = _tasks.indexWhere(
      (task) => task.id == updatedTask.id,
    );

    if (index == -1) return;

    _tasks[index] = updatedTask;
    notifyListeners();
  }
}
