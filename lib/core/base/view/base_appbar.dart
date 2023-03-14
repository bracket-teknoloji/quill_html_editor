import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picker/core/components/dialog/dialog_manager.dart';

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
  Widget build(BuildContext context) {
    return SafeArea(
      child: AppBar(
        title: Text(title ?? ""),
        leading: leading,
        actions: [
          ...?actions,
          IconButton(
              onPressed: () {
                DialogManager.exitDialog(context);
              },
              icon: const Icon(Icons.logout_outlined)),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kBottomNavigationBarHeight);
}
