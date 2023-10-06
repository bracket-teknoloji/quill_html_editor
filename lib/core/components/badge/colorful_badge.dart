import "package:flutter/material.dart";

import "../../constants/enum/badge_color_enum.dart";
import "../../constants/extensions/widget_extensions.dart";

class ColorfulBadge extends StatefulWidget {
  final Widget? label;
  final BadgeColorEnum? badgeColorEnum;
  const ColorfulBadge({super.key, this.badgeColorEnum, this.label});

  @override
  State<ColorfulBadge> createState() => _ColorfulBadgeState();
}

class _ColorfulBadgeState extends State<ColorfulBadge> {
  @override
  Widget build(BuildContext context) {
    return Badge(
      label: widget.label,
      textColor: widget.badgeColorEnum?.getFontColor,
      backgroundColor: widget.badgeColorEnum?.getColor,
    ).yetkiVarMi(widget.label != null);
  }
}
