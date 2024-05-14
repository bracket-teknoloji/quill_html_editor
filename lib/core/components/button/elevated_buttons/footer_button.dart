import "package:flutter/material.dart";

class FooterButton extends StatelessWidget {
  final Color? color;
  final List<Widget> children;
  final dynamic Function()? onPressed;
  const FooterButton({super.key, this.color, required this.children, this.onPressed});

  @override
  Widget build(BuildContext context) => ElevatedButton(
        style: ButtonStyle(
          elevation: WidgetStateProperty.all(0),
          padding: WidgetStateProperty.all(EdgeInsets.zero),
          backgroundColor: WidgetStateProperty.all(color ?? Theme.of(context).appBarTheme.systemOverlayStyle?.statusBarColor),
          foregroundColor: WidgetStateProperty.all(Theme.of(context).colorScheme.onSurface),
        ),
        onPressed: onPressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: children,
        ),
      );
}
