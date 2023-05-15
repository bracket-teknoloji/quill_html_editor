// an extension on int to separate the digits with commas
extension NumExtension on num {
  String get commaSeparated {
    return toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');
  }
}

// an extension on num to seperate the digits with commas and after fixed number of digits
extension NumExtensionWithFixedDigits on num {
  String get commaSeparatedWithFixedDigits {
    return toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }
}

// an extension on num to seperate the digits with dots and after fixed number of digits with comma
extension NumExtensionWithFixedDigitsAndComma on num {
  String get dotSeparatedWithFixedDigits {
    return toStringAsFixed(2).replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]}.');
  }
}

//an extension on num to string if null return empty string
extension NumExtensionToString on num? {
  String get toStringIfNull {
    return toString() == "null" ? "" : toString();
  }
}

// eğer tam sayı ise double'ları int'e çeviren tam sayı değilse kendisini döndüren extension
extension NumExtensionToInt on num {
  num get toIntIfDouble {
    if (this % 1 == 0) {
      return toInt();
    } else {
      return this;
    }
  }
}
