import "package:flutter/material.dart";

import "ui_helper.dart";

class TextStyleHelper {
  //* Title
  //*
  static final TextStyle title = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: UIHelper.primaryColor);
  static const TextStyle titleBlack = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black);
  static const TextStyle titleWhite = TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white);

  //* Subtitle
  //*
  static final TextStyle subtitle = TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: UIHelper.primaryColor);
  static final TextStyle subtitleBlack = TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black.withOpacity(0.8));
  static const TextStyle subtitleWhite = TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Colors.white);

  //* Body
  //*
  static final TextStyle caption = TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: UIHelper.primaryColor);
  static const TextStyle captionBlack = TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.black);
  static const TextStyle captionWhite = TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: Colors.white);
}
