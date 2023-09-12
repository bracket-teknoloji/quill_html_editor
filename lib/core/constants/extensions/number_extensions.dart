// an extension on int to separate the digits with commas
import "package:get/get.dart";
import "package:intl/intl.dart";
import "package:kartal/kartal.dart";

import "../ondalik_utils.dart";

// an extension on num to seperate the digits with commas and after fixed number of digits
extension NumExtensionWithFixedDigits on num? {
  String get commaSeparated {
    if (this != null) {
      var f = NumberFormat.decimalPatternDigits(locale: Get.locale!.languageCode);
      return f.format(this!);
    } else {
      return "0,00";
    }
  }

  // String get commaSeparatedWithFixedDigits {
  //   if (this != null) {
  //     var f = NumberFormat.decimalPatternDigits(locale: Get.locale!.languageCode, decimalDigits: 2);
  //     return f.format(this!);
  //   } else {
  //     return "0,00";
  //   }
  // }

  String commaSeparatedWithDecimalDigits(OndalikEnum decimalDigits) {
    if (this != null) {
      var f = NumberFormat.decimalPatternDigits(locale: Get.locale!.languageCode, decimalDigits: decimalDigits.ondalik);
      if (this! % 1 == 0) {
        return toIntIfDouble!.toString();
      } else {
        return f.format(this!);
      }
    } else {
      return "0,00";
    }
  }

  String? get toStringIfNotNull {
    return toString() == "null" ? null : toString();
  }

  String get dotSeparatedWithFixedDigits {
    if (this != null) {
      return this!.toStringAsFixed(2).replaceAllMapped(RegExp(r"(\d{1,3})(?=(\d{3})+(?!\d))"), (Match m) => "${m[1]}.");
    } else {
      return "0,00";
    }
  }

  num? get toIntIfDouble {
    if (this != null) {
      if (this! % 1 == 0) {
        return this!.toInt();
      } else {
        return this!;
      }
    } else {
      return null;
    }
  }
}

extension NumExtensionWithFormattedStringToDouble on String? {
  double get toDoubleWithFormattedString {
    if (ext.isNotNullOrNoEmpty) {
      return double.parse(this!.replaceAll(".", "").replaceAll(",", "."));
    } else {
      return 0;
    }
  }
}
