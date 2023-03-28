import 'package:flutter/material.dart';

import '../../../view/auth/model/companies.dart';
import '../../base/state/base_state.dart';
import '../../constants/enum/dio_enum.dart';
import '../../constants/ui_helper/radius_ui_helper.dart';
import '../../init/network/login/api_urls.dart';

class CustomGridTile extends StatefulWidget {
  final Color? color;
  final Column child;
  final String name;
  final Widget? footer;
  final Widget? header;
  const CustomGridTile(
      {super.key,
      required this.child,
      this.header,
      this.footer,
      this.color,
      required this.name});

  @override
  State<CustomGridTile> createState() => CustomGridTileState();
}

class CustomGridTileState extends BaseState<CustomGridTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadiusHelper.radiusAllMid,
      splashColor: Colors.amber,
      onTap: () async {
        dialogManager.showLoadingDialog();
        final response = await networkManager.dioGet<Company>(
          path: ApiUrls.veriTabanlari,
          bodyModel: Company(),
        );

        dialogManager.hideAlertDialog;
        dialogManager.showAlertDialog(response.toString());
      },
      child: Card(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadiusHelper.radiusAllSmall),
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
