import "package:flutter_mobx/flutter_mobx.dart";
import "package:picker/app/picker_app_imports.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/floating_action_button/custom_floating_action_button.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/list_view/refreshable_list_view.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/transfer/transfer_mal_talebi_edit/alt_sayfalar/transfer_mal_talebi_kalemler/view_model/transfer_mal_talebi_kalemler_view_model.dart";

class TransferMalTalebiKalemlerView extends StatefulWidget {
  const TransferMalTalebiKalemlerView({required this.model, super.key});

  final BaseEditModel<BaseSiparisEditModel> model;

  @override
  State<TransferMalTalebiKalemlerView> createState() => _TransferMalTalebiKalemlerViewState();
}

class _TransferMalTalebiKalemlerViewState extends BaseState<TransferMalTalebiKalemlerView> {
  BaseSiparisEditModel get model => BaseSiparisEditModel.instance;
  final TransferMalTalebiKalemlerViewModel viewModel = TransferMalTalebiKalemlerViewModel();

  @override
  void initState() {
    viewModel.setKalemList(model.kalemler ?? []);
    super.initState();
  }

  @override
  Widget build(BuildContext context) =>
      BaseScaffold(body: body(), floatingActionButton: (widget.model.enable) ? fab() : null);

  CustomFloatingActionButton fab() => CustomFloatingActionButton(
    isScrolledDown: true,
    onPressed: () async {
      final result = await Get.toNamed("mainPage/depoTalepStokRehberi");
      if (result is! StokListesiModel) return;
      final kalem = await Get.toNamed(
        "mainPage/depoMalTalebiKalemEkle",
        arguments: KalemModel.fromStokListesiModel(result),
      );
      if (kalem case final KalemModel value?) {
        if (widget.model.isDuzenle) {
          viewModel.saveKalem(value);
        } else {
          viewModel.addKalem(value);
        }
      }
    },
  );

  Widget body() => Column(
    children: [
      if (widget.model.enable)
        CustomTextField(
          labelText: "Stok kodu/barkod giriniz",
          onSubmitted: (value) async {
            final result = await Get.toNamed("mainPage/depoTalepStokRehberi", arguments: value);
            if (result is! StokListesiModel) return;
            final kalem = await Get.toNamed(
              "mainPage/depoMalTalebiKalemEkle",
              arguments: KalemModel.fromStokListesiModel(result),
            );
            if (kalem case final KalemModel value?) {
              if (widget.model.isDuzenle) {
                viewModel.saveKalem(value);
              } else {
                viewModel.addKalem(value);
              }
            }
          },
          suffix: IconButton(
            onPressed: () async {
              final qr = await Get.toNamed("qr");
              if (qr case final String value?) {
                final result = await Get.toNamed("mainPage/depoTalepStokRehberi", arguments: value);
                if (result is! StokListesiModel) return;
                final kalem = await Get.toNamed(
                  "mainPage/depoMalTalebiKalemEkle",
                  arguments: KalemModel.fromStokListesiModel(result),
                );
                if (kalem case final KalemModel value?) {
                  if (widget.model.isDuzenle) {
                    viewModel.saveKalem(value);
                  } else {
                    viewModel.addKalem(value);
                  }
                }
              }
            },
            icon: const Icon(Icons.qr_code_scanner_outlined),
          ),
        ).paddingAll(UIHelper.lowSize),
      Expanded(
        child: Observer(
          builder:
              (_) => RefreshableListView(
                onRefresh: () async {},
                items: viewModel.kalemList,
                itemBuilder:
                    (item) => Card(
                      child: ListTile(
                        title: Text(item.stokAdi ?? ""),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (item.stokKodu case final value?)
                              Text(value).paddingSymmetric(vertical: UIHelper.lowSize),
                            CustomLayoutBuilder.divideInHalf(
                              children: [
                                Text(
                                  "Miktar: ${item.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)} ${item.olcuBirimiAdi ?? ""}",
                                ),
                                Text(
                                  "Tamamlanan Miktar: ${item.tamamlananMiktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}",
                                ),
                                Text(
                                  "Kalan Miktar: ${(item.kalanMiktar ?? (item.miktar ?? 0) - (item.tamamlananMiktar ?? 0)).commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}",
                                ),
                              ],
                            ),
                            if (item.aciklama case final value?)
                              Text("Açıklama: $value").paddingOnly(top: UIHelper.lowSize),
                          ],
                        ),
                        onTap: () {
                          bottomSheetDialogManager.showBottomSheetDialog(
                            context,
                            title: item.stokKodu ?? "",
                            children: [
                              if (!widget.model.isGoruntule)
                                BottomSheetModel(
                                  title: loc.generalStrings.edit,
                                  iconWidget: Icons.edit_outlined,
                                  onTap: () async {
                                    Get.back();
                                    final result = await Get.toNamed(
                                      "mainPage/depoMalTalebiKalemEkle",
                                      arguments: item,
                                    );
                                    if (result case final value?) {
                                      viewModel.updateKalem(value);
                                      dialogManager.showSuccessSnackBar("Güncelleme işlemi başarılı");
                                    }
                                  },
                                ),
                              if (!widget.model.isGoruntule)
                                BottomSheetModel(
                                  title: loc.generalStrings.delete,
                                  iconWidget: Icons.delete_outline_outlined,
                                  onTap: () {
                                    Get.back();
                                    dialogManager.showAreYouSureDialog(() async {
                                      await viewModel.removeKalem(item);
                                      dialogManager.showSuccessSnackBar("Silme işlemi başarılı");
                                    });
                                  },
                                ),
                              BottomSheetModel(
                                title: "Stok İşlemleri",
                                iconWidget: Icons.list_alt,
                                onTap: () async {
                                  Get.back();
                                  dialogManager.showStokGridViewDialog(
                                    await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: item.stokKodu)),
                                  );
                                },
                              ),
                            ],
                          );
                        },
                      ),
                    ),
              ),
        ),
      ),
    ],
  ).paddingAll(UIHelper.lowSize);
}
