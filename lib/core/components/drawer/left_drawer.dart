import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

import '../../constants/ui_helper/icon_helper.dart';
import '../../constants/ui_helper/ui_helper.dart';

class LeftDrawer extends StatefulWidget {
  const LeftDrawer({super.key});

  @override
  State<LeftDrawer> createState() => _LeftDrawerState();
}

class _LeftDrawerState extends State<LeftDrawer> {
  List list = [];
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      ListTile(
        title: const Text("Favoriler"),
        trailing: IconButton(
            onPressed: () {},
            icon: IconHelper.getIcon(
              IconHelper.smallIconBlack,
              Icons.mode_edit_rounded,
            )),
      ),
      const Divider(),
      list.isNullOrEmpty
          ? Expanded(
              flex: 2,
              child: Column(
                children: [
                  const Icon(
                    Icons.star_border_outlined,
                    color: Colors.black12,
                    size: 100,
                  ),
                  const Text(
                    "Favori menü yok.",
                    style: TextStyle(
                      color: Colors.black38,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Padding(
                    padding: UIHelper.midPaddingHorizontal,
                    child: const Text(
                      "Eklemek için menü öğelerinde favori simgesine dokunun.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black26,
                        fontWeight: FontWeight.w300,
                        fontSize: 15,
                        textBaseline: TextBaseline.ideographic,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) => ListTile(title: Text(list[index]), leading: const Icon(Icons.account_circle_outlined), onTap: () {}), itemCount: list.length)),
    ]));
  }
}
