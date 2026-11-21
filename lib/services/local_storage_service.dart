
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/task_model.dart';

class LocalStorageService {
  // Storage key used to identify our saved tasks.
  static const String _tasksKey = 'saved_tasks';

  // Save all tasks into local storage.
  Future<void> saveTasks(List<TaskModel> tasks) async {
    final prefs = await SharedPreferences.getInstance();

    // Convert TaskModel objects into JSON-compatible Maps.
    final List<Map<String, dynamic>> taskList = tasks
        .map((task) => task.toJson())
        .toList();

    // Convert the List into a JSON String.
    final String encodedTasks = jsonEncode(taskList);

    // Save the JSON String in SharedPreferences.
    await prefs.setString(_tasksKey, encodedTasks);
  }

  // Load all saved tasks from local storage.
  Future<List<TaskModel>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();

    // Get the saved JSON String.
    final String? encodedTasks = prefs.getString(_tasksKey);

    // Return an empty list if no tasks are saved.
    if (encodedTasks == null || encodedTasks.isEmpty) {
      return [];
    }

    // Convert JSON String into a List.
    final List<dynamic> decodedTasks = jsonDecode(encodedTasks);

    // Convert each JSON Map into a TaskModel object.
    return decodedTasks
        .map(
          (task) => TaskModel.fromJson(
            Map<String, dynamic>.from(task),
          ),
        )
        .toList();
  }

  // Remove all saved tasks from local storage.
  Future<void> clearTasks() async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.remove(_tasksKey);
  }
}
