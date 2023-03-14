import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MainAppBar({super.key, this.title, this.leading, this.actions, this.onPressed});
  final void Function()? onPressed;
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        title: Text(title ?? ""),
        leading: leading,
        actions: [
          ...?actions,
          IconButton(onPressed: onPressed, icon: const Icon(Icons.logout_outlined)),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kBottomNavigationBarHeight);
}
