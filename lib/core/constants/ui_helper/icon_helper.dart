import 'package:flutter/material.dart';

import 'ui_helper.dart';

class IconHelper {
  //* Big Icon
  //*
  static const IconThemeData bigIconBlack = IconThemeData(color: Colors.black, size: 24);
  static const IconThemeData bigIconWhite = IconThemeData(color: Colors.white, size: 24);
  static final IconThemeData bigIconPrimary = IconThemeData(color: UIHelper.primaryColor, size: 24);

  //* Medium Icon
  //*
  static const IconThemeData mediumIconBlack = IconThemeData(color: Colors.black38, size: 20);
  static const IconThemeData mediumIconWhite = IconThemeData(color: Colors.white38, size: 20);
  static final IconThemeData mediumIconPrimary = IconThemeData(color: UIHelper.primaryColor, size: 20);

  //* Small Icon
  //*
  static const IconThemeData smallIconBlack = IconThemeData(color: Colors.black, size: 16);
  static const IconThemeData smallIconWhite = IconThemeData(color: Colors.white, size: 16);
  static final IconThemeData smallIconPrimary = IconThemeData(color: UIHelper.primaryColor, size: 16);

  static Icon getIcon(IconThemeData iconThemeData, IconData iconData) => Icon(iconData, color: iconThemeData.color, size: iconThemeData.size);
}
