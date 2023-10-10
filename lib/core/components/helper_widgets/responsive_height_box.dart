import "package:flutter/material.dart";
import "package:kartal/kartal.dart";

class ResponsiveBox extends StatelessWidget {
  const ResponsiveBox({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration.zero, height: heightController(context));
  }

  double heightController(BuildContext context) =>
      context.general.isKeyBoardOpen ? context.sized.dynamicHeight(0.3) : 0;
}
