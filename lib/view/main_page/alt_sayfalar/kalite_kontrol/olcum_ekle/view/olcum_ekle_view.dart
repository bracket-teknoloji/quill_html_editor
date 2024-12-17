import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/base/view/genel_pdf/view/genel_pdf_view.dart";
import "../../../../../../core/components/badge/colorful_badge.dart";
import "../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../core/components/layout/custom_layout_builder.dart";
import "../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../core/constants/extensions/list_extensions.dart";
import "../../../../../../core/constants/extensions/model_extensions.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../../olcum_belge_edit/model/olcum_belge_edit_model.dart";
import "../../olcum_belge_edit/model/olcum_pdf_model.dart";
import "../model/olcum_ekle_model.dart";
import "../view_model/olcum_ekle_view_model.dart";

class OlcumEkleView extends StatefulWidget {
  const OlcumEkleView({super.key, required this.model, required this.baseEditEnum});
  final OlcumBelgeEditModel model;
  final BaseEditEnum baseEditEnum;

  @override
  State<OlcumEkleView> createState() => _OlcumEkleViewState();
}

class _OlcumEkleViewState extends BaseState<OlcumEkleView> {
  final OlcumEkleViewModel viewModel = OlcumEkleViewModel();
  late final TextEditingController kayitOperatorController;
  late final TextEditingController seriNumarasiController;

