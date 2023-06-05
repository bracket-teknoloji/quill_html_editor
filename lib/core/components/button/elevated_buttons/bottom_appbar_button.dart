import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/extensions/list_extensions.dart';
import '../../../constants/ui_helper/ui_helper.dart';

class AppBarButton extends StatelessWidget {
  final Widget? child;
  final Function()? onPressed;
  final IconData? icon;
  const AppBarButton({super.key, this.child, this.onPressed, this.icon});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          textStyle: const TextStyle(fontSize: 12),
          backgroundColor: UIHelper.primaryColor.withOpacity(0.1),
          shadowColor: Colors.transparent,
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Center(
          child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              crossAxisAlignment: WrapCrossAlignment.center,
              direction: context.isPortrait ? Axis.vertical : Axis.horizontal,
              children: [
                icon != null
                    ? Icon(
                        icon,
                        size: 20,
                        fill: 1,
                      )
                    : null,
                child
              ].nullCheck.cast<Widget>()),
        ));
  }
}
