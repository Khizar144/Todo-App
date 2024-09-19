import 'package:flutter/material.dart';
import 'package:todo/database/database_helper.dart';

class TaskProvider with ChangeNotifier {
  final DatabaseHelper _dbHelper = DatabaseHelper();

  List<Map<String, dynamic>> _tasks = [];

  List<Map<String, dynamic>> get tasks => _tasks;

  Future<void> fetchTasks() async {
    _tasks = await _dbHelper.getTasks();
    notifyListeners();
  }

  Future<void> addTask(String title) async {
    await _dbHelper.insertTask({
      'title': title,
      'isCompleted': 0, // 0 for false, 1 for true
    });
    await fetchTasks();
  }

  Future<void> updateTaskCompletion(int id, bool isCompleted) async {
    await _dbHelper.updateTask(id, {
      'isCompleted': isCompleted ? 1 : 0,
    });
    await fetchTasks();
  }

  Future<void> deleteTask(int id) async {
    await _dbHelper.deleteTask(id);
    await fetchTasks();
  }
}
