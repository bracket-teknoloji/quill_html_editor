import "package:intl/intl.dart";

extension DateTimeExtension on DateTime? {
  String get toDateString => this == null ? "" : DateFormat("dd.MM.yyyy").format(this!);

  String get toTimeString => this == null ? "" : DateFormat("HH:mm").format(this!);

  DateTime? get dateTimeWithoutTime => this == null ? null : DateTime(this!.year, this!.month, this!.day);

  String? get toDateStringIfNull => this == null ? null : DateFormat("dd.MM.yyyy").format(this!);

  String? get toDateTimeHypenString => this == null ? null : DateFormat("dd.MM.dd_MM_yyyy_HH_mm_ss").format(this!);

  String get getWeekOfYear {
    final now = DateTime.now();
    final monday = now.subtract(Duration(days: now.weekday - 1));
    final sunday = now.add(Duration(days: DateTime.daysPerWeek - now.weekday));
    return "${DateFormat("dd.MM.yyyy").format(monday)} - ${DateFormat("dd.MM.yyyy").format(sunday)}";
  }
}

extension DateTimeExtensionWithTime on DateTime {
  String? toDateTimeString() => DateFormat("dd.MM.yyyy HH:mm:ss").format(this);

  DateTime getMonday() {
    final now = DateTime.now();
    final monday = now.subtract(Duration(days: now.weekday - 1));
    return monday;
  }
}

// am extension for String dd.MM.yyyy to DateTime
extension StringExtension on String? {
  DateTime toDateTimeDDMMYYYY() => DateFormat("dd.MM.yyyy").parse(this!, true);
}
