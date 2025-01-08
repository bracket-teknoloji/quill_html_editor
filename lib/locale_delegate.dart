import "package:flutter/material.dart";

import "generated/locale_base.dart";

final class LocDelegate extends LocalizationsDelegate<LocaleBase> {
  const LocDelegate();
  final idMap = const {"en": "locales/EN_US.json", "tr": "locales/TR.json"};

  @override
  bool isSupported(Locale locale) => ["en", "tr"].contains(locale.languageCode);

  @override
  Future<LocaleBase> load(Locale locale) async {
    var lang = "en";
    if (isSupported(locale)) lang = locale.languageCode;
    final loc = LocaleBase();
    await loc.load(idMap[lang]!);
    return loc;
  }

  @override
  bool shouldReload(LocDelegate old) => false;
}
