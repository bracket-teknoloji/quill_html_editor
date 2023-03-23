import 'package:flutter/material.dart';
import 'package:picker/core/constants/enum/dio_enum.dart';
import 'package:picker/core/init/network/login/api_urls.dart';
import 'package:picker/view/auth/model/companies.dart';

import '../../base/state/base_state.dart';
import '../../constants/ui_helper/radius_ui_helper.dart';

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
        dialogManager.hideAlertDialog;
        final response = await networkManager.dioResponse<Companies>(
          path: ApiUrls.veriTabanlari,
          bodyModel: Companies(),
          method: HttpTypes.GET,
        );
        dialogManager.showAlertDialog("${response.data![0].toJson()}");
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
