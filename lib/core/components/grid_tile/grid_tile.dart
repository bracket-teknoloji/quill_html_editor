import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomGridTile extends StatefulWidget {
  final Widget child;
  final Widget? header;
  final Widget? footer;
  const CustomGridTile(
      {super.key, required this.child, this.header, this.footer});

  @override
  State<CustomGridTile> createState() => CustomGridTileState();
}

class CustomGridTileState extends State<CustomGridTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: context.colorScheme.surface,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: context.colorScheme.onSurface.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 5))
          ]),
      child: GridTile(
          header: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(
                flex: 3,
              ),
              Flexible(child: widget.header ?? Container(), flex: 2),
            ],
          ),
          child: Center(child: widget.child)),
    );
  }
}
