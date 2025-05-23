import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/constants/extensions/iterable_extensions.dart";

import "../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/base/view/genel_pdf/view/genel_pdf_view.dart";
import "../../../../../../core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "../../../../../../core/components/badge/colorful_badge.dart";
import "../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../core/components/floating_action_button/custom_floating_action_button.dart";
import "../../../../../../core/components/layout/custom_layout_builder.dart";
import "../../../../../../core/components/shimmer/list_view_shimmer.dart";
import "../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/color_palette.dart";
import "../../../../../../core/constants/enum/badge_color_enum.dart";
import "../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../core/constants/enum/edit_tipi_enum.dart";
import "../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../core/constants/extensions/list_extensions.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../../../../model/param_model.dart";
import "../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../model/olcum_belge_edit_model.dart";
import "../model/olcum_pdf_model.dart";
import "view_model/olcum_belge_edit_view_model.dart";

final class OlcumBelgeEditView extends StatefulWidget {
  const OlcumBelgeEditView({required this.model, super.key});
  final OlcumBelgeModel model;

  @override
  State<OlcumBelgeEditView> createState() => _OlcumBelgeEditViewState();
}

final class _OlcumBelgeEditViewState extends BaseState<OlcumBelgeEditView> {
  final OlcumBelgeEditViewModel viewModel = OlcumBelgeEditViewModel();
  late final TextEditingController girisDepoController;
  late final TextEditingController kabulGirisDepoController;
  late final TextEditingController retGirisDepoController;
  late final TextEditingController cikisDepoController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    viewModel
      ..setGirisDepo(yetkiController.transferLokalDatGirisDepo)
      ..setCikisDepo(yetkiController.transferLokalDatCikisDepo);
    girisDepoController = TextEditingController(text: yetkiController.transferLokalDatGirisDepo?.depoTanimi);
    kabulGirisDepoController = TextEditingController();
    retGirisDepoController = TextEditingController();
    cikisDepoController = TextEditingController(text: yetkiController.transferLokalDatCikisDepo?.depoTanimi);
    viewModel.setRequestModel(widget.model);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getData();
    });
    super.initState();
  }

  @override
  void dispose() {
    girisDepoController.dispose();
    kabulGirisDepoController.dispose();
    retGirisDepoController.dispose();
    cikisDepoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
    appBar: appBar(),
    floatingActionButton: Observer(
      builder: (_) =>
          viewModel.belgeModel != null && yetkiController.sigmaOlcumKaydet ? fab() : const SizedBox.shrink(),
    ),
    body: body(),
  );

  AppBar appBar() => AppBar(
    title: AppBarTitle(title: "Ölçüm Detayı", subtitle: widget.model.belgeNo),
    actions: [
      IconButton(
        onPressed: () async {
          if (viewModel.model?.belge?.firstOrNull?.stokKodu != null) {
            bottomSheetDialogManager.showBottomSheetDialog(
              context,
              title: widget.model.belgeNo ?? "",
              children: [
                if (viewModel.model?.belge?.firstOrNull?.teknikResimVarmi == "E" && yetkiController.sigmaTeknikResim)
                  BottomSheetModel(
                    title: "Teknik Resimleri Görüntüle",
                    iconWidget: Icons.picture_as_pdf_outlined,
                    onTap: () async {
                      Get.back();
                      final result = await networkManager.dioPost(
                        path: ApiUrls.getBelgeler,
                        bodyModel: OlcumPdfModel(),
                        showLoading: true,
                        data: viewModel.model?.belge?.firstOrNull?.forTeknikResim,
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
                  ),
                if ((viewModel.model?.belge?.firstOrNull?.kontrolPlaniVarMi ?? false) &&
                    yetkiController.sigmaKontrolPlani)
                  BottomSheetModel(
                    title: "Kontrol Planlarını Görüntüle",
                    iconWidget: Icons.picture_as_pdf_outlined,
                    onTap: () async {
                      Get.back();
                      final result = await networkManager.dioPost(
                        path: ApiUrls.getBelgeler,
                        bodyModel: OlcumPdfModel(),
                        showLoading: true,
                        data: viewModel.model?.belge?.firstOrNull?.forKontrolPlani,
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
                  ),
                if (yetkiController.stokListesi)
                  BottomSheetModel(
                    title: "Stok İşlemleri",
                    iconWidget: Icons.list_alt_outlined,
                    onTap: () async {
                      Get.back();
                      dialogManager.showStokGridViewDialog(
                        await networkManager.getStokModel(
                          StokRehberiRequestModel(stokKodu: viewModel.model?.belge?.firstOrNull?.stokKodu),
                        ),
                      );
                    },
                  ),
                if (yetkiController.transferDatEkle)
                  BottomSheetModel(
                    title: "Depo Transferi Yap",
                    iconWidget: Icons.add_outlined,
                    onTap: depoTransferiEkleOnTap,
                  ),
                if (((viewModel.belgeModel?.datAdedi ?? 0) > 0) && yetkiController.transferDatGoruntule)
                  BottomSheetModel(
                    title: "Depo Transferlerini Görüntüle",
                    iconWidget: Icons.transform_outlined,
                    onTap: () async {
                      Get.back();
                      final bool result = await viewModel.getOlcumDatListesi();
                      if (result) {
                        final selectedItem = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                          context,
                          title: "Depo Transferi Listesi",
                          groupValue: "",
                          children: List.generate(viewModel.olcumDatListesi?.length ?? 0, (index) {
                            final item = viewModel.olcumDatListesi![index];
                            return BottomSheetModel(
                              title: item.belgeNo ?? "",
                              description: item.cariKodu,
                              groupValue: item.belgeNo,
                              value: item,
                            );
                          }),
                        );
                        if (selectedItem is OlcumBelgeModel) {
                          await Get.toNamed(
                            "/mainPage/transferEdit",
                            arguments: BaseEditModel<BaseSiparisEditModel>(
                              baseEditEnum: BaseEditEnum.goruntule,
                              editTipiEnum: EditTipiEnum.olcumdenDepoTransferi,
                              model: BaseSiparisEditModel.fromOlcumBelgeModel(selectedItem),
                            ),
                          );
                        }
                      }
                    },
                  ),
              ],
            );
          }
        },
        icon: const Icon(Icons.more_vert_outlined),
      ),
    ],
  );

  Future<void> depoTransferiEkleOnTap() async {
    Get.back();
    if (viewModel.model?.olcumler.ext.isNullOrEmpty == true) {
      dialogManager.showAlertDialog("Ölçüm giriniz.");
      return;
    }
    if (viewModel.belgeModel?.seriSorulsunmu == "E" &&
        yetkiController.seriUygulamasiAcikMi &&
        (viewModel.model?.karisikMi == false)) {
      final depoValidation = await bottomSheetDialogManager.showBottomSheetDialog(
        context,
        title: "Depo Giriniz",
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                labelText: "Giriş Depo Kodu",
                controller: girisDepoController,
                readOnly: true,
                isMust: true,
                suffixMore: true,
                valueWidget: Observer(
                  builder: (_) => Text(viewModel.seriRequestModel.girisDepo.toStringIfNotNull ?? ""),
                ),
                onTap: girisDepoOnTap,
              ),
              CustomTextField(
                labelText: "Çıkış Depo Kodu",
                controller: cikisDepoController,
                readOnly: true,
                isMust: true,
                suffixMore: true,
                valueWidget: Observer(
                  builder: (_) => Text(viewModel.seriRequestModel.cikisDepo.toStringIfNotNull ?? ""),
                ),
                onTap: cikisDepoOnTap,
              ),
              ElevatedButton(
                onPressed: seriDepoApplyButtonOnTap,
                child: Text(loc.generalStrings.apply),
              ).paddingAll(UIHelper.lowSize),
            ],
          ).paddingAll(UIHelper.lowSize),
        ),
      );
      if (!viewModel.depolarValidation || depoValidation != true) return;
    } else if (viewModel.model?.karisikMi == true) {
      final cikisDepoValidation = await bottomSheetDialogManager.showBottomSheetDialog(
        context,
        title: "Çıkış Depo Seçiniz",
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                labelText: "Kabul Giriş Depo Kodu",
                controller: kabulGirisDepoController,
                readOnly: true,
                isMust: true,
                suffixMore: true,
                valueWidget: Observer(
                  builder: (_) => Text(viewModel.seriRequestModel.kabulGirisDepo.toStringIfNotNull ?? ""),
                ),
                onTap: () async => await girisDepoOnTap(kabulMu: true),
              ),
              CustomTextField(
                labelText: "Ret Depo Kodu",
                controller: retGirisDepoController,
                readOnly: true,
                isMust: true,
                suffixMore: true,
                valueWidget: Observer(
                  builder: (_) => Text(viewModel.seriRequestModel.redGirisDepo.toStringIfNotNull ?? ""),
                ),
                onTap: () async => await girisDepoOnTap(kabulMu: false),
              ),
              CustomTextField(
                labelText: "Çıkış Depo",
                controller: cikisDepoController,
                readOnly: true,
                isMust: true,
                suffixMore: true,
                valueWidget: Observer(
                  builder: (_) => Text(viewModel.seriRequestModel.cikisDepo.toStringIfNotNull ?? ""),
                ),
                onTap: cikisDepoOnTap,
              ),
              ElevatedButton(
                onPressed: seriDepoApplyButtonOnTap,
                child: Text(loc.generalStrings.apply),
              ).paddingAll(UIHelper.lowSize),
            ],
          ),
        ),
      );

      if (!viewModel.depolarValidation || cikisDepoValidation != true) return;
    }
    final List<KalemModel> kalemListesi = [];
    if (viewModel.model?.karisikMi == false) {
      kalemListesi.add(
        KalemModel.fromOlcumBelgeModel(viewModel.model?.belge?.firstOrNull)
          ..seriList = viewModel.olcumDatResponseListesi
          ..sira = 1
          ..seriCikislardaAcik = viewModel.seriRequestModel.girisDepo != null,
      );
    } else {
      kalemListesi
        ..add(
          KalemModel.fromOlcumBelgeModel(viewModel.model?.belge?.firstOrNull)
            // ..seriList = viewModel.olcumDatResponseListesi?.where((element) => element.gckod == "G").toList()
            ..hedefDepo = viewModel.seriRequestModel.kabulGirisDepo
            ..sira = 1
            ..kabulMu = true
            ..miktar = viewModel.model?.olcumler?.where((element) => !element.retMi).length.toDouble() ?? 0.0
            ..seriList = viewModel.olcumDatResponseListesi
                ?.where(
                  (element) =>
                      viewModel.model?.olcumler
                          ?.where((element2) => !element2.retMi)
                          .map((e) => e.seriNo)
                          .contains(element.seriNo) ??
                      false,
                )
                .toList()
            ..seriCikislardaAcik = viewModel.seriRequestModel.kabulGirisDepo != null,
        )
        ..add(
          KalemModel.fromOlcumBelgeModel(viewModel.model?.belge?.firstOrNull)
            // ..seriList = viewModel.olcumDatResponseListesi?.where((element) => element.gckod == "C").toList()
            ..hedefDepo = viewModel.seriRequestModel.redGirisDepo
            ..sira = 2
            ..miktar = viewModel.model?.olcumler?.where((element) => element.retMi).length.toDouble() ?? 0.0
            ..kabulMu = false
            ..seriList = viewModel.olcumDatResponseListesi
                ?.where(
                  (element) =>
                      viewModel.model?.olcumler
                          ?.where((element2) => element2.retMi)
                          .map((e) => e.seriNo)
                          .contains(element.seriNo) ??
                      false,
                )
                .toList()
                .toList()
            ..seriCikislardaAcik = viewModel.seriRequestModel.redGirisDepo != null,
        );
    }

    await Get.toNamed(
      "/mainPage/transferEdit",
      arguments: BaseEditModel<BaseSiparisEditModel>(
        baseEditEnum: BaseEditEnum.ekle,
        editTipiEnum: EditTipiEnum.olcumdenDepoTransferi,
        model: BaseSiparisEditModel(
          girisDepoKodu: viewModel.seriRequestModel.girisDepo,
          cikisDepoKodu: viewModel.seriRequestModel.cikisDepo,
          topluGirisDepoTanimi: girisDepoController.text,
          topluCikisDepoTanimi: cikisDepoController.text,
          kalemList: kalemListesi.map((e) => e..miktar = e.seriList?.map((e) => e.miktar).sum).toList(),
          olcumBelgeRefKey:
              "${viewModel.model?.belge?.firstOrNull?.belgeTipi}.${viewModel.model?.belge?.firstOrNull?.belgeNo}.${viewModel.model?.belge?.firstOrNull?.sira}",
        ),
      ),
    );
  }

  Future<void> girisDepoOnTap({bool? kabulMu}) async {
    int? depoKodu;
    if (kabulMu == true) {
      depoKodu = viewModel.seriRequestModel.kabulGirisDepo;
    } else if (kabulMu == false) {
      depoKodu = viewModel.seriRequestModel.redGirisDepo;
    } else {
      depoKodu = viewModel.seriRequestModel.girisDepo;
    }
    final result = await bottomSheetDialogManager.showDepoBottomSheetDialog(context, depoKodu);
    if (result is DepoList) {
      if (result.depoKodu != null) {
        if (kabulMu == true) {
          viewModel
            ..setKabulGirisDepo(result)
            ..setGirisDepo(result);
          girisDepoController.text = result.depoTanimi ?? "";
          kabulGirisDepoController.text = result.depoTanimi ?? "";
        } else if (kabulMu == false) {
          viewModel.setRedGirisDepo(result);
          retGirisDepoController.text = result.depoTanimi ?? "";
        } else {
          girisDepoController.text = result.depoTanimi ?? "";
          viewModel.setGirisDepo(result);
        }
      }
    }
  }

  Future<void> cikisDepoOnTap() async {
    final result = await bottomSheetDialogManager.showDepoBottomSheetDialog(
      context,
      viewModel.seriRequestModel.cikisDepo,
    );
    if (result is DepoList) {
      if (result.depoKodu != null) {
        cikisDepoController.text = result.depoTanimi ?? "";
        viewModel.setCikisDepo(result);
      }
    }
  }

  Future<void> seriDepoApplyButtonOnTap() async {
    if (_formKey.currentState?.validate() == false) return;
    if (!viewModel.depolarValidation) return dialogManager.showAlertDialog("Depolar aynı olamaz.");
    viewModel.setSeriListe(viewModel.model?.olcumler?.map((e) => e.seriNo).toList().nullCheckWithGeneric ?? []);
    await viewModel.getDatMiktar();
    if (viewModel.olcumDatResponseListesi.ext.isNullOrEmpty) {
      await dialogManager.showAlertDialog("Seri numaraları bulunamadı.");
      return;
    }
    Get.back(result: true);
  }

  Future<void> karisikDepoButtonOnTap(bool kabulMu) async {
    if (_formKey.currentState?.validate() == false) return;
    Get.back(result: true);
    girisDepoController.clear();
  }

  Observer fab() => Observer(
    builder: (_) => CustomFloatingActionButton(
      isScrolledDown: true,
      onPressed: () async {
        if (viewModel.model?.prosesler.ext.isNullOrEmpty == true) {
          return dialogManager.showAlertDialog("Proses bulunmamaktadır.");
        }
        final result = await Get.toNamed(
          "/mainPage/olcumEkle",
          arguments: viewModel.model?.copyWith(
            yapkod: widget.model.yapkod,
            opkodu: widget.model.opkodu,
            belge: [viewModel.model!.olcumModel!.copyWith(belgeSira: widget.model.sira)],
          ),
        );
        if (result != null) {
          await viewModel.getData();
        }
      },
    ),
  );

  Observer body() => Observer(
    builder: (_) {
      if (viewModel.model == null) {
        return const Center(child: CircularProgressIndicator.adaptive());
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (viewModel.belgeModel?.stokAdi != null) Text("${viewModel.belgeModel?.stokAdi}"),
                  if (viewModel.belgeModel?.datAdedi != null)
                    ColorfulBadge(
                      label: Text("DAT Kaydı (${viewModel.belgeModel?.datAdedi})"),
                      badgeColorEnum: BadgeColorEnum.cari,
                    ),
                ],
              ),
              subtitle: CustomLayoutBuilder(
                splitCount: 2,
                children: [
                  if (viewModel.belgeModel?.belgeTipi != null) Text("Belge Tipi: ${viewModel.belgeModel?.belgeTipi}"),
                  if (viewModel.belgeModel?.stokKodu != null) Text("Stok Kodu: ${viewModel.belgeModel?.stokKodu}"),
                  if (viewModel.belgeModel?.tarih != null) Text("Tarih: ${viewModel.belgeModel?.tarih.toDateString}"),
                  if (viewModel.belgeModel?.miktar != null)
                    Text("Miktar: ${viewModel.belgeModel?.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)}"),
                ],
              ),
            ),
          ),
          if (viewModel.model?.olcumler.ext.isNotNullOrEmpty ?? false)
            const Text("Ölçümler").paddingAll(UIHelper.lowSize),
          Expanded(
            flex: 7,
            child: RefreshIndicator.adaptive(
              onRefresh: () async {
                viewModel.getOlcumler();
              },
              child: Observer(
                builder: (_) => viewModel.model?.olcumler?.isEmptyOrNull == true
                    ? viewModel.model?.olcumler != null
                          ? const Center(child: Text("Ölçüm kaydı bulunamadı"))
                          : const ListViewShimmer()
                    : ListView.builder(
                        itemCount: viewModel.model?.olcumler?.length ?? 0,
                        itemBuilder: (context, index) {
                          final item = viewModel.model?.olcumler?[index];
                          final String title = "Ölçüm ${index + 1}";
                          return Card(
                            color: (widget.model.seriNo == item?.seriNo) && widget.model.seriNo != null
                                ? ColorPalette.mantisWithOpacity
                                : null,
                            child: viewModel.model?.olcumler.ext.isNotNullOrEmpty ?? false
                                ? ListTile(
                                    onTap: () async {
                                      bottomSheetDialogManager.showBottomSheetDialog(
                                        context,
                                        title: title,
                                        children: [
                                          if (yetkiController.sigmaOlcumGirisi)
                                            BottomSheetModel(
                                              title: loc.generalStrings.view,
                                              iconWidget: Icons.preview_outlined,
                                              onTap: () async {
                                                Get.back();
                                                final newModel = await viewModel.getProsesler(item?.id);
                                                if (!newModel.isEmptyOrNull) {
                                                  Get.toNamed(
                                                    "/mainPage/olcumGoruntule",
                                                    arguments: viewModel.model?.copyWith(
                                                      prosesler: newModel,
                                                      yapkod: widget.model.yapkod,
                                                      opkodu: widget.model.opkodu,
                                                      kayitOperator: item?.kayitOperator,
                                                      kayitOperatorKodu: item?.kayitOperatorKodu,
                                                      seriNo: item?.seriNo,
                                                    ),
                                                  );
                                                }
                                              },
                                            ),
                                          if (yetkiController.sigmaOlcumDuzelt)
                                            BottomSheetModel(
                                              title: loc.generalStrings.edit,
                                              iconWidget: Icons.edit_outlined,
                                              onTap: () async {
                                                Get.back();
                                                final newModel = await viewModel.getProsesler(item?.id);
                                                if (!newModel.isEmptyOrNull) {
                                                  final result = await Get.toNamed(
                                                    "/mainPage/olcumDuzenle",
                                                    arguments: viewModel.model?.copyWith(
                                                      prosesler: newModel,
                                                      yapkod: widget.model.yapkod,
                                                      opkodu: widget.model.opkodu,
                                                      kayitOperator: item?.kayitOperator,
                                                      kayitOperatorKodu: item?.kayitOperatorKodu,
                                                      seriNo: item?.seriNo,
                                                      olcumler: [if (item != null) item],
                                                    ),
                                                  );
                                                  if (result != null) {
                                                    await viewModel.getData();
                                                  }
                                                }
                                              },
                                            ),
                                          if (yetkiController.sigmaOlcumGirSil)
                                            BottomSheetModel(
                                              title: loc.generalStrings.delete,
                                              iconWidget: Icons.delete_outline_outlined,
                                              onTap: () async {
                                                Get.back();
                                                dialogManager.showAreYouSureDialog(
                                                  onYes: () async {
                                                    final result = await viewModel.deleteOlcum(item?.id);
                                                    if (result.isSuccess) {
                                                      dialogManager.showSuccessSnackBar(
                                                        result.message ?? loc.generalStrings.success,
                                                      );
                                                      await viewModel.getData();
                                                    }
                                                  },
                                                );
                                              },
                                            ),
                                        ],
                                      );
                                    },
                                    title: Row(
                                      children: [
                                        Expanded(child: Text(title)),
                                        if (item?.tamamlandi == "H")
                                          const ColorfulBadge(
                                            label: Text("Devam ediyor"),
                                            badgeColorEnum: BadgeColorEnum.uyari,
                                          )
                                        else
                                          Row(
                                            children: [
                                              if ((item?.retAdet ?? 0) <= 0 && (item?.sartliAdet ?? 0) <= 0)
                                                const ColorfulBadge(
                                                  label: Text("Kabul"),
                                                  badgeColorEnum: BadgeColorEnum.basarili,
                                                ),
                                              if ((item?.retAdet ?? 0) <= 0 && (item?.sartliAdet ?? 0) > 0)
                                                const ColorfulBadge(
                                                  label: Text("Şartlı Kabul"),
                                                  badgeColorEnum: BadgeColorEnum.uyari,
                                                ),
                                              if ((item?.retAdet ?? 0) > 0)
                                                const ColorfulBadge(
                                                  label: Text("Ret"),
                                                  badgeColorEnum: BadgeColorEnum.hata,
                                                ),
                                            ],
                                          ),
                                      ],
                                    ),
                                    subtitle: CustomLayoutBuilder(
                                      splitCount: 2,
                                      children: [
                                        if (item?.kayityapankul != null) Text("Kaydeden: ${item?.kayityapankul}"),
                                        if (item?.seriNo != null) Text("Seri No: ${item?.seriNo}"),
                                        if (item?.kayittarihi != null)
                                          Text("Kayıt Tarihi: ${item?.kayittarihi?.toDateString}"),
                                        if (item?.kayitOperator != null) Text("Operatör: ${item?.kayitOperator}"),
                                      ],
                                    ),
                                  )
                                : const SizedBox.shrink(),
                          );
                        },
                      ),
              ),
            ),
          ),
        ],
      ).paddingAll(UIHelper.lowSize);
    },
  );

  Future<void> showDatBottomSheetDialog(BuildContext context) async {
    await bottomSheetDialogManager.showRadioBottomSheetDialog(context, title: "DAT Listesi", groupValue: null);
  }
}
