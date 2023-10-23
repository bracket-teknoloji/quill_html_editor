import "package:flutter/material.dart";

import "../../constants/enum/badge_color_enum.dart";
import "../../constants/extensions/widget_extensions.dart";
import "../../constants/ui_helper/ui_helper.dart";

class ColorfulBadge extends StatefulWidget {
  final Widget? label;
  final BadgeColorEnum? badgeColorEnum;
  const ColorfulBadge({super.key, this.badgeColorEnum, this.label});

  @override
  State<ColorfulBadge> createState() => _ColorfulBadgeState();
}

class _ColorfulBadgeState extends State<ColorfulBadge> {
  @override
  Widget build(BuildContext context) => Badge(
        textStyle: TextStyle(fontSize: UIHelper.midSize),
        label: widget.label,
        textColor: widget.badgeColorEnum?.getFontColor,
        backgroundColor: widget.badgeColorEnum?.getColor,
      ).yetkiVarMi(widget.label != null);
}
