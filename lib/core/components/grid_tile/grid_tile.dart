import 'package:flutter/material.dart';
import 'package:picker/core/components/snackbar/snackbar.dart';

class CustomGridTile extends StatefulWidget {
  final Column child;
  final Widget? header;
  final Widget? footer;
  final Color? color;
  const CustomGridTile(
      {super.key, required this.child, this.header, this.footer, this.color});

  @override
  State<CustomGridTile> createState() => CustomGridTileState();
}

class CustomGridTileState extends State<CustomGridTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      onTap: () {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBarManager.snackBarOnClick);
      },
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(5))),
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
