

import "package:flutter/material.dart";

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
  });
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) => SafeArea(
      child: AppBar(
        title: Text(title ?? ""),
        leading: leading,
        actions: [
          ...?actions,
        ],
      ),
    );

  @override
  Size get preferredSize => const Size.fromHeight(kBottomNavigationBarHeight);
}
