import "dart:math";

import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:shimmer/shimmer.dart";

import "../../base/state/base_state.dart";
import "../../constants/ui_helper/ui_helper.dart";

class ListViewShimmer extends StatefulWidget {
  const ListViewShimmer({super.key});

  @override
  State<ListViewShimmer> createState() => _ListViewShimmerState();
}

class _ListViewShimmerState extends BaseState<ListViewShimmer> {
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Column(
          children: List.generate(
            10,
            (index) => Shimmer.fromColors(
              baseColor: Colors.grey.withOpacity(0.1),
              highlightColor: Colors.grey.withOpacity(0.2),
              child: Card(
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
          //   Shimmer.fromColors(
          //     baseColor: theme.colorScheme.inversePrimary.withOpacity(0.5),
          //     highlightColor: theme.colorScheme.inversePrimary.withOpacity(0.2),
          //     // direction: ShimmerDirection.ttb,
          //     child: Card(
          //       child: ListTile(
          //         leading: const CircleAvatar(),
          //         title: Container(
          //           width: 100,
          //           height: 20,
          //           color: Colors.white,
          //         ).paddingOnly(bottom: UIHelper.lowSize),
          //         subtitle: Container(
          //           width: 50,
          //           height: 15,
          //           color: Colors.white,
          //           child: Text(
          //             "subtitle",
          //             style: theme.textTheme.titleSmall,
          //           ),
          //         ),
          //       ),
          //     ),
          //   ),
          // ],
        ),
      );

  double get containerWidth {
    while (true) {
      final double widthOfContainer = Random().nextDouble() * (width * 0.5);
      if (widthOfContainer > 100) {
        return widthOfContainer;
      }
    }
  }
}
