import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";

import "ui_helper.dart";

class IconHelper {
  //* Menu Items
  //*
  static Widget bigMenuIcon(String path, {Color? color, IconData? iconData}) =>
      iconData == null
          ? SvgPicture.asset(_getMenuIconPath(path),
              height: 40,
              colorFilter:
                  ColorFilter.mode(color ?? Colors.white, BlendMode.srcIn),)
          : Icon(
              iconData,
              size: 30,
              color: color ?? Colors.white,
            );
  static SvgPicture middleMenuIcon(String path, {Color? color}) =>
      SvgPicture.asset(_getMenuIconPath(path),
          height: 24,
          colorFilter:
              ColorFilter.mode(color ?? Colors.white, BlendMode.srcIn),);
  static SvgPicture smallMenuIcon(String path, {Color? color}) =>
      SvgPicture.asset(_getMenuIconPath(path),
          height: 20,
          colorFilter: ColorFilter.mode(
              color ?? UIHelper.primaryColor, BlendMode.srcIn,),);
  //*Big Icon
  //*

  static SvgPicture bigIcon(String path, {Color? color}) => SvgPicture.asset(
      _getIconPath(path),
      height: 100,
      colorFilter: ColorFilter.mode(color ?? Colors.white, BlendMode.srcIn),);
  //*AppBar Icon
  //*
  static SvgPicture appBarIcon(String path, {Color? color}) => SvgPicture.asset(
      _getIconPath(path),
      height: 20,
      colorFilter: ColorFilter.mode(color ?? Colors.white, BlendMode.srcIn),);
  //* Medium Icon
  //*
  static SvgPicture mediumIcon(String path, {Color? color}) => SvgPicture.asset(
      _getIconPath(path),
      height: 24,
      colorFilter:
          ColorFilter.mode(color ?? UIHelper.primaryColor, BlendMode.srcIn),);
  static SvgPicture mediumIconWhite(String path, {Color? color}) =>
      SvgPicture.asset(_getIconPath(path),
          height: 24,
          colorFilter:
              ColorFilter.mode(color ?? Colors.white, BlendMode.srcIn),);
  static SvgPicture mediumIconBlack(String path, {Color? color}) =>
      SvgPicture.asset(_getIconPath(path),
          height: 24,
          colorFilter:
              ColorFilter.mode(color ?? Colors.black, BlendMode.srcIn),);

  //* Small Icon
  //*
  static SvgPicture smallIcon(String path, {Color? color, double? size}) =>
      SvgPicture.asset(_getIconPath(path),
          height: size ?? 20,
          colorFilter: ColorFilter.mode(
              color ?? UIHelper.primaryColor, BlendMode.srcIn,),);
  static SvgPicture smallIconWhite(String path, {Color? color}) =>
      SvgPicture.asset(_getIconPath(path),
          height: 20,
          colorFilter:
              ColorFilter.mode(color ?? Colors.white, BlendMode.srcIn),);
  static SvgPicture smallIconBlack(String path, {Color? color}) =>
      SvgPicture.asset(_getIconPath(path),
          height: 20,
          colorFilter:
              ColorFilter.mode(color ?? Colors.black, BlendMode.srcIn),);

  static String _getMenuIconPath(String path) =>
      "assets/icons/PickerSvgIcon/AnaMenu/$path.svg";
  static String _getIconPath(String path) =>
      "assets/icons/PickerSvgIcon/$path.svg";
}
