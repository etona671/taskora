import 'package:flutter_test/flutter_test.dart';
import 'package:taskora/models/task.dart';

void main() {
  final createdAt = DateTime.utc(2026, 10, 27, 10);

  group('Task', () {
    test('crée une tâche avec les valeurs par défaut', () {
      final task = Task(
        id: 'task-1',
        title: 'Apprendre Dart',
        createdAt: createdAt,
      );

      expect(task.title, 'Apprendre Dart');
      expect(task.priority, TaskPriority.medium);
      expect(task.category, 'personal');
      expect(task.description, '');
      expect(task.isCompleted, false);
      expect(task.dueDate, isNull);
      expect(task.reminderAt, isNull);
    });

    test('convertit une tâche en JSON et la restaure', () {
      final original = Task(
        id: 'task-2',
        title: 'Réviser Flutter',
        description: 'Étudier les widgets',
        priority: TaskPriority.high,
        category: 'study',
        createdAt: createdAt,
        dueDate: DateTime.utc(2026, 10, 30, 12),
        reminderAt: DateTime.utc(2026, 10, 30, 11),
      );

      final restored = Task.fromJson(original.toJson());

      expect(restored.id, original.id);
      expect(restored.title, original.title);
      expect(restored.description, original.description);
      expect(restored.priority, TaskPriority.high);
      expect(restored.category, 'study');
      expect(restored.createdAt, original.createdAt);
      expect(restored.dueDate, original.dueDate);
      expect(restored.reminderAt, original.reminderAt);
      expect(restored.isCompleted, false);
    });

    test('modifie une tâche sans changer son original', () {
      final original = Task(
        id: 'task-3',
        title: 'Ancien titre',
        createdAt: createdAt,
      );

      final updated = original.copyWith(
        title: 'Nouveau titre',
        isCompleted: true,
        priority: TaskPriority.high,
      );

      expect(updated.title, 'Nouveau titre');
      expect(updated.isCompleted, true);
      expect(updated.priority, TaskPriority.high);

      expect(original.title, 'Ancien titre');
      expect(original.isCompleted, false);
    });

    test('permet de supprimer une échéance', () {
      final task = Task(
        id: 'task-4',
        title: 'Rendre le devoir',
        createdAt: createdAt,
        dueDate: DateTime.utc(2026, 10, 30),
      );

      final updated = task.copyWith(clearDueDate: true);

      expect(updated.dueDate, isNull);
    });

    test('détecte une tâche en retard', () {
      final task = Task(
        id: 'task-5',
        title: 'Envoyer le rapport',
        createdAt: createdAt,
        dueDate: DateTime.utc(2026, 10, 26),
      );

      expect(task.isOverdueAt(DateTime.utc(2026, 10, 27)), isTrue);

      expect(
        task
            .copyWith(isCompleted: true)
            .isOverdueAt(DateTime.utc(2026, 10, 27)),
        isFalse,
      );
    });
  });
}
