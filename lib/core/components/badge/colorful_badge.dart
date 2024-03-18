import "package:flutter/material.dart";

import "../../base/state/base_state.dart";
import "../../constants/enum/badge_color_enum.dart";
import "../../constants/extensions/widget_extensions.dart";
import "../../constants/ui_helper/ui_helper.dart";

class ColorfulBadge extends StatefulWidget {
  final Widget? label;
  final BadgeColorEnum? badgeColorEnum;
  final void Function()? onTap;
  const ColorfulBadge({super.key, this.badgeColorEnum, this.label, this.onTap});

  @override
  State<ColorfulBadge> createState() => _ColorfulBadgeState();
}

class _ColorfulBadgeState extends BaseState<ColorfulBadge> {
  @override
  Widget build(BuildContext context) => Badge(
        textStyle: const TextStyle(fontSize: UIHelper.midSize),
        label: InkWell(
          onTap: widget.onTap,
          child: widget.label,
        ),
        textColor: (widget.badgeColorEnum?.getColor.computeLuminance() ?? 0) > 0.3 ? Colors.black : Colors.white,
        backgroundColor: widget.badgeColorEnum?.getColor ?? UIHelper.primaryColor,
      ).yetkiVarMi(widget.label != null);
}
