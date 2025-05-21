import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/model/print_model.dart";
import "package:picker/core/init/dependency_injection/di_manager.dart";

import "../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/base/view/genel_pdf/view/genel_pdf_view.dart";
import "../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "../../../../../../core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../core/constants/enum/depo_fark_raporu_filtre_enum.dart";
import "../../../../../../core/constants/enum/dizayn_ozel_kod_enum.dart";
import "../../../../../../core/constants/enum/edit_tipi_enum.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/init/cache/cache_manager.dart";
import "../../../../model/param_model.dart";
import "../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../sayim_listesi/model/sayim_listesi_model.dart";
import "../sayilanlar_listesi/view/sayim_sayilanlar_view.dart";
import "../sayim_girisi/view/sayim_girisi_view.dart";
import "../view_model/sayim_edit_view_model.dart";

final class SayimEditView extends StatefulWidget {
  const SayimEditView({required this.model, super.key});
  final SayimListesiModel model;

  @override
  State<SayimEditView> createState() => _SayimEditViewState();
}

final class _SayimEditViewState extends BaseState<SayimEditView> with TickerProviderStateMixin {
  late final TabController controller;
  SayimListesiModel get model => widget.model;
  SayimEditViewModel get viewModel => DIManager.read<SayimEditViewModel>();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    DIManager.lazyRegisterer(SayimEditViewModel());
    viewModel
      ..setSayimListesiModel(model)
      ..setStokModel(model.stokModel)
      ..setFiltreModel(model.filtre?.copyWith(belgeNo: model.fisno, islemKodu: 1));
    // SingletonModels.setFiltreModel = model.filtre?.copyWith(belgeNo: model.fisno, islemKodu: 1);
    controller = TabController(length: 2, vsync: this);
    controller.addListener(() {
      viewModel.setTabIndex(controller.index);
      if (viewModel.filterText != "") {
        viewModel.filterText = "";
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    DIManager.delete<SayimEditViewModel>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
    appBar: AppBar(
      title: AppBarTitle(title: "Sayım", subtitle: "Depo: ${widget.model.depoKodu}"),
      actions: [
        IconButton(
          onPressed: () {
            bottomSheetDialogManager.showBottomSheetDialog(
              context,
              title: loc.generalStrings.options,
              children: [
                if (yetkiController.sayimSayimRaporu)
                  BottomSheetModel(
                    title: "Sayım Raporu (PDF)",
                    iconWidget: Icons.filter_9_outlined,
                    onTap: () async {
                      Get.back();
                      final PdfModel pdfModel = PdfModel(
                        etiketSayisi: 1,
                        raporOzelKod: DizaynOzelKodEnum.sayim.ozelKodAdi,
                        dicParams: DicParams(belgeNo: widget.model.fisno ?? ""),
                      );
                      final sayimFiltre = await bottomSheetDialogManager.showSayimFiltresiBottomSheetDialog(
                        context,
                        null,
                      );
                      if (sayimFiltre == null) return;
                      pdfModel.dicParams?.filtre = DepoFarkRaporuFiltreEnum.values
                          .indexWhere((element) => element.filtreAdi == sayimFiltre.filtreAdi)
                          .toStringIfNotNull;
                      // final result = await bottomSheetDialogManager.showDizaynBottomSheetDialog(context, groupValue);
                      final dizayn = await bottomSheetDialogManager.showDizaynBottomSheetDialog(
                        context,
                        "",
                        ozelKod: DizaynOzelKodEnum.sayim,
                      );
                      if (dizayn == null) return;
                      pdfModel.dizaynId = dizayn.id;
                      final result = await networkManager.getPDF(pdfModel);
                      if (!result.isSuccess) return;
                      Get.to(() => GenelPdfView(model: result.dataList.firstOrNull));
                      // final result = await bottomSheetDialogManager.showBottomSh
                    },
                  ),
                if (widget.model.baslangicTarihi != null && widget.model.bitisTarihi == null && widget.model.serbestMi)
                  BottomSheetModel(
                    title: "Sayımı Bitir",
                    iconWidget: Icons.stop_outlined,
                    onTap: () async {
                      dialogManager.showAreYouSureDialog(
                        onYes: () async {
                          if (await viewModel.sayimiBitir()) {
                            Get.back(result: true);
                          }
                        },
                      );
                    },
                  ),
                if (yetkiController.sayimDepoFarkRaporu && widget.model.serbestMi)
                  BottomSheetModel(
                    title: "Depo Fark Raporu",
                    iconWidget: Icons.filter_9_outlined,
                    onTap: () async {
                      Get.back();
                      await Get.toNamed("/mainPage/sayimDepoFarkRaporu", arguments: widget.model);
                    },
                  ),
                if (yetkiController.transferDatEkle)
                  BottomSheetModel(
                    title: "Depo Transferi Oluştur",
                    iconWidget: Icons.transform_outlined,
                    onTap: () async {
                      Get.back();
                      final depo = await bottomSheetDialogManager.showDepoBottomSheetDialog(
                        context,
                        widget.model.depoKodu,
                      );
                      if (depo is! DepoList) return;
                      final listOfKalemler = await viewModel.getKalemler(depo.depoKodu.toString());
                      if (listOfKalemler.ext.isNullOrEmpty) return;
                      Get.toNamed(
                        "/mainPage/transferEdit",
                        arguments: BaseEditModel<BaseSiparisEditModel>(
                          editTipiEnum: EditTipiEnum.olcumdenDepoTransferi,
                          baseEditEnum: BaseEditEnum.ekle,
                          model: BaseSiparisEditModel(
                            girisDepoKodu: depo.depoKodu,
                            topluGirisDepoTanimi: depo.depoTanimi,
                            cikisDepoKodu: widget.model.depoKodu,
                            topluCikisDepoTanimi: widget.model.depoTanimi,
                            hareketTuru: "B",
                            projeKodu: listOfKalemler?.firstOrNull?.projeKodu,
                            kalemList: listOfKalemler,
                            aciklama: "Sayım ${widget.model.fisno}",
                          ),
                        ),
                      );
                    },
                  ),
              ],
            );
          },
          icon: const Icon(Icons.more_vert_outlined),
        ),
        Observer(
          builder: (_) => viewModel.indexSifirMi
              ? IconButton(onPressed: () async => await saveSayim(), icon: const Icon(Icons.save_outlined))
              : const SizedBox.shrink(),
        ),
      ],
      bottom: TabBar(
        controller: controller,
        tabs: [
          const Tab(child: Text("Sayım Girişi")),
          Tab(
            child: Observer(
              builder: (_) => Text(
                "Sayılanlar ${viewModel.sayimListesi.ext.isNotNullOrEmpty ? "(${viewModel.sayimListesi!.length})" : ""}",
              ),
            ),
          ),
        ],
      ),
    ),
    body: TabBarView(
      controller: controller,
      children: [
        Observer(
          builder: (_) =>
              SayimGirisiView(onStokSelected: saveSayim, resetFiltreModel: resetFiltreModel, formKey: formKey),
        ),
        Observer(builder: (_) => SayimSayilanlarView(onEdit: onEdit)),
      ],
    ),
  );

  Future<bool> saveSayim() async {
    if (formKey.currentState?.validate() != true) {
      dialogManager.showErrorSnackBar("Gerekli alanları doldurunuz.");
      return false;
    }
    if (model.depoKodu == null) {
      dialogManager.showErrorSnackBar("Depo bilgisi eksik.");
      return false;
    }
    final result = await viewModel.sendData(model.depoKodu!);
    if (!result.isSuccess) return false;
    dialogManager.showSuccessSnackBar(result.message ?? "Başarılı");
    if (CacheManager.getProfilParametre.sayimOtomatikEtiketYazdir) {
      viewModel
        ..setPrintModel(viewModel.printModel)
        ..setPrintModel(
          viewModel.printModel.copyWith(
            dicParams: viewModel.printModel.dicParams?.copyWith(
              kalemId: viewModel.filtreModel.id.toStringIfNotNull,
              stokKodu: viewModel.filtreModel.stokKodu,
            ),
          ),
        );
      // SingletonModels.sayimPrintModel = SingletonModels.sayimPrintModel.copyWith(
      //   dicParams: SingletonModels.sayimPrintModel.dicParams?.copyWith(
      //     kalemId: SingletonModels.sayimListesi?.filtre?.id.toStringIfNotNull,
      //     stokKodu: SingletonModels.sayimListesi?.filtre?.stokKodu,
      //   ),
      // );
      final printModel = await bottomSheetDialogManager.showPrintBottomSheetDialog(
        context,
        viewModel.printModel,
        viewModel.printModel.dizaynId == null,
        viewModel.printModel.etiketSayisi == null,
      );
      if (printModel != null) {
        viewModel.setPrintModel(printModel);
        // SingletonModels.sayimPrintModel = printModel;
      }
    }
    if (CacheManager.getProfilParametre.sayimOtomatikEtiketYazdir) {
      await bottomSheetDialogManager.showPrintBottomSheetDialog(
        context,
        PrintModel(raporOzelKod: "raporOzelKod"),
        true,
        true,
      );
    }
    resetFiltreModel();
    return true;
  }

  void resetFiltreModel() {
    SayimGirisiView.onReset();
    viewModel.setFiltreModel(model.filtre?.copyWith(belgeNo: model.fisno, islemKodu: 1));
    // controller.animateTo(1);
  }

  Future<void> onEdit(SayimFiltreModel model) async {
    final stok = await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: model.stokKodu));
    viewModel
      ..setStokModel(stok)
      ..setFiltreModel(
        model.copyWith(belgeNo: model.fisno, islemKodu: 1, stokAdi: stok?.stokAdi, stokKodu: stok?.stokKodu),
      );
    controller.animateTo(0);
  }
}
