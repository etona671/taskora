import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/task.dart';

class TaskStorage {
  static const String _storageKey = 'taskflow_tasks';

  /// Charge toutes les tâches enregistrées sur le téléphone.
  Future<List<Task>> loadTasks() async {
    final preferences = await SharedPreferences.getInstance();
    final jsonString = preferences.getString(_storageKey);

    if (jsonString == null || jsonString.isEmpty) {
      return [];
    }

    final decoded = jsonDecode(jsonString) as List<dynamic>;

    return decoded.map((item) {
      return Task.fromJson(Map<String, dynamic>.from(item as Map));
    }).toList();
  }

  /// Enregistre la liste complète des tâches.
  Future<void> saveTasks(List<Task> tasks) async {
    final preferences = await SharedPreferences.getInstance();

    final jsonString = jsonEncode(tasks.map((task) => task.toJson()).toList());

    final success = await preferences.setString(_storageKey, jsonString);

    if (!success) {
      throw Exception('Impossible de sauvegarder les tâches.');
    }
  }

  /// Efface toutes les tâches sauvegardées.
  Future<void> clearTasks() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.remove(_storageKey);
  }
}
