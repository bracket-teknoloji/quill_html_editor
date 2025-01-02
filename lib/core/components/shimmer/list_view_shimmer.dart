import "dart:math";

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:shimmer/shimmer.dart";

import "../../base/state/base_state.dart";
import "../../constants/color_palette.dart";
import "../../constants/ui_helper/ui_helper.dart";

final class ListViewShimmer extends StatefulWidget {
  const ListViewShimmer({super.key});

  @override
  State<ListViewShimmer> createState() => _ListViewShimmerState();
}

final class _ListViewShimmerState extends BaseState<ListViewShimmer> {
  @override
  Widget build(BuildContext context) => ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(
          10,
          (index) => Shimmer.fromColors(
            baseColor: ColorPalette.slateGray.withValues(alpha: 0.1),
            highlightColor: ColorPalette.slateGray.withValues(alpha: 0.2),
            child: Card(
              elevation: 0,
              color: theme.colorScheme.surfaceContainerHighest.withValues(alpha: 0.3),
              child: ListTile(
                leading: const CircleAvatar(),
                title: Container(
                  width: 100,
                  height: 20,
                  decoration: BoxDecoration(
                    borderRadius: UIHelper.lowBorderRadius,
                    color: Colors.white,
                  ),
                ).paddingOnly(bottom: UIHelper.lowSize),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      //create a list of badges. size of badges is random
                      children: List.generate(
                        Random().nextInt(4),
                        (index) => const Badge(
                          label: Text("deneme"),
                        ).paddingOnly(right: UIHelper.lowSize),
                      ),
                    ).paddingOnly(bottom: UIHelper.lowSize),
                    Container(
                      width: containerWidth,
                      height: 15,
                      decoration: BoxDecoration(
                        borderRadius: UIHelper.lowBorderRadius,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );

  double get containerWidth {
    while (true) {
      final double widthOfContainer = Random().nextDouble() * (MediaQuery.sizeOf(context).width * 0.5);
      if (widthOfContainer > 100) {
        return widthOfContainer;
      }
    }
  }
}
