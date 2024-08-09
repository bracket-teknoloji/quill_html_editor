import "dart:math";

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:shimmer/shimmer.dart";

final class GridViewShimmer extends StatefulWidget {
  final SliverGridDelegateWithFixedCrossAxisCount gridDelegate;
  const GridViewShimmer({super.key, required this.gridDelegate});

  @override
  State<GridViewShimmer> createState() => _GridViewShimmerState();
}

final class _GridViewShimmerState extends State<GridViewShimmer> {
  @override
  Widget build(BuildContext context) => GridView(
        gridDelegate: widget.gridDelegate,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          10 * widget.gridDelegate.crossAxisCount,
          (index) => Shimmer.fromColors(
            baseColor: Colors.grey.withOpacity(0.1),
            highlightColor: Colors.grey.withOpacity(0.2),
            child: card(),
          ),
        ),
      );

  Card card() => Card(
        child: GridTile(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Expanded(
                child: Center(
                  child: Icon(Icons.account_circle_outlined, size: UIHelper.midSize * 5),
                ),
              ),
              Container(
                width: containerWidth,
                height: UIHelper.midSize,
                decoration: BoxDecoration(
                  borderRadius: UIHelper.lowBorderRadius,
                  color: Colors.white,
                ),
              ).paddingSymmetric(vertical: UIHelper.lowSize),
              Container(
                width: containerWidth,
                height: UIHelper.midSize,
                decoration: BoxDecoration(
                  borderRadius: UIHelper.lowBorderRadius,
                  color: Colors.white,
                ),
              ),
            ],
          ).paddingAll(UIHelper.lowSize),
        ),
      );

  double get containerWidth {
    while (true) {
      final double widthOfContainer = Random().nextDouble() * (MediaQuery.sizeOf(context).width * 0.5);
      if (widthOfContainer > 100 / widget.gridDelegate.crossAxisCount) {
        return widthOfContainer;
      }
    }
  }
}
