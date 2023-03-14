import 'package:flutter/material.dart';
import '../../../core/components/dialog/dialog_manager.dart';

class BaseScaffold extends StatefulWidget {
  final Widget Function(BuildContext context, dynamic value) builder;
  final dynamic viewModel;
  const BaseScaffold({super.key, required this.builder, this.viewModel});

  @override
  State<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: widget.builder(context, widget.viewModel),
        ),
        onWillPop: () async {
          DialogManager.exitDialog(context);
          return false;
        });
  }
}
