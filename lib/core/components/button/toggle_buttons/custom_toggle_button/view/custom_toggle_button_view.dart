import "package:flutter/material.dart";
import "package:get/get.dart";

class CustomToggleButton extends StatefulWidget {
  
  const CustomToggleButton({super.key});

  @override
  State<CustomToggleButton> createState() => _CustomToggleButtonState();
}

class _CustomToggleButtonState extends State<CustomToggleButton> {
  @override
  Widget build(BuildContext context) => LayoutBuilder(
        builder: (context, constraints) => ToggleButtons(
          direction: Axis.horizontal,
          constraints: BoxConstraints(
            minWidth: ((context.isPortrait ? constraints.maxWidth : 600) * 0.2) / 5,
            minHeight: constraints.maxHeight * 0.05,
          ),
          isSelected: const [false, false, false, false, false],
          children: List.generate(
            5,
            (index) => const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Text",
              ),
            ),
          ),
          onPressed: (index) {},
        ),
      );
}
