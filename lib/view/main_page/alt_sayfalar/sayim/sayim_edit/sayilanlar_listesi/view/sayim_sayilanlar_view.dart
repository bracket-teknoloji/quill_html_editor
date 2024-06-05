import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_edit/sayilanlar_listesi/view_model/sayim_sayilanlar_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_listesi/model/sayim_listesi_model.dart";

class SayimSayilanlarView extends StatefulWidget {
  final Future<void> Function(SayimFiltreModel model) onEdit;
  const SayimSayilanlarView({super.key, required this.onEdit});

  @override
  State<SayimSayilanlarView> createState() => SayimSayilanlarViewState();
}

class SayimSayilanlarViewState extends BaseState<SayimSayilanlarView> {
  final SayimSayilanlarViewModel viewModel = SayimSayilanlarViewModel();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          CustomTextField(
            labelText: "Ara",
            onChanged: viewModel.setFilterText,
          ),
          Expanded(
            child: Observer(
              builder: (_) => RefreshableListView(
                onRefresh: viewModel.getData,
                items: viewModel.sayimListesi,
                itemBuilder: (sayimModel) => Card(
                  child: ListTile(
                    onTap: () {
                      bottomSheet(sayimModel);
                    },
                    title: Row(
                      children: [
                        Text(sayimModel.kayittarihi?.toDateTimeString() ?? ""),
                        const Spacer(),
                        Text("Kayıt No ${sayimModel.id}"),
                      ],
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${sayimModel.stokAdi}"),
                        CustomLayoutBuilder(
                          splitCount: 2,
                          children: [
                            Text("Stok Kodu: ${sayimModel.stokKodu}"),
                            Text("Miktar: ${sayimModel.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                            Text("Depo: ${sayimModel.depoKodu} (${sayimModel.depoTanimi})"),
                            Text("Kullanıcı: ${sayimModel.kayityapankul}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ).paddingAll(UIHelper.lowSize);

  void bottomSheet(SayimFiltreModel model) {
    bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: model.id.toStringIfNotNull ?? "",
      children: [
        BottomSheetModel(
          title: loc.generalStrings.edit,
          iconWidget: Icons.edit_outlined,
          onTap: () async {
            Get.back();
            widget.onEdit.call(model);
          },
        ),
        BottomSheetModel(
          title: loc.generalStrings.delete,
          iconWidget: Icons.delete_outline_outlined,
          onTap: () async {
            Get.back();
            dialogManager.showAreYouSureDialog(() async {
              final result = await viewModel.deleteItem(model);
              if (result == true) {
                dialogManager.showSuccessSnackBar(loc.generalStrings.success);
                await viewModel.getData();
              }
            });
          },
        ),
        BottomSheetModel(title: loc.generalStrings.print, iconWidget: Icons.print_outlined, onTap: () {}),
        BottomSheetModel(
          title: "Stok İşlemleri",
          iconWidget: Icons.list_alt_outlined,
          onTap: () async {
            Get.back();
            dialogManager.showStokGridViewDialog(await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: model.stokKodu)));
          },
        ),
      ],
    );
  }
}
