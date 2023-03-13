import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  double get width => MediaQuery.of(context).size.width;
  double get height => MediaQuery.of(context).size.height;
  ThemeData get theme => Theme.of(context);
  
}