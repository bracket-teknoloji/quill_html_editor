import 'package:flutter/material.dart';

import '../../../view/main_page/view/grid_items.dart';
import '../../base/state/base_state.dart';
import '../../constants/ui_helper/radius_ui_helper.dart';

class CustomGridTile extends StatefulWidget {
  final String? name;
  final String? title;
  final String? icon;
  final Color? color;
  final List<GridItems>? altMenuler;
  final Function()? onTap;

  const CustomGridTile({super.key, this.name, this.title, this.icon, this.color, this.onTap, this.altMenuler});

  @override
  CustomGridTileState createState() => CustomGridTileState();
}

class CustomGridTileState extends BaseState<CustomGridTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadiusHelper.radiusAllMid,
      splashColor: Colors.amber,
      onTap: widget.onTap,
      child: Card(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadiusHelper.radiusAllSmall),
        color: widget.color,
        child: GridTile(
            header: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Spacer(
                  flex: 4,
                ),
                Flexible(flex: 2, child: Text(widget.title ?? "")),
              ],
            ),
            child: const Icon(Icons.sentiment_very_satisfied, size: 50)),
      ),
    );
  }
}
