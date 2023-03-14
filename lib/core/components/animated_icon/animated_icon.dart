import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';

class CustomAnimatedIcon extends StatefulWidget {
  const CustomAnimatedIcon({super.key, this.onStart, this.onEnd});
  final bool Function()? onStart;
  final bool Function()? onEnd;

  @override
  State<CustomAnimatedIcon> createState() => CustomAnimatedIconState();
}

class CustomAnimatedIconState extends State<CustomAnimatedIcon>
    with SingleTickerProviderStateMixin {
  late AnimateIconController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimateIconController();
  }

  @override
  Widget build(BuildContext context) {
    return AnimateIcons(
      startIcon: Icons.add,
      endIcon: Icons.close,
      controller: controller,
      size: 60.0,
      onStartIconPress: widget.onStart!,
      onEndIconPress: widget.onEnd!,
      duration: context.durationLow,
      startIconColor: Colors.deepPurple,
      endIconColor: Colors.deepOrange,
      clockwise: false,
    );
  }
}
