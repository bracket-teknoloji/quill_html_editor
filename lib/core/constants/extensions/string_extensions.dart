extension StringExtensions on String? {
  String get removeZerosFromStart {
    //remove all zeros from start
    if (this == null) return "";
    if (this!.isEmpty) return "";
    if (this!.startsWith("0")) {
      return this!.substring(1).removeZerosFromStart;
    } else {
      return this!;
    }
  }
}
