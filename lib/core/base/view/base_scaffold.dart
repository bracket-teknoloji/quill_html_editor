import 'package:flutter/material.dart';

class BaseScaffold extends StatefulWidget {
  final Widget child;
  const BaseScaffold({
    super.key,
    required this.child,
  });

  @override
  State<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(body: widget.child), onWillPop: () async => false);
  }
}
