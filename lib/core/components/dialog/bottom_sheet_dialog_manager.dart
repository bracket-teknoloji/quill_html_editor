import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kartal/kartal.dart';

import '../../constants/extensions/widget_extensions.dart';
import '../../constants/ui_helper/icon_helper.dart';
import '../../constants/ui_helper/ui_helper.dart';
import '../button/toggle_buttons/toggle_button.dart';
import '../textfield/custom_textfield.dart';
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
                                            leading: children[index].icon == ""
                                                ? SizedBox(
                                                    width: 20,
                                                    height: 20,
                                                    child: children[index].iconWidget != null
                                                        ? Icon(children[index].iconWidget, size: 25, color: UIHelper.primaryColor)
                                                        : IconHelper.smallIcon(children[index].icon!),
                                                  )
                                                : null),
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

  static showFilterBottomSheetDialog(BuildContext context, {Function(int)? onTap}) {
    return showBottomSheetDialog(context,
        title: "Filtrele",
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const CustomTextField(
                  text: "Bakiye Durumu",
                  children: [ToggleButton()],
                ),
                Wrap(
                  runAlignment: WrapAlignment.center,
                  alignment: WrapAlignment.center,
                  children: const [
                    CustomTextField(
                      text: "Plasiyer",
                      children: [TextField(decoration: InputDecoration(suffixIcon: Icon(Icons.more_horiz_outlined)))],
                    ),
                    CustomTextField(
                      text: "Şehir",
                      children: [TextField(decoration: InputDecoration(suffixIcon: Icon(Icons.more_horiz_outlined)))],
                    ),
                    CustomTextField(
                      text: "İlçe",
                      children: [TextField(decoration: InputDecoration(suffixIcon: Icon(Icons.more_horiz_outlined)))],
                    ),
                    CustomTextField(
                      text: "Tipi",
                      children: [TextField(decoration: InputDecoration(suffixIcon: Icon(Icons.more_horiz_outlined)))],
                    ),
                    CustomTextField(
                      text: "Kod 5",
                      children: [TextField(decoration: InputDecoration(suffixIcon: Icon(Icons.more_horiz_outlined)))],
                    ),
                  ].map((e) => e.withSizedBox.paddingAll(5)).toList(),
                ),
                ElevatedButton(
                        onPressed: () {
                          String? selectedValue = ToggleButton.selected;
                          Get.back(result: selectedValue);
                        },
                        child: const Text("Uygula"))
                    .paddingSymmetric(vertical: 10),
                const ResponsiveBox(),
              ],
            ),
          ),
        ).paddingAll(UIHelper.midSize));
  }
}

class ResponsiveBox extends StatefulWidget {
  const ResponsiveBox({super.key});

  @override
  State<ResponsiveBox> createState() => _ResponsiveBoxState();
}

class _ResponsiveBoxState extends State<ResponsiveBox> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(duration: const Duration(milliseconds: 300), height: context.isKeyBoardOpen ? context.dynamicHeight(0.3) : 0);
  }
}
