import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  String toDateString() {
    return DateFormat('dd.MM.yyyy').format(this);
  }
}
extension DateTimeExtensionWithTime on DateTime {
  String toDateTimeString() {
    return DateFormat('dd.MM.yyyy HH:mm:ss').format(this);
  }
}