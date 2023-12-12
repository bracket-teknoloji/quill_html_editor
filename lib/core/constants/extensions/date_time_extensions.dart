import "package:flutter/material.dart";
import "package:intl/intl.dart";

extension DateTimeExtension on DateTime? {
  String get toDateString => this == null ? "" : DateFormat("dd.MM.yyyy").format(this!);

  String get toTimeString => this == null ? "" : DateFormat("HH:mm").format(this!);

  DateTime? get dateTimeWithoutTime => this == null ? null : DateTime(this!.year, this!.month, this!.day);

  String? get toDateStringIfNull => this == null ? null : DateFormat("dd.MM.yyyy").format(this!);

  String? get toDateTimeHypenString => this == null ? null : DateFormat("dd.MM.dd_MM_yyyy_HH_mm_ss").format(this!);

  TimeOfDay? get toTimeOfDay => this == null ? null : TimeOfDay(hour: this!.hour, minute: this!.minute);
}

extension DateTimeExtensionWithTime on DateTime {
  String? toDateTimeString() => DateFormat("dd.MM.yyyy HH:mm:ss").format(this);

  DateTime getMonday() {
    final now = DateTime.now();
    final monday = now.subtract(Duration(days: now.weekday - 1));
    return monday;
  }

  /// First one
  List<String> getWeekOfYear(int weekOfYear) {
    // get datetime of week of year
    final weekOfYearDateTime = subtract(Duration(days: weekday - 1)).add(Duration(days: weekOfYear * 7));
    final monday = weekOfYearDateTime.subtract(Duration(days: weekOfYearDateTime.weekday - 1));
    final saturday = monday.add(const Duration(days: 6));
    return [
      DateFormat("dd.MM.yyyy").format(monday),
      DateFormat("dd.MM.yyyy").format(saturday),
    ];
  }
}

// am extension for String dd.MM.yyyy to DateTime
extension StringExtension on String? {
  DateTime toDateTimeDDMMYYYY() => DateFormat("dd.MM.yyyy").parse(this!, true);
}

extension TimeOfDayExtensions on TimeOfDay {
  String get toTimeString => "${hour.toString().padLeft(2, "0")}:${minute.toString().padLeft(2, "0")}";
}
