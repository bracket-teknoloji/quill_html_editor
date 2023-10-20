import "package:intl/intl.dart";

extension DateTimeExtension on DateTime? {
  String get toDateString {
    if (this == null) return "";
    return DateFormat("dd.MM.yyyy").format(this ?? DateTime.now());
  }

  String get toTimeString {
    if (this == null) return "";
    return DateFormat("HH:mm").format(this ?? DateTime.now());
  }

  DateTime? get dateTimeWithoutTime {
    if (this == null) return null;
    return DateTime(this!.year, this!.month, this!.day);
  }
}

extension DateTimeExtensionWithHypen on DateTime? {
  String toDateTimeHypenString() => DateFormat("dd_MM_yyyy_HH_mm_ss").format(this ?? DateTime.now());
}

extension DateTimeExtensionWithTime2 on DateTime? {
  String? toDateStringIfNull() {
    if (this == null) return null;
    return DateFormat("dd.MM.yyyy").format(this ?? DateTime.now());
  }
}

extension DateTimeExtensionWithTime on DateTime {
  String? toDateTimeString() => DateFormat("dd.MM.yyyy HH:mm:ss").format(this);
}

// am extension for String dd.MM.yyyy to DateTime
extension StringExtension on String? {
  DateTime toDateTimeDDMMYYYY() => DateFormat("dd.MM.yyyy").parse(this!, true);
}

// an extension for get monday to today
extension DateTimeExtensionMonday on DateTime {
  DateTime getMonday() {
    final DateTime now = DateTime.now();
    final DateTime monday = now.subtract(Duration(days: now.weekday - 1));
    return monday;
  }
}