  @override
  void initState() {
    viewModel.setRequestModel(OlcumEkleModel.fromOlcumBelgeEditModel(widget.model));
    kayitOperatorController = TextEditingController(text: widget.model.kayitOperator);
    seriNumarasiController = TextEditingController(text: widget.model.seriNo);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (widget.model.prosesler.isEmptyOrNull) {
        dialogManager.showAlertDialog("Proses bulunmamaktadır.");
        Get.back();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    kayitOperatorController.dispose();
    seriNumarasiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "Ölçüm ${widget.baseEditEnum.getName}",
            subtitle: viewModel.requestModel.belgeTipi,
          ),
          actions: [
            IconButton(
              onPressed: () async {
                bottomSheetDialogManager.showBottomSheetDialog(
                  context,
                  title: loc.generalStrings.options,
                  children: [
                    BottomSheetModel(
                      title: "Teknik Resimleri Görüntüle",
                      iconWidget: Icons.picture_as_pdf_outlined,
                      onTap: () async {
                        Get.back();
                        final result = await networkManager.dioPost(
                          path: ApiUrls.getBelgeler,
                          bodyModel: OlcumPdfModel(),
                          showLoading: true,
                          data: widget.model.belge?.firstOrNull?.forTeknikResim,
                        );
                        if (result.isSuccess) {
                          OlcumPdfModel? selectedItem;
                          final List<OlcumPdfModel> list = result.dataList;
                          if (list.length == 1) {
                            selectedItem = list.first;
                          } else {
                            selectedItem = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                              context,
                              groupValue: null,
                              title: "Teknik Resim Seçiniz",
                              children: List.generate(list.length, (index) {
                                final OlcumPdfModel item = list[index];
                                return BottomSheetModel(title: item.revno ?? "", value: item);
                              }),
                            );
                          }
                          if (selectedItem != null) {
                            final pdfData = await networkManager.getTeknikResimPdf(selectedItem);
                            if (pdfData.isSuccess) {
                              Get.to(() => GenelPdfView(model: pdfData.dataItem));
                            }
                          }
                        }
                      },
                    ).yetkiKontrol(widget.model.belge?.firstOrNull?.teknikResimVarmi == "E" && yetkiController.sigmaTeknikResim),
                    BottomSheetModel(
                      title: "Kontrol Planlarını Görüntüle",
                      iconWidget: Icons.picture_as_pdf_outlined,
                      onTap: () async {
                        Get.back();
                        final result = await networkManager.dioPost(
                          path: ApiUrls.getBelgeler,
                          bodyModel: OlcumPdfModel(),
                          showLoading: true,
                          data: widget.model.belge?.firstOrNull?.forKontrolPlani,
                        );
                        if (result.isSuccess) {
                          OlcumPdfModel? selectedItem;
                          final List<OlcumPdfModel> list = result.dataList;
                          if (list.length == 1) {
                            selectedItem = list.first;
                          } else {
                            selectedItem = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                              context,
                              groupValue: null,
                              title: "Kontrol Planı Seçiniz",
                              children: List.generate(list.length, (index) {
                                final OlcumPdfModel item = list[index];
                                return BottomSheetModel(title: item.revno ?? "", value: item);
                              }),
                            );
                          }
                          if (selectedItem != null) {
                            final pdfData = await networkManager.getKontrolPlaniPdf(selectedItem);
                            if (pdfData.isSuccess) {
                              Get.to(() => GenelPdfView(model: pdfData.dataItem));
                            }
                          }
                        }
                      },
                    ).yetkiKontrol(widget.model.belge?.firstOrNull?.kontrolPlaniVarmi == "E" && yetkiController.sigmaKontrolPlani),
                  ].nullCheckWithGeneric,
                );
              },
              icon: const Icon(Icons.more_vert_outlined),
            ).yetkiVarMi(widget.model.olcumModel?.kontrolPlaniVarmi == "E" || widget.model.olcumModel?.teknikResimVarmi == "E"),
            IconButton(
              onPressed: () async {
                if (viewModel.requestModel.kayitOperator == null) {
                  dialogManager.showAlertDialog("Kayıt Operatörü Seçiniz.");
                  return;
                }
                if (viewModel.requestModel.seriNo == null && widget.model.olcumModel?.seriSorulsunmu == "E") {
                  dialogManager.showAlertDialog("Seri numarasını doldurunuz.");
                  return;
                }
                dialogManager.showAreYouSureDialog(() async {
                  if (widget.model.belge?.firstOrNull?.yarimOlcumYapabilirmi == "E" || (viewModel.requestModel.prosesler?.every((element) => element.sonuc != null) ?? false)) {
                    final result = await viewModel.sendData(widget.baseEditEnum);
                    if (result.isSuccess) {
                      dialogManager.showSuccessSnackBar(result.message ?? loc.generalStrings.success);
                      Get.back(result: true);
                    }
                  } else {
                    dialogManager.showAlertDialog("Proseslerin Sonuçları Boş Bırakılamaz");
                  }
                });
              },
              icon: const Icon(Icons.save_outlined),
            ).yetkiVarMi((widget.baseEditEnum.ekleMi && yetkiController.sigmaOlcumKaydet) || (widget.baseEditEnum.duzenleMi && yetkiController.sigmaOlcumDuzelt)),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: ListTile(
                title: Text("Belge No: ${viewModel.requestModel.belgeNo ?? ""}"),
                subtitle: Column(
                  children: [
                    CustomLayoutBuilder(
                      splitCount: 2,
                      children: [
                        Text("Sıra: ${widget.model.olcumModel?.belgeSira}"),
                        Text("Belge Tipi: ${widget.model.olcumModel?.belgeTipi ?? ""}"),
                        Text("Tarih: ${widget.model.olcumModel?.tarih.toDateString}"),
                        Text("Stok Adı: ${widget.model.olcumModel?.stokAdi}"),
                        Text("Stok Kodu: ${widget.model.olcumModel?.stokKodu}"),
                        // Text(widget.model.stok ?? ""),
                      ],
                    ),
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
                  viewModel.setKayitOperatoru(result.sicilno);
                  kayitOperatorController.text = result.adiSoyadi ?? "";
                }
              },
            ),
            CustomTextField(
              labelText: "Seri Numarası",
              controller: seriNumarasiController,
              enabled: !widget.baseEditEnum.goruntuleMi,
              isMust: true,
              onChanged: viewModel.setSeriNo,
            ).yetkiVarMi(widget.model.olcumModel?.seriSorulsunmu == "E" && yetkiController.seriUygulamasiAcikMi),
            Text("Prosesler", style: theme.textTheme.bodyLarge).paddingAll(UIHelper.lowSize),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.model.prosesler?.length ?? 0,
                itemBuilder: (context, index) {
                  final proses = widget.model.prosesler![index];
                  return Card(
                    // color: cardColor(viewModel.requestModel.prosesler?.where((element) => element.id == proses.id).firstOrNull),
                    child: Observer(
                      builder: (_) => ListTile(
                        onTap: () async {
                          final eklenenProses = viewModel.requestModel.prosesler?.where((element) => element.id == proses.id).firstOrNull;
                          final result = await Get.toNamed(
                            "/mainPage/prosesEkle",
                            arguments: BaseEditModel<OlcumProsesModel>(
                              model: eklenenProses?.copyWith(numuneler: viewModel.requestModel.prosesler?.where((element) => element.id == proses.id).firstOrNull),
                              baseEditEnum: widget.baseEditEnum,
                            ),
                          );
                          if (result is OlcumProsesModel) {
                            viewModel.addProsesModel(result);
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
                        subtitle: Observer(
                          builder: (_) {
                            final eklenenProses = viewModel.requestModel.prosesler?.where((element) => element.id == proses.id).firstOrNull;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomLayoutBuilder(
                                  splitCount: 2,
                                  children: [
                                    Text("Kriter: ${eklenenProses?.kriter}").yetkiVarMi(eklenenProses?.kriter != null),
                                    Text("Kabul Şartı: ${eklenenProses?.kabulSarti ?? ""}").yetkiVarMi(eklenenProses?.kabulSarti != null),
                                    Text("Ekipman: ${eklenenProses?.ekipman}").yetkiVarMi(eklenenProses?.ekipman != null),
                                    Text("Numune Miktarı: ${eklenenProses?.numuneMiktari?.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}", overflow: TextOverflow.ellipsis),
                                  ],
                                ),
                                Text("Açıklama: ${eklenenProses?.aciklama}").yetkiVarMi(eklenenProses?.aciklama != null),
                              ],
                            );
                          },
                        ),
                        trailing: Observer(
                          builder: (_) => Icon(
                            viewModel.requestModel.prosesler?.any((element) => (element.id == proses.id) && element.sonuc != null) ?? false ? Icons.check_box_outlined : Icons.check_box_outline_blank,
                          ),
                        ).yetkiVarMi(!widget.baseEditEnum.goruntuleMi),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ).paddingAll(UIHelper.lowSize),
      );
}
