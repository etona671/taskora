// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get appTitle => 'تاسك فلو';

  @override
  String get homeTitle => 'مهامي';

  @override
  String get addTask => 'إضافة مهمة';

  @override
  String get editTask => 'تعديل المهمة';

  @override
  String get taskTitle => 'العنوان';

  @override
  String get description => 'الوصف';

  @override
  String get priority => 'الأولوية';

  @override
  String get lowPriority => 'منخفضة';

  @override
  String get mediumPriority => 'متوسطة';

  @override
  String get highPriority => 'عالية';

  @override
  String get category => 'الفئة';

  @override
  String get dueDate => 'تاريخ الاستحقاق';

  @override
  String get reminder => 'التذكير';

  @override
  String get allTasks => 'الكل';

  @override
  String get pendingTasks => 'قيد التنفيذ';

  @override
  String get completedTasks => 'مكتملة';

  @override
  String get save => 'حفظ';

  @override
  String get cancel => 'إلغاء';

  @override
  String get delete => 'حذف';

  @override
  String get markCompleted => 'تحديد كمكتملة';

  @override
  String get overdue => 'متأخرة';

  @override
  String get noTasks => 'لا توجد مهام حتى الآن';
}
