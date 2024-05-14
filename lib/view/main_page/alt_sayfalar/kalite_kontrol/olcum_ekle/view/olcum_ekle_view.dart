import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/genel_pdf/view/genel_pdf_view.dart";
import "package:picker/core/components/badge/colorful_badge.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";
import "package:picker/core/constants/extensions/model_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/core/init/network/login/api_urls.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_belge_edit/model/olcum_belge_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/kalite_kontrol/olcum_belge_edit/model/olcum_pdf_model.dart";
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
  Widget build(BuildContext context) => Scaffold(
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
                        final result = await networkManager.dioGet(
                          path: ApiUrls.getBelgeler,
                          bodyModel: OlcumPdfModel(),
                          showLoading: true,
                          data: widget.model.belge?.firstOrNull?.forTeknikResim,
                        );
                        if (result.success == true) {
                          OlcumPdfModel? selectedItem;
                          final List<OlcumPdfModel> list = (result.data as List).map((e) => e as OlcumPdfModel).toList();
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
                            if (pdfData.data != null) {
                              Get.to(() => GenelPdfView(model: pdfData.data));
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
                        final result = await networkManager.dioGet(
                          path: ApiUrls.getBelgeler,
                          bodyModel: OlcumPdfModel(),
                          showLoading: true,
                          data: widget.model.belge?.firstOrNull?.forKontrolPlani,
                        );
                        if (result.success == true) {
                          OlcumPdfModel? selectedItem;
                          final List<OlcumPdfModel> list = (result.data as List).map((e) => e as OlcumPdfModel).toList();
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
                            if (pdfData.data != null) {
                              Get.to(() => GenelPdfView(model: pdfData.data));
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
                    if (result?.success == true) {
                      dialogManager.showSuccessSnackBar(result?.message ?? loc.generalStrings.success);
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
                    child: ListTile(
                      onTap: () async {
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
                          Text("Kriter: ${proses.kriter}").yetkiVarMi(proses.kriter != null),
                          Text("Açıklama: ${proses.kabulSarti ?? ""}").yetkiVarMi(proses.kabulSarti != null),
                          Text("Ekipman: ${proses.ekipman}").yetkiVarMi(proses.ekipman != null),
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
