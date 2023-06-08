import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime? {
  String toDateString() {
    return DateFormat('dd.MM.yyyy').format(this ?? DateTime.now());
  }
}

extension DateTimeExtensionWithTime2 on DateTime? {
  String? toDateStringIfNull() {
    if (this == null) return null;
    return DateFormat('dd.MM.yyyy').format(this ?? DateTime.now());
  }
}

extension DateTimeExtensionWithTime on DateTime {
  String? toDateTimeString() {
    return DateFormat('dd.MM.yyyy HH:mm:ss').format(this);
  }
}

// am extension for String dd.MM.yyyy to DateTime
extension StringExtension on String? {
  DateTime toDateTimeDDMMYYYY() {
    return DateFormat('dd.MM.yyyy').parse(this!, true);
  }
}
