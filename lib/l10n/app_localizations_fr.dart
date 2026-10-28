// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get appTitle => 'TaskFlow';

  @override
  String get homeTitle => 'Mes tâches';

  @override
  String get addTask => 'Ajouter une tâche';

  @override
  String get editTask => 'Modifier la tâche';

  @override
  String get taskTitle => 'Titre';

  @override
  String get description => 'Description';

  @override
  String get priority => 'Priorité';

  @override
  String get lowPriority => 'Basse';

  @override
  String get mediumPriority => 'Moyenne';

  @override
  String get highPriority => 'Haute';

  @override
  String get category => 'Catégorie';

  @override
  String get dueDate => 'Date limite';

  @override
  String get reminder => 'Rappel';

  @override
  String get allTasks => 'Toutes';

  @override
  String get pendingTasks => 'En cours';

  @override
  String get completedTasks => 'Terminées';

  @override
  String get save => 'Enregistrer';

  @override
  String get cancel => 'Annuler';

  @override
  String get delete => 'Supprimer';

  @override
  String get markCompleted => 'Marquer comme terminée';

  @override
  String get overdue => 'En retard';

  @override
  String get noTasks => 'Aucune tâche pour le moment';
}
