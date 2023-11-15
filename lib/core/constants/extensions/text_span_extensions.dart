import "package:flutter/material.dart";

extension TextSpanExtensions on TextSpan {
  TextSpan yetkiVarMi(bool? yetki) => yetki ?? false ? this : const TextSpan();
}
