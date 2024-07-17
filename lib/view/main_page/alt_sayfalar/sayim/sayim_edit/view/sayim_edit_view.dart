import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/genel_pdf/view/genel_pdf_view.dart";
import "package:picker/core/base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "package:picker/core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/enum/depo_fark_raporu_filtre_enum.dart";
import "package:picker/core/constants/enum/dizayn_ozel_kod_enum.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/constants/extensions/list_extensions.dart";
import "package:picker/core/constants/extensions/model_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/static_variables/singleton_models.dart";
import "package:picker/core/constants/static_variables/static_variables.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_edit/sayilanlar_listesi/view/sayim_sayilanlar_view.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_edit/sayim_girisi/view/sayim_girisi_view.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_edit/view_model/sayim_edit_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/sayim/sayim_listesi/model/sayim_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

class SayimEditView extends StatefulWidget {
  final SayimListesiModel model;
  const SayimEditView({super.key, required this.model});

  @override
  State<SayimEditView> createState() => _SayimEditViewState();
}

class _SayimEditViewState extends BaseState<SayimEditView> with TickerProviderStateMixin {
  late final TabController controller;
  SayimListesiModel get model => widget.model;
  final SayimEditViewModel viewModel = SayimEditViewModel();

  @override
  void initState() {
    SingletonModels.setSayimListesi = model;
    SingletonModels.setFiltreModel = model.filtre?.copyWith(belgeNo: model.fisno, islemKodu: 1);
    controller = TabController(length: 2, vsync: this);
    controller.addListener(() {
      viewModel.setTabIndex(controller.index);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "Sayım",
            subtitle: "Depo: ${widget.model.depoKodu}",
          ),
          actions: [
            IconButton(
              onPressed: () {
                bottomSheetDialogManager.showBottomSheetDialog(
                  context,
                  title: loc.generalStrings.options,
                  children: [
                    BottomSheetModel(
                      title: "Sayım Raporu (PDF)",
                      iconWidget: Icons.filter_9_outlined,
                      onTap: () async {
                        Get.back();
                        final PdfModel pdfModel = PdfModel(
                          etiketSayisi: 1,
                          raporOzelKod: DizaynOzelKodEnum.sayim.ozelKodAdi,
                          dicParams: DicParams(
                            belgeNo: widget.model.fisno,
                          ),
                        );
                        final sayimFiltre = await bottomSheetDialogManager.showSayimFiltresiBottomSheetDialog(
                          context,
                          "",
                        );
                        if (sayimFiltre == null) return;
                        pdfModel.dicParams?.filtre = DepoFarkRaporuFiltreEnum.values.indexWhere((element) => element.filtreAdi == sayimFiltre.filtreAdi).toStringIfNotNull;
                        // final result = await bottomSheetDialogManager.showDizaynBottomSheetDialog(context, groupValue);
                        final dizayn = await bottomSheetDialogManager.showDizaynBottomSheetDialog(
                          context,
                          "",
                          ozelKod: DizaynOzelKodEnum.sayim,
                        );
                        if (dizayn == null) return;
                        pdfModel.dizaynId = dizayn.id;
                        final result = await networkManager.getPDF(pdfModel);
                        if (result.success case (null || false)) return;
                        Get.to(() => GenelPdfView(model: (result.data as List).firstOrNull));
                        // final result = await bottomSheetDialogManager.showBottomSh
                      },
                    ).yetkiKontrol(yetkiController.sayimSayimRaporu),
                    BottomSheetModel(
                      title: "Sayımı Bitir",
                      iconWidget: Icons.stop_outlined,
                      onTap: () async {
                        dialogManager.showAreYouSureDialog(() async {
                          if (await viewModel.sayimiBitir()) {
                            Get.back(result: true);
                          }
                        });
                      },
                    ).yetkiKontrol(widget.model.baslangicTarihi != null && widget.model.bitisTarihi == null && widget.model.serbestMi),
                    BottomSheetModel(
                      title: "Depo Fark Raporu",
                      iconWidget: Icons.filter_9_outlined,
                      onTap: () async {
                        Get.back();
                        await Get.toNamed("/mainPage/sayimDepoFarkRaporu", arguments: widget.model);
                      },
                    ).yetkiKontrol(yetkiController.sayimDepoFarkRaporu && widget.model.serbestMi),
                    BottomSheetModel(
                      title: "Depo Transferi Oluştur",
                      iconWidget: Icons.transform_outlined,
                      onTap: () async {
                        Get.back();
                        final depo = await bottomSheetDialogManager.showDepoBottomSheetDialog(context, widget.model.depoKodu);
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
                    ).yetkiKontrol(yetkiController.transferDatEkle),
                  ].nullCheckWithGeneric,
                );
              },
              icon: const Icon(Icons.more_vert_outlined),
            ),
            Observer(
              builder: (_) => IconButton(
                onPressed: () async => await saveSayim(),
                icon: const Icon(Icons.save_outlined),
              ).yetkiVarMi(viewModel.indexSifirMi),
            ),
          ],
          bottom: TabBar(
            controller: controller,
            tabs: const [
              Tab(
                child: Text("Sayım Girişi"),
              ),
              Tab(
                child: Text("Sayılanlar"),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: controller,
          children: [
            Observer(
              builder: (_) => SayimGirisiView(
                onStokSelected: saveSayim,
                resetFiltreModel: resetFiltreModel,
              ),
            ),
            Observer(
              builder: (_) => SayimSayilanlarView(onEdit: onEdit),
            ),
          ],
        ),
      );

  Future<void> saveSayim() async {
    if (!StaticVariables.instance.isSayimValid) {
      dialogManager.showErrorSnackBar("Gerekli alanları doldurunuz.");
      return;
    }

    final result = await viewModel.sendData(model.depoKodu!);
    if (!result.isSuccess) return;
    dialogManager.showSuccessSnackBar(result.message ?? "Başarılı");
    if (CacheManager.getProfilParametre.sayimOtomatikEtiketYazdir) {
      SingletonModels.sayimPrintModel = SingletonModels.sayimPrintModel.copyWith(
        dicParams: SingletonModels.sayimPrintModel.dicParams?.copyWith(
          kalemId: SingletonModels.sayimListesi?.filtre?.id.toStringIfNotNull,
          stokKodu: SingletonModels.sayimListesi?.filtre?.stokKodu,
        ),
      );
      final printModel = await bottomSheetDialogManager.showPrintBottomSheetDialog(
        context,
        SingletonModels.sayimPrintModel,
        SingletonModels.sayimPrintModel.dizaynId == null,
        SingletonModels.sayimPrintModel.etiketSayisi == null,
      );
      if (printModel != null) {
        SingletonModels.sayimPrintModel = printModel;
      }
    }
    // if (CacheManager.getProfilParametre.sayimOtomatikEtiketYazdir) {
    //   await bottomSheetDialogManager.showPrintBottomSheetDialog(context, PrintModel(raporOzelKod: "raporOzelKod"), true, true);
    // }
    resetFiltreModel();
  }

  void resetFiltreModel() {
    SingletonModels.setSayimListesi = SingletonModels.sayimListesi?..filtre = widget.model.filtre?.copyWith(belgeNo: widget.model.fisno, islemKodu: 1);
    controller.animateTo(1);
  }

  Future<void> onEdit(SayimFiltreModel model) async {
    final stok = await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: model.stokKodu));
    SingletonModels.setSayimListesi = SingletonModels.sayimListesi?.copyWith(
      filtre: widget.model.filtre?.copyWith(belgeNo: widget.model.fisno, islemKodu: 1),
      stokModel: stok,
    );
    controller.animateTo(0);
  }
}
