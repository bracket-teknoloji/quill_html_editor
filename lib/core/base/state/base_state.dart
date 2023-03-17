import 'package:flutter/material.dart';
abstract class BaseState<T extends StatefulWidget> extends State<T> {
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
  ThemeData get theme => Theme.of(context);
  ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
          SnackBar snackBar) =>
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
  void hideSnackBar() => ScaffoldMessenger.of(context).clearSnackBars();
}
