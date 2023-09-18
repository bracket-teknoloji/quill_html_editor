import "package:flutter/material.dart";

import "base_appbar.dart";
import "base_scaffold.dart";

// ignore: must_be_immutable
class BaseView<T> extends StatefulWidget {
   BaseView(
      {super.key,
      this.viewModel,
      this.onModelReady,
      this.onDispose,
      required this.builder,
      this.title,
      this.leading,
      this.actions});
  final Widget Function(BuildContext context, T value) builder;
  final T? viewModel;
  final Function(T)? onModelReady;
  final VoidCallback? onDispose;

  /// [AppBar]
   String? title;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  State<BaseView> createState() => _BaseViewState();
}

class _BaseViewState extends State<BaseView> {
  @override
  void initState() {
    super.initState();
    if (widget.onModelReady != null) widget.onModelReady!(widget.viewModel!);
  }

  @override
  void dispose() {
    super.dispose();
    widget.onDispose;
  }
  set setTitle (String title) {
    setState(() {
      widget.title = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
          title: widget.title,
          leading: widget.leading,
          actions: widget.actions),
      body: BaseScaffold(
        builder: widget.builder,
        viewModel: widget.viewModel,)
    );
  }
}
