import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../view/main_page/view/grid_items.dart';
import '../../base/state/base_state.dart';
import '../../constants/ui_helper/ui_helper.dart';

class CustomGridTile extends StatefulWidget {
  final String? name;
  final String? title;
  final String? icon;
  final Color? color;
  final List<GridItems>? altMenuler;
  final Function()? onTap;
  final String? menuTipi;

  const CustomGridTile({super.key, this.name, this.title, this.icon, this.color, this.onTap, this.altMenuler, this.menuTipi});

  @override
  CustomGridTileState createState() => CustomGridTileState();
}

class CustomGridTileState extends BaseState<CustomGridTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: UIHelper.highBorderRadius,
      splashFactory: InkRipple.splashFactory,
      onLongPress: () {
        Clipboard.setData(ClipboardData(text: widget.title));
        dialogManager.showSnackBar("Kopyalandı");
      },
      splashColor: Colors.amber,
      onTap: widget.onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: UIHelper.lowBorderRadius),
        color: widget.color,
        semanticContainer: true,
        child: GridTile(
            footer: widget.menuTipi != "S" ? const SizedBox() : const Icon(Icons.arrow_downward, size: 15),
            child: widget.menuTipi == "I"
                ? Center(child: Text(widget.title ?? "", textAlign: TextAlign.center))
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AnimatedContainer(duration: const Duration(milliseconds: 500), child: const Icon(Icons.factory_outlined, size: 50)),
                      Text(widget.menuTipi != "I" ? widget.title.toString() : "", textAlign: TextAlign.center)
                    ],
                  )),
      ),
    );
  }
}
