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
}

extension DateTimeExtensionWithHypen on DateTime? {
  String toDateTimeHypenString() {
    return DateFormat("dd_MM_yyyy_HH_mm_ss").format(this ?? DateTime.now());
  }
}

extension DateTimeExtensionWithTime2 on DateTime? {
  String? toDateStringIfNull() {
    if (this == null) return null;
    return DateFormat("dd.MM.yyyy").format(this ?? DateTime.now());
  }
}

extension DateTimeExtensionWithTime on DateTime {
  String? toDateTimeString() {
    return DateFormat("dd.MM.yyyy HH:mm:ss").format(this);
  }
}

// am extension for String dd.MM.yyyy to DateTime
extension StringExtension on String? {
  DateTime toDateTimeDDMMYYYY() {
    return DateFormat("dd.MM.yyyy").parse(this!, true);
  }
}

// an extension for get monday to today
extension DateTimeExtensionMonday on DateTime {
  DateTime getMonday() {
    var now = DateTime.now();
    var monday = now.subtract(Duration(days: now.weekday - 1));
    return monday;
  }
}
