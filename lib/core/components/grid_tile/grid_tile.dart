import 'package:flutter/material.dart';

class CustomGridTile extends StatefulWidget {
  final Widget child;
  final IconButton? header;
  final Widget? footer;
  const CustomGridTile(
      {super.key, required this.child, this.header, this.footer});

  @override
  State<CustomGridTile> createState() => CustomGridTileState();
}

class CustomGridTileState extends State<CustomGridTile> {
  @override
  Widget build(BuildContext context) {
    return GridTile(
        header: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Spacer(),
            Flexible(child: widget.header ?? Container()),
          ],
        ),
        child: Center(child: widget.child));
  }
}
