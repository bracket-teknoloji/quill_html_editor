import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/layout/custom_layout_builder.dart";
import "../../../../../../../core/components/list_view/refreshable_list_view.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../core/constants/color_palette.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../is_emri_hammade_takibi/model/is_emri_hammadde_takibi_listesi_model.dart";
import "../view_model/is_emri_hammadde_takibi_detay_view_model.dart";

final class IsEmriHammaddeTakibiDetayView extends StatefulWidget {
  const IsEmriHammaddeTakibiDetayView({required this.model, super.key});
  final IsEmriHammaddeTakibiListesiModel model;

  @override
  State<IsEmriHammaddeTakibiDetayView> createState() => _IsEmriHammaddeTakibiDetayViewState();
}

final class _IsEmriHammaddeTakibiDetayViewState extends BaseState<IsEmriHammaddeTakibiDetayView> {
  late final IsEmriHammaddeTakibiDetayViewModel viewModel;
  late final TextEditingController controller;

  @override
  void initState() {
    controller = TextEditingController();
    viewModel = IsEmriHammaddeTakibiDetayViewModel(model: widget.model);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async => await viewModel.getData());
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
    appBar: AppBar(
      title: AppBarTitle(title: widget.model.makineKodu, subtitle: "#${widget.model.takipno.toStringIfNotNull}"),
    ),
    body: Column(
      children: [
        LayoutBuilder(
          builder:
              (context, constraints) => Observer(
                builder:
                    (_) => ToggleButtons(
                      constraints: BoxConstraints.expand(width: (constraints.maxWidth - UIHelper.midSize - 2) / 3),
                      isSelected: viewModel.valueList,
                      // isSelected: viewModel.seriHareketleriModel.gckod == "C" ? [false, true] : [true, false],
                      onPressed: (index) => viewModel.setSelectedTipi(viewModel.tipiMap.values.toList()[index]),
                      children: List.generate(
                        viewModel.tipiMap.length,
                        (index) => Text(viewModel.tipiMap.keys.toList()[index]),
                      ),
                    ),
              ),
        ).paddingSymmetric(vertical: UIHelper.lowSize),
        if (yetkiController.stokListesi)
          CustomTextField(
            labelText: "Stok Kodu",
            controller: controller,
            suffixMore: true,
            onSubmitted: (value) async => getStok(value),
            suffix: IconButton(
              icon: const Icon(Icons.qr_code_scanner_outlined),
              onPressed: () async {
                final qr = await Get.toNamed("qr");
                if (qr != null) getStok(qr);
              },
            ),
          ),
        Expanded(
          child: Observer(
            builder:
                (_) => RefreshableListView(
                  onRefresh: viewModel.getData,
                  items: viewModel.observableList,
                  itemBuilder:
                      (item) => Card(
                        color: item.referanslar.ext.isNotNullOrEmpty ? ColorPalette.mantisWithOpacity : null,
                        child: ListTile(
                          title: Text(item.referanslar?.firstOrNull?.referansStokKodu ?? item.hamKodu ?? ""),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(item.referanslar?.firstOrNull?.referansStokAdi ?? item.hamAdi ?? ""),
                              Text("Miktar: ${item.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                              CustomLayoutBuilder.divideInHalf(
                                children: [
                                  ...List.generate(
                                    item.referanslar?.where((element) => element.hammaddeNo != null).length ?? 0,
                                    (index) => Text("Hammadde No: ${item.referanslar?[index].hammaddeNo}"),
                                  ),
                                  if (item.referanslar?.any((element) => element.referansStokKodu != null) ?? false)
                                    Text(
                                      "Alternatif: ${item.referanslar?.firstOrNull?.stokKodu} | ${item.referanslar?.firstOrNull?.stokAdi}",
                                    ),
                                ],
                              ),
                            ],
                          ),
                          trailing:
                              item.referanslar.ext.isNotNullOrEmpty
                                  ? IconButton(
                                    icon: const Icon(Icons.delete_outline_outlined),
                                    onPressed: () async {
                                      dialogManager.showAreYouSureDialog(() async {
                                        final result = await viewModel.deleteItem(item);
                                        if (result) {
                                          dialogManager.showSuccessSnackBar("Silme işlemi başarılı");
                                          viewModel.getData();
                                        }
                                      });
                                    },
                                  )
                                  : null,
                        ),
                      ),
                ),
          ),
        ),
      ],
    ).paddingAll(UIHelper.lowSize),
  );

  Future<void> getStok(String value) async {
    if (controller.text.isEmpty) return;
    final result = await viewModel.setBarkod(value);
    if (result.isSuccess) {
      dialogManager.showAreYouSureDialog(() async {
        final selectedItem = await bottomSheetDialogManager.showRadioBottomSheetDialog(
          context,
          groupValue: 0,
          title: "Alternatif seçiniz",
          children: List.generate(viewModel.observableList?.length ?? 0, (index) {
            final item = viewModel.observableList?[index];
            return BottomSheetModel(title: item?.hamAdi ?? "", description: item?.hamKodu, value: item);
          }),
        );
        if (selectedItem != null) {
          dialogManager.showAreYouSureDialog(() async {
            final result = await viewModel.addItem(value, selectedItem.hamKodu ?? "");
            if (result) {
              dialogManager.showSuccessSnackBar("Silme işlemi başarılı");
              viewModel.getData();
            }
          });
        }
      }, title: result.message);
    }
  }
}
