import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../constants/ui_helper/radius_ui_helper.dart';
import '../snackbar/snackbar.dart';

class CustomGridTile extends StatefulWidget {
  final Column child;
  final Widget? header;
  final Widget? footer;
  final Color? color;
  final String? name;
  const CustomGridTile(
      {super.key,
      required this.child,
      this.header,
      this.footer,
      this.color,
      this.name});

  @override
  State<CustomGridTile> createState() => CustomGridTileState();
}

class CustomGridTileState extends State<CustomGridTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadiusHelper.radiusAllMid,
      splashColor: Colors.amber,
      onTap: () {
        var box = Hive.box("login");
        debugPrint(box.get("user").toString());
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBarManager.snackBarOnClick(widget.name ?? ""));
      },
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusHelper.radiusAllSmall),
        color: widget.color,
        child: GridTile(
            header: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Spacer(
                  flex: 4,
                ),
                Flexible(flex: 2, child: widget.header ?? const Text("")),
              ],
            ),
            footer: Center(child: widget.footer),
            child: widget.child),
      ),
    );
  }
}
