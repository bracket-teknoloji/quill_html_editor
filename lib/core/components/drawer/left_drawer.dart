import 'package:flutter/material.dart';

class LeftDrawer extends StatefulWidget {
  const LeftDrawer({super.key});

  @override
  State<LeftDrawer> createState() => _LeftDrawerState();
}

class _LeftDrawerState extends State<LeftDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.red),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            duration: Duration(seconds: 10),
            child: Text("Favorite"),
          ),
        ]));
  }
}
