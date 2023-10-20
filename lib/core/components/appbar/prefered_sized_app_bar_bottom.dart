import "package:flutter/material.dart";

import "../../base/state/base_state.dart";
import "../button/elevated_buttons/bottom_appbar_button.dart";

class PreferedSizedAppBarBottom extends StatefulWidget {
  final List<AppBarButton?> children;
  const PreferedSizedAppBarBottom({super.key, required this.children});

  @override
  State<PreferedSizedAppBarBottom> createState() => _PreferedSizedAppBarBottomState();
}

class _PreferedSizedAppBarBottomState extends BaseState<PreferedSizedAppBarBottom> {
  @override
  Widget build(BuildContext context) => PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: SizedBox(
          height: height * 0.07,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: widget.children.map((AppBarButton? e) => e as Widget).toList(),
          ),
        ));
}
