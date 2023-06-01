import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../base/state/base_state.dart';
import '../button/elevated_buttons/bottom_appbar_button.dart';

class AppBarPreferedSizedBottom extends StatefulWidget {
  final List<AppBarButton> children;
  const AppBarPreferedSizedBottom({super.key, required this.children});

  @override
  State<AppBarPreferedSizedBottom> createState() => _AppBarPreferedSizedBottomState();
}

class _AppBarPreferedSizedBottomState extends BaseState<AppBarPreferedSizedBottom> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height * 0.07,
      child: ListView(
        shrinkWrap: true,
        itemExtent: width * (1 / widget.children.length < 0.2 ? 0.2 : 1 / widget.children.length),
        scrollDirection: Axis.horizontal,
        children: widget.children.map((e) => e.paddingAll(5)).toList(),
      ),
    );
  }
}
