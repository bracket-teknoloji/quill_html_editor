import "package:flutter/material.dart";

import "../../constants/enum/badge_color_enum.dart";
import "../../constants/ui_helper/ui_helper.dart";

final class ColorfulBadge extends StatefulWidget {
  const ColorfulBadge({required this.label, super.key, this.badgeColorEnum, this.onTap});
  final Widget label;
  final BadgeColorEnum? badgeColorEnum;
  final void Function()? onTap;

  @override
  State<ColorfulBadge> createState() => _ColorfulBadgeState();
}

final class _ColorfulBadgeState extends State<ColorfulBadge> {
  @override
  Widget build(BuildContext context) => Badge(
    textStyle: const TextStyle(fontSize: UIHelper.midSize),
    label: _child(),
    textColor: (_getColor().computeLuminance()) > 0.3 ? Colors.black : Colors.white,
    backgroundColor: _getColor(),
  );

  Color _getColor() => (widget.badgeColorEnum ?? BadgeColorEnum.cari).getColor;

  Widget _child() {
    if (widget.onTap != null) {
      return InkWell(onTap: widget.onTap, child: widget.label);
    } else {
      return widget.label;
    }
  }
}
