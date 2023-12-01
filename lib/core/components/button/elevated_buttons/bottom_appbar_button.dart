import "package:flutter/material.dart";
import "package:get/get.dart";

import "../../../constants/extensions/list_extensions.dart";
import "../../../constants/ui_helper/ui_helper.dart";

class AppBarButton extends StatelessWidget {
  final Widget? child;
  final Function()? onPressed;
  final IconData? icon;
  final Widget? iconWidget;
  final bool? hasFilter;
  const AppBarButton({super.key, this.child, this.onPressed, this.icon, this.hasFilter, this.iconWidget});

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          padding: UIHelper.zeroPadding,
          textStyle: const TextStyle(fontSize: 12),
          backgroundColor: UIHelper.primaryColor.withOpacity(0.1),
          shadowColor: Colors.transparent,
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.center,
          direction: context.isPortrait ? Axis.vertical : Axis.horizontal,
          children: [
            if (icon != null)
              Icon(
                icon,
                size: UIHelper.midSize * 2,
                fill: 1,
                color: (hasFilter ?? false) ? UIHelper.primaryColor : null,
              )
            else
              null,
            iconWidget ?? const SizedBox(),
            child,
          ].nullCheckWithGeneric,
        ),
      );
}
