// an extension on int to separate the digits with commas
import "package:intl/intl.dart";
import "package:kartal/kartal.dart";

import "../ondalik_utils.dart";

// an extension on num to seperate the digits with commas and after fixed number of digits
extension NumExtensionWithFixedDigits on num? {
  String commaSeparatedWithDecimalDigits(OndalikEnum decimalDigits) {
    if (this != null) {
      final f = NumberFormat.decimalPatternDigits(
        locale: "TR",
        decimalDigits: this! % 1 == 0 ? 0 : decimalDigits.ondalik,
      );
      String finalValue = f.format(this);
      if (finalValue == "-0,00") {
        return "0";
      } else {
        while ((finalValue.endsWith("0") || finalValue.endsWith(",")) && finalValue.contains(",")) {
          finalValue = finalValue.substring(0, finalValue.length - 1);
        }
        return finalValue;
      }
    } else {
      return "0";
    }
  }

  String? get toStringIfNotNull => this == null ? null : toString();

  double get toNotNaN => this?.isNaN ?? false ? 0 : this?.toDouble() ?? 0;

  String get dotSeparatedWithFixedDigits {
    if (this != null) {
      return this!.toStringAsFixed(2).replaceAllMapped(RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"), (m) => "${m[1]}.");
    } else {
      return "0.00";
    }
  }

  num? get toIntIfDouble {
    if (this == null) return null;
    return this! % 1 == 0 ? this?.toInt() : this;
  }
}

extension NumExtensionWithFormattedStringToDouble on String? {
  double get toDoubleWithFormattedString {
    if (this == null) return 0;
    if (ext.isNotNullOrNoEmpty) {
      return double.tryParse(this!.replaceAll(".", "").replaceAll(",", ".")) ?? 0;
    } else {
      return 0;
    }
  }
}
