import 'package:flutter/material.dart';

import '../state/base_state.dart';

class BaseScaffold extends StatefulWidget {
  final Widget Function(BuildContext context, dynamic value) builder;
  final dynamic viewModel;
  const BaseScaffold({super.key, required this.builder, this.viewModel});

  @override
  State<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends BaseState<BaseScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.builder(context, widget.viewModel),
    );
  }
}
