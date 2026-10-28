enum TaskPriority { low, medium, high }

class Task {
  final String id;
  final String title;
  final String description;
  final TaskPriority priority;
  final String category;
  final DateTime createdAt;
  final DateTime? dueDate;
  final DateTime? reminderAt;
  final bool isCompleted;

  const Task({
    required this.id,
    required this.title,
    this.description = '',
    this.priority = TaskPriority.medium,
    this.category = 'personal',
    required this.createdAt,
    this.dueDate,
    this.reminderAt,
    this.isCompleted = false,
  });

  /// Crée une nouvelle version de la tâche sans modifier l'originale.
  Task copyWith({
    String? title,
    String? description,
    TaskPriority? priority,
    String? category,
    DateTime? dueDate,
    DateTime? reminderAt,
    bool? isCompleted,
    bool clearDueDate = false,
    bool clearReminder = false,
  }) {
    return Task(
      id: id,
      title: title ?? this.title,
      description: description ?? this.description,
      priority: priority ?? this.priority,
      category: category ?? this.category,
      createdAt: createdAt,
      dueDate: clearDueDate ? null : dueDate ?? this.dueDate,
      reminderAt: clearReminder ? null : reminderAt ?? this.reminderAt,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  /// Convertit la tâche en données JSON pour la sauvegarde.
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'priority': priority.name,
      'category': category,
      'createdAt': createdAt.toIso8601String(),
      'dueDate': dueDate?.toIso8601String(),
      'reminderAt': reminderAt?.toIso8601String(),
      'isCompleted': isCompleted,
    };
  }

  /// Reconstruit une tâche à partir de données JSON.
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      priority: TaskPriority.values.firstWhere(
        (value) => value.name == json['priority'],
        orElse: () => TaskPriority.medium,
      ),
      category: json['category'] as String? ?? 'personal',
      createdAt: DateTime.parse(json['createdAt'] as String),
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      reminderAt: json['reminderAt'] == null
          ? null
          : DateTime.parse(json['reminderAt'] as String),
      isCompleted: json['isCompleted'] as bool? ?? false,
    );
  }

  /// Une tâche est en retard si son échéance est dépassée
  /// et qu'elle n'est pas terminée.
  bool isOverdueAt(DateTime now) {
    return !isCompleted && dueDate != null && dueDate!.isBefore(now);
  }
}
