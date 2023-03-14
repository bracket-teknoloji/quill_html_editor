import 'package:flutter/material.dart';
import 'base_scaffold.dart';
import 'base_appbar.dart';

class BaseView<T> extends StatefulWidget {
  const BaseView(
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
  final String? title;
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
