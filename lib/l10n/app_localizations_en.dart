// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'TaskFlow';

  @override
  String get homeTitle => 'My tasks';

  @override
  String get addTask => 'Add a task';

  @override
  String get editTask => 'Edit task';

  @override
  String get taskTitle => 'Title';

  @override
  String get description => 'Description';

  @override
  String get priority => 'Priority';

  @override
  String get lowPriority => 'Low';

  @override
  String get mediumPriority => 'Medium';

  @override
  String get highPriority => 'High';

  @override
  String get category => 'Category';

  @override
  String get dueDate => 'Due date';

  @override
  String get reminder => 'Reminder';

  @override
  String get allTasks => 'All';

  @override
  String get pendingTasks => 'Pending';

  @override
  String get completedTasks => 'Completed';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get delete => 'Delete';

  @override
  String get markCompleted => 'Mark as completed';

  @override
  String get overdue => 'Overdue';

  @override
  String get noTasks => 'No tasks yet';
}
