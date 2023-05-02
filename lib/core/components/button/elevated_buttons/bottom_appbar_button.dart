import 'package:flutter/material.dart';

import '../../../constants/ui_helper/ui_helper.dart';

class AppBarButton extends StatelessWidget {
  final Widget? child;
  final Function()? onPressed;
  const AppBarButton({super.key, this.child, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
          alignment: Alignment.center,
          backgroundColor: UIHelper.primaryColor.withOpacity(0.1),
          shadowColor: Colors.transparent,
          elevation: 0,
        ),
        onPressed: onPressed,
        child: child);
  }
}
