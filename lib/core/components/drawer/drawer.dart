import 'package:flutter/material.dart';

class FavoriteDrawer extends StatefulWidget {
  const FavoriteDrawer({super.key});

  @override
  State<FavoriteDrawer> createState() => _FavoriteDrawerState();
}

class _FavoriteDrawerState extends State<FavoriteDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
          DrawerHeader(
            curve: Curves.easeInQuint,
            decoration: BoxDecoration(color: Colors.red),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            duration: Duration(seconds: 10),
            child: Text("Favorite"),
          ),
        ]));
  }
}
