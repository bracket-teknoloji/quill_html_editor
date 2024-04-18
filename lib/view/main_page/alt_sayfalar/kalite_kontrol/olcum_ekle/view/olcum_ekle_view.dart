import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_belge_edit/model/olcum_belge_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_ekle/model/olcum_ekle_model.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_ekle/view_model/olcum_ekle_view_model.dart";

class OlcumEkleView extends StatefulWidget {
  final OlcumBelgeEditModel model;
  final BaseEditEnum baseEditEnum;
  const OlcumEkleView({super.key, required this.model, required this.baseEditEnum});

  @override
  State<OlcumEkleView> createState() => _OlcumEkleViewState();
}

class _OlcumEkleViewState extends BaseState<OlcumEkleView> {
  final OlcumEkleViewModel viewModel = OlcumEkleViewModel();
  late final TextEditingController kayitOperatorController;

  @override
  void initState() {
    viewModel.setRequestModel(OlcumEkleModel.fromOlcumBelgeEditModel(widget.model));
    kayitOperatorController = TextEditingController(text:   viewModel.requestModel.kayitOperator);
    super.initState();
  }

  @override
  void dispose() {
    kayitOperatorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "Ölçüm ${widget.baseEditEnum.getName}",
            subtitle: viewModel.requestModel.belgeTipi,
          ),
          actions: [
            IconButton(
              onPressed: () async {
                if (viewModel.requestModel.kayitOperator == null) {
                  dialogManager.showAlertDialog("Kayıt Operatörü Seçiniz");
                  return;
                }
                if (viewModel.requestModel.prosesler?.every((element) => element.sonuc != null) ?? false) {
                  final result = await viewModel.sendData(widget.baseEditEnum);
                  if (result?.success == true) {
                    dialogManager.showSuccessSnackBar(result?.message ?? loc.generalStrings.success);
                    Get.back(result: true);
                  }
                } else {
                  dialogManager.showAlertDialog("Proseslerin Sonuçları Boş Bırakılamaz");
                }
              },
              icon: const Icon(Icons.save_outlined),
            ).yetkiVarMi(widget.baseEditEnum.ekleMi || widget.baseEditEnum.duzenleMi),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: ListTile(
                title: Text("Belge No: ${viewModel.requestModel.belgeNo ?? ""}"),
                subtitle: CustomLayoutBuilder(
                  splitCount: 2,
                  children: [
                    Text("Sıra: ${widget.model.olcumModel?.sira}"),
                    Text("Belge Tipi: ${widget.model.olcumModel?.belgeTipi ?? ""}"),
                    Text("Tarih: ${widget.model.olcumModel?.tarih.toDateString}"),
                    Text("Stok Adı: ${widget.model.olcumModel?.stokAdi}"),
                    Text("Stok Kodu: ${widget.model.olcumModel?.stokKodu}"),
                    // Text(widget.model.stok ?? ""),
                  ],
                ),
              ),
            ),
            CustomTextField(
              labelText: "Kayıt Operatörü",
              readOnly: true,
              controller: kayitOperatorController,
              enabled: !widget.baseEditEnum.goruntuleMi,
              suffixMore: true,
              isMust: true,
              valueWidget: Observer(builder: (_) => Text(viewModel.requestModel.kayitOperator ?? "")),
              onTap: () async {
                final result = await bottomSheetDialogManager.showOlcumOperatorBottomSheetDialog(context, viewModel.requestModel.kayitOperator);
                if (result != null) {
                  viewModel.requestModel.kayitOperator = result.sicilno;
                  kayitOperatorController.text = result.adiSoyadi ?? "";
                }
              },
            ),
            Text("Prosesler", style: theme.textTheme.bodyLarge).paddingAll(UIHelper.lowSize),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.model.prosesler?.length ?? 0,
                itemBuilder: (context, index) {
                  final proses = widget.model.prosesler![index];
                  return Card(
                    // color: cardColor(viewModel.requestModel.prosesler?.where((element) => element.id == proses.id).firstOrNull),
                    child: ListTile(
                      onTap: () async {
                        if (!widget.baseEditEnum.goruntuleMi || (widget.baseEditEnum.goruntuleMi && proses.olculecekMi)) {
                          final result = await Get.toNamed(
                            "/mainPage/prosesEkle",
                            arguments: BaseEditModel<OlcumProsesModel>(
                              model: proses.copyWith(numuneler: viewModel.requestModel.prosesler?.where((element) => element.id == proses.id).firstOrNull),
                              baseEditEnum: widget.baseEditEnum,
                            ),
                          );
                          if (result is OlcumProsesModel) {
                            viewModel.addProsesModel(result);
                          }
                        }
                      },
                      title: Observer(
                        builder: (_) {
                          final eklenenProses = viewModel.requestModel.prosesler?.where((element) => element.id == proses.id).firstOrNull;
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(proses.proses ?? ""),
                              ColorfulBadge(
                                label: Text(eklenenProses.sonucAdi),
                                badgeColorEnum: eklenenProses.cardColor,
                              ).yetkiVarMi(eklenenProses?.sonuc != null),
                            ],
                          );
                        },
                      ),
                      subtitle: CustomLayoutBuilder(
                        splitCount: 2,
                        children: [
                          Text("Kriter: ${proses.kriter}"),
                          Text("Açıklama: ${proses.kabulSarti ?? ""}"),
                          Text("Ekipman: ${proses.ekipman}"),
                          Text("Numune Miktarı: ${proses.numuneMiktari?.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}", overflow: TextOverflow.ellipsis),
                        ],
                      ),
                      trailing: Observer(
                        builder: (_) => Icon(
                          viewModel.requestModel.prosesler?.any((element) => (element.id == proses.id) && element.sonuc != null) ?? false ? Icons.check_box_outlined : Icons.check_box_outline_blank,
                        ),
                      ).yetkiVarMi(!widget.baseEditEnum.goruntuleMi),
                    ),
                  );
                },
              ),
            ),
          ],
        ).paddingAll(UIHelper.lowSize),
      );
}
