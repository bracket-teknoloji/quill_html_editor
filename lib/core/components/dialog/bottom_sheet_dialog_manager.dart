import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';

import '../../constants/ui_helper/icon_helper.dart';
import '../../constants/ui_helper/ui_helper.dart';
import 'bottom_sheet_model.dart';

class BottomSheetDialogManager {
  static showBottomSheetDialog(BuildContext context, {required String title, Widget? body, List<BottomSheetModel>? children}) {
    return showModalBottomSheet(
        context: context,
        isDismissible: true,
        barrierColor: Colors.black.withOpacity(0.9),
        enableDrag: false,
        useSafeArea: true,
        isScrollControlled: true,
        builder: (context) {
          return Wrap(
            children: [
              ListTile(
                title: Text(title, style: context.theme.textTheme.titleMedium),
                trailing: IconButton(icon: const Icon(Icons.close), onPressed: () => Navigator.pop(context)),
                splashColor: Colors.transparent,
              ).paddingSymmetric(vertical: 10),
              const Divider(
                thickness: 2,
                endIndent: 0,
                indent: 0,
              ),
              body == null
                  ? SizedBox(
                      // if children are not fit to screen, it will be scrollable
                      height: children!.length * 50,
                      child: Column(
                        children: [
                          Expanded(
                            child: SingleChildScrollView(
                              child: Wrap(
                                children: [
                                  ...List.generate(
                                    children.length,
                                    (index) => Wrap(
                                      children: [
                                        ListTile(
                                            onTap: children[index].onTap,
                                            title: Text(children[index].title),
                                            leading: SizedBox(
                                              width: 20,
                                              height: 20,
                                              child: children[index].iconWidget != null
                                                  ? Icon(children[index].iconWidget, size: 25, color: UIHelper.primaryColor)
                                                  : IconHelper.smallIcon(children[index].icon!),
                                            )),
                                        Padding(
                                          padding: UIHelper.lowPaddingVertical,
                                          child: const Divider(),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ).paddingOnly(bottom: 10),
                            ),
                          ),
                        ],
                      ),
                    )
                  : SingleChildScrollView(child: body),
            ],
          );
        });
  }
}
