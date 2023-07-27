// an extension for change color of the text widget

import 'package:flutter/material.dart';

extension TextExtension on Text {
  Text changeColor(Color color) {
    return Text(
      data ?? "",
      style: style?.copyWith(color: color),
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
    );
  }
}

//an extewnsion for change color of text widget to blue
extension TextBlue on Text {
  Text get changeColorBlue {
    return Text(
      data ?? "",
      style: style?.copyWith(color: Colors.blue),
      textAlign: textAlign,
      textDirection: textDirection,
      locale: locale,
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
      semanticsLabel: semanticsLabel,
      textWidthBasis: textWidthBasis,
    );
  }
}
