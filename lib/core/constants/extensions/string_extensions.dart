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

   String belgeNoToResmiBelgeNo(String belgeNo, DateTime? tarih) {
    // belgeNo is like as "EFT000000000012" and resmiBelgeNo should be "EFT2023000000012"
    if (belgeNo.length == 15) {
      return belgeNo.substring(0, 3) + (tarih?.year.toString() ?? "") + belgeNo.substring(6, 15);
    } else {
      return "";
    }
  }

  String? get withoutBlanks {
    if (this?.isEmpty == true) return null;
    return this;
  }
}
