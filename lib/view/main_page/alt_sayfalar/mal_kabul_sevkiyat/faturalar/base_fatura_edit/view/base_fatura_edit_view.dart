import "dart:convert";
import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:uuid/uuid.dart";

import "../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../../core/base/model/doviz_kurlari_model.dart";
import "../../../../../../../core/base/model/generic_response_model.dart";
import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/base/view/cari_rehberi/model/cari_listesi_request_model.dart";
import "../../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "../../../../../../../core/base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../../core/constants/enum/edit_tipi_enum.dart";
import "../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../core/constants/extensions/list_extensions.dart";
import "../../../../../../../core/constants/extensions/model_extensions.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../../core/constants/static_variables/static_variables.dart";
import "../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../../core/init/cache/cache_manager.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../../../../../model/param_model.dart";
import "../../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../../cari/cari_listesi/model/cari_request_model.dart";
import "../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../../siparis/siparisler/model/siparis_edit_request_model.dart";
import "../../../../siparis/siparisler/model/siparisler_request_model.dart";
import "../alt_sayfalar/base_fatura_diger/view/base_fatura_diger_view.dart";
import "../alt_sayfalar/base_fatura_genel/view/base_fatura_genel_view.dart";
import "../alt_sayfalar/base_fatura_kalemler/view/base_fatura_kalemler_view.dart";
import "../alt_sayfalar/base_fatura_toplamlar/view/base_fatura_toplamlar_view.dart";
import "../view_model/base_fatura_edit_view_model.dart";

class BaseFaturaEditView extends StatefulWidget {
  final bool? isSubTitleSmall;
  // final List<Widget>? actions;
  final BaseEditModel model;
  const BaseFaturaEditView({super.key, this.isSubTitleSmall, required this.model});

  @override
  State<BaseFaturaEditView> createState() => _BaseFaturaEditViewState();
}

class _BaseFaturaEditViewState extends BaseState<BaseFaturaEditView> with TickerProviderStateMixin {
  BaseFaturaEditViewModel viewModel = BaseFaturaEditViewModel();
  late final TabController tabController;
  late BaseEditModel<SiparisEditRequestModel> model;
  late final TextEditingController _cariKoduController;
  late final TextEditingController _siparisController;
  late final TextEditingController _kalemlerController;

  @override
  void initState() {
    viewModel.setLoading(true);
    tabController = TabController(length: widget.model.editTipiEnum?.digerSekmesiGoster ?? false ? 4 : 3, vsync: this);
    _cariKoduController = TextEditingController();
    _siparisController = TextEditingController();
    _kalemlerController = TextEditingController();
    tabController.addListener(() {
      if (tabController.indexIsChanging && tabController.previousIndex == 0) {
        final result = StaticVariables.instance.isFaturaValid;
        if (!result) {
          dialogManager.showErrorSnackBar("Lütfen gerekli alanları doldurunuz.");
          tabController.animateTo(tabController.previousIndex);
          return;
        }
      }
      if (!tabController.indexIsChanging &&
          // tabController.previousIndex == (widget.model.editTipiEnum?.digerSekmesiGoster ?? false ? 2 : 1) &&
          tabController.length - 1 == tabController.index &&
          yetkiController.seriUygulamasiAcikMi &&
          BaseSiparisEditModel.instance.kalemList?.any((element) => element.seriEksikMi) == true) {
        dialogManager.showErrorSnackBar("Kalemlerde seri eksik.");
        if (tabController.index != (widget.model.editTipiEnum?.digerSekmesiGoster ?? false ? 2 : 1)) {
          tabController.animateTo(widget.model.editTipiEnum?.digerSekmesiGoster ?? false ? 2 : 1);

          return;
        }
        // tabController.animateTo(tabController.previousIndex);
        // return;
      }
      if (!tabController.indexIsChanging && tabController.index == (widget.model.editTipiEnum?.digerSekmesiGoster ?? false ? 3 : 2) && BaseSiparisEditModel.instance.kalemList.ext.isNotNullOrEmpty) {
        viewModel.changeIsLastPage(true);
      } else {
        viewModel.changeIsLastPage(false);
      }
    });

    if (widget.model.model is BaseSiparisEditModel) {
      model = BaseEditModel<SiparisEditRequestModel>()..model = SiparisEditRequestModel.fromSiparislerModel(widget.model.model as BaseSiparisEditModel);
      model.baseEditEnum = widget.model.baseEditEnum;
      model.editTipiEnum = widget.model.editTipiEnum;
    } else if (widget.model.model is SiparisEditRequestModel) {
      model = widget.model as BaseEditModel<SiparisEditRequestModel>;
    } else {
      model = BaseEditModel<SiparisEditRequestModel>()..model = SiparisEditRequestModel();
      model.baseEditEnum = widget.model.baseEditEnum;
      model.editTipiEnum = widget.model.editTipiEnum;
    }

    if (widget.model.baseEditEnum == BaseEditEnum.duzenle || widget.model.baseEditEnum.kopyalaMi) {
      model.model?.kayitModu = "S";
    } else if (widget.model.baseEditEnum == BaseEditEnum.goruntule) {
      model.model?.kayitModu = "U";
    } else {
      model.model?.kayitModu = null;
    }
    if (model.editTipiEnum?.irsaliyeMi ?? false) {
      model.model?.siparisSevkEdilenGoster = true;
    }
    WidgetsBinding.instance.addPostFrameCallback((Duration timeStamp) async {
      if (model.model?.isNew ?? false) {
        BaseSiparisEditModel.setInstance(widget.model.model);
      } else if (widget.model.baseEditEnum == BaseEditEnum.taslak) {
        BaseSiparisEditModel.resetInstance();
        BaseSiparisEditModel.setInstance(widget.model.model);
        BaseSiparisEditModel.instance.kalemList = BaseSiparisEditModel.instance.kalemList
            ?.map(
              (e) => e
                ..kalemStoktanKodu = e.stokKodu
                ..teslimTarihi = null,
            )
            .toList();
        BaseSiparisEditModel.instance.isNew = true;
        BaseSiparisEditModel.instance.efattanAlisFat = true;
        BaseSiparisEditModel.instance.belgeTuru = widget.model.editTipiEnum?.rawValue;
        BaseSiparisEditModel.instance.pickerBelgeTuru = widget.model.editTipiEnum?.rawValue;
        BaseSiparisEditModel.instance.tarih ??= DateTime.now().dateTimeWithoutTime;
        BaseSiparisEditModel.instance.tag = "FaturaModel";
        BaseSiparisEditModel.instance.islemeBaslamaTarihi = DateTime.now();
      } else if (widget.model.baseEditEnum != BaseEditEnum.ekle) {
        final result = await networkManager.dioPost<BaseSiparisEditModel>(path: ApiUrls.getFaturaDetay, bodyModel: BaseSiparisEditModel(), data: model.model?.toJson(), showLoading: true);
        if (result.isSuccess) {
          BaseSiparisEditModel.setInstance(result.dataList.first);
          BaseSiparisEditModel.instance.tag = "FaturaModel";
          // BaseSiparisEditModel.instance.teslimTarihi = null;
          // BaseSiparisEditModel.instance.istenilenTeslimTarihi = null;
          BaseSiparisEditModel.instance.islemeBaslamaTarihi = DateTime.now();
          BaseSiparisEditModel.instance.isNew = false;
          if (widget.model.baseEditEnum == BaseEditEnum.duzenle) {
            BaseSiparisEditModel.instance.belgeTipi ??= BaseSiparisEditModel.instance.tipi ?? 2;
            BaseSiparisEditModel.instance.depoTanimi ??= parametreModel.depoList?.firstWhereOrNull((element) => element.depoKodu == BaseSiparisEditModel.instance.topluDepo)?.depoTanimi;
            if ((BaseSiparisEditModel.instance.kalemList?.any((element) => element.otvVarmi == true) ?? false) && !(BaseSiparisEditModel.instance.getEditTipiEnum?.satisMi ?? false)) {
              for (final item in BaseSiparisEditModel.instance.kalemList!) {
                item.otvHesapla();
              }
            }
          } else if (widget.model.baseEditEnum.kopyalaMi) {
            BaseSiparisEditModel.instance.belgeNo = null;
            BaseSiparisEditModel.instance.belgeTuru = widget.model.editTipiEnum?.rawValue;
            if (widget.model.model is BaseSiparisEditModel) {
              BaseSiparisEditModel.instance.kalemList = (widget.model.model as BaseSiparisEditModel).kalemList;
            } else {
              BaseSiparisEditModel.instance.kalemList = BaseSiparisEditModel.instance.kalemList
                  ?.map(
                    (e) => e
                      ..belgeTipi = BaseSiparisEditModel.instance.belgeTuru
                      ..kalan = null
                      ..kapali = null
                      ..tempBarkodList = null
                      ..hucreList = null
                      ..inckeyno = null
                      ..stokSatisKdv = null
                      ..stokAlisKdv = null
                      ..belgeNo = null,
                  )
                  .toList();
            }
            if (widget.model.baseEditEnum == BaseEditEnum.kopyala) {
              BaseSiparisEditModel.instance.tarih = model.model?.belgeTarihi.toDateTimeDDMMYYYY();
            }
            if (widget.model.baseEditEnum.kopyalaMi) {
              BaseSiparisEditModel.instance.tarih = DateTime.now().dateTimeWithoutTime;
            }
            if (widget.model.baseEditEnum == BaseEditEnum.siparistenKopyala) {
              BaseSiparisEditModel.instance.tarih = DateTime.now().dateTimeWithoutTime;
            }
            BaseSiparisEditModel.instance.belgeKodu = null;
            BaseSiparisEditModel.instance.teslimTarihi = null;
            BaseSiparisEditModel.instance.kapatilmis = null;
            BaseSiparisEditModel.instance.vadeGunu = null;
            BaseSiparisEditModel.instance.tempSipList = null;
            BaseSiparisEditModel.instance.onaylayankul = null;
            BaseSiparisEditModel.instance.onaytarihi = null;
            BaseSiparisEditModel.instance.kayittarihi = null;
            BaseSiparisEditModel.instance.vadeTarihi = null;
            BaseSiparisEditModel.instance.teslimTarihi = null;
            BaseSiparisEditModel.instance.teslimCari = null;
            BaseSiparisEditModel.instance.teslimCariAdi = null;
            BaseSiparisEditModel.instance.istenilenTeslimTarihi = null;
            BaseSiparisEditModel.instance.vadeGunu = (widget.model.model as BaseSiparisEditModel).vadeGunu;
            BaseSiparisEditModel.instance.vadeTarihi = (widget.model.model as BaseSiparisEditModel).vadeTarihi;
            BaseSiparisEditModel.instance.depoTanimi ??= parametreModel.depoList?.firstWhereOrNull((element) => element.depoKodu == BaseSiparisEditModel.instance.topluDepo)?.depoTanimi;
            final cariModel = await networkManager.getCariModel(CariRequestModel.fromBaseSiparisEditModel(BaseSiparisEditModel.instance));
            if (cariModel is CariListesiModel) {
              viewModel.setLoading(true);
              BaseSiparisEditModel.instance.efaturaTipi = cariModel.efaturaTipi;
              BaseSiparisEditModel.instance.resmiBelgeNo = null;
              BaseSiparisEditModel.instance.efaturaMi = null;
              BaseSiparisEditModel.instance.efatOzelkod = null;
              BaseSiparisEditModel.instance.efaturaGibDurumKodu = null;
              BaseSiparisEditModel.instance.earsivGibDurumKodu = null;
              BaseSiparisEditModel.instance.eirsaliyeGibDurumKodu = null;
              BaseSiparisEditModel.instance.earsivDurumAciklama = null;
              BaseSiparisEditModel.instance.eirsaliyeDurumAciklama = null;
              BaseSiparisEditModel.instance.efaturaDurumAciklama = null;
              BaseSiparisEditModel.instance.vadeGunu ??= cariModel.vadeGunu;
              BaseSiparisEditModel.instance.vadeTarihi ??= DateTime.now().add(Duration(days: cariModel.vadeGunu ?? 0)).dateTimeWithoutTime;
              BaseSiparisEditModel.instance.plasiyerAciklama = cariModel.plasiyerAciklama;
              BaseSiparisEditModel.instance.plasiyerKodu = cariModel.plasiyerKodu;
              BaseSiparisEditModel.instance.cariAdi = cariModel.cariAdi;
              BaseSiparisEditModel.instance.cariKodu = cariModel.cariKodu;
              BaseSiparisEditModel.instance.kosulKodu = cariModel.kosulKodu;
              BaseSiparisEditModel.instance.belgeTipi ??= BaseSiparisEditModel.instance.tipi;
            }
            BaseSiparisEditModel.instance.tag = "FaturaModel";
            BaseSiparisEditModel.instance.islemeBaslamaTarihi = DateTime.now();
            BaseSiparisEditModel.instance.isNew = true;
            BaseSiparisEditModel.instance.belgeNo = null;
            BaseSiparisEditModel.instance.belgeTuru = widget.model.editTipiEnum?.rawValue;
            BaseSiparisEditModel.instance.pickerBelgeTuru = widget.model.editTipiEnum?.rawValue;
          }
        } else {
          Get.back();
        }
        if (BaseSiparisEditModel.instance.dovizliMi &&
            model.model?.belgeTarihi != DateTime.now().toDateString &&
            BaseSiparisEditModel.instance.kalemList.ext.isNotNullOrEmpty &&
            !widget.model.isGoruntule) {
          dialogManager.showAreYouSureDialog(
            () async {
              await dovizGuncelle();
            },
            title: "Kalemlerdeki Fiyatlar, ${DateTime.now().toDateString} tarihli döviz kurlarına göre güncellensin mi?",
          );
        }
      } else if (widget.model.baseEditEnum == BaseEditEnum.ekle) {
        viewModel.setLoading(true);
        BaseSiparisEditModel.resetInstance();
        viewModel.setCariKodu(CariListesiModel()..cariKodu = widget.model.model?.cariKodu);
        _cariKoduController.text = widget.model.model?.cariAdi ?? "";
        //TODO parametre ekle
        if (widget.model.editTipiEnum?.siparisBaglantisiVarMi ?? false) {
          final result = await getSiparisBaglantisi();
          if (model.editTipiEnum.irsaliyeMi) {
            BaseSiparisEditModel.instance.ebelgeCheckbox = "E";
          }
          if (result != true) {
            BaseSiparisEditModel.resetInstance();
            BaseSiparisEditModel.instance.belgeTuru = widget.model.editTipiEnum?.rawValue;
            BaseSiparisEditModel.instance.pickerBelgeTuru = widget.model.editTipiEnum?.rawValue;

            BaseSiparisEditModel.instance.belgeTipi = 2;
            BaseSiparisEditModel.instance.tipi = 2;
            BaseSiparisEditModel.instance.tarih = DateTime.now().dateTimeWithoutTime;
            BaseSiparisEditModel.instance.tag = "FaturaModel";

            BaseSiparisEditModel.instance.siparisTipi = model.editTipiEnum;
            BaseSiparisEditModel.instance.isNew = true;
          } else {
            BaseSiparisEditModel.instance.belgeTipi = 2;
            BaseSiparisEditModel.instance.tipi = 2;
            BaseSiparisEditModel.instance.tarih = DateTime.now().dateTimeWithoutTime;
            BaseSiparisEditModel.instance.tag = "FaturaModel";
            BaseSiparisEditModel.instance.siparisTipi = model.editTipiEnum;
            BaseSiparisEditModel.instance.isNew = true;
            final cariModel = await getCari();

            if (cariModel is CariListesiModel) {
              viewModel.setLoading(true);
              BaseSiparisEditModel.instance.cariTitle = cariModel.efaturaCarisi == "E"
                  ? "E-Fatura"
                  : cariModel.efaturaCarisi == "H"
                      ? "E-Arşiv"
                      : null;
              BaseSiparisEditModel.instance.efaturaTipi = cariModel.efaturaTipi;
              BaseSiparisEditModel.instance.vadeGunu = cariModel.vadeGunu;
              BaseSiparisEditModel.instance.plasiyerAciklama = cariModel.plasiyerAciklama;
              BaseSiparisEditModel.instance.plasiyerKodu = cariModel.plasiyerKodu;
              BaseSiparisEditModel.instance.cariAdi = cariModel.cariAdi;
              BaseSiparisEditModel.instance.cariKodu = cariModel.cariKodu;
              BaseSiparisEditModel.instance.kosulKodu = cariModel.kosulKodu;
            }
          }
        }

        BaseSiparisEditModel.instance.ebelgeCheckbox = CacheManager.getProfilParametre.eIrsaliyeSeciliGelsin ? "E" : null;
      }

      if (BaseSiparisEditModel.instance.kalemList?.any((element) => element.olcuBirimCarpani != null) ?? false) {
        BaseSiparisEditModel.instance.kalemList = BaseSiparisEditModel.instance.kalemList?.map((element) {
          if (element.olcuBirimCarpani != null) {
            element.gercekMiktar = element.miktar;
            element.miktar = (element.miktar ?? 0) * ((element.olcuBirimCarpani == 0 || element.olcuBirimCarpani == null) ? 1 : element.olcuBirimCarpani!);
          }
          return element;
        }).toList();
      }
      BaseSiparisEditModel.instance.belgeTuru = widget.model.editTipiEnum?.rawValue;
      BaseSiparisEditModel.instance.pickerBelgeTuru = widget.model.editTipiEnum?.rawValue;
      viewModel.setLoading(false);
    });
    log("resmi belge no: ${widget.model.model?.belgeNo}");
    super.initState();
  }

  @override
  void dispose() {
    BaseSiparisEditModel.resetInstance();
    _cariKoduController.dispose();
    _siparisController.dispose();
    _kalemlerController.dispose();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => PopScope(
        canPop: widget.model.baseEditEnum == BaseEditEnum.goruntule,
        onPopInvokedWithResult: (didPop, value) async {
          if (didPop) {
            return;
          }
          await dialogManager.showAreYouSureDialog(() {
            BaseSiparisEditModel.resetInstance();
            Get.back(result: false);
          });
        },
        child: DefaultTabController(
          length: widget.model.editTipiEnum?.digerSekmesiGoster ?? false ? 4 : 3,
          child: BaseScaffold(
            appBar: AppBar(
              title: AppBarTitle(
                title: widget.model.editTipiEnum?.getName ?? "Fatura",
                subtitle: widget.model.getSubTitle ?? widget.model.model?.belgeNo,
                isSubTitleSmall: widget.isSubTitleSmall,
              ),
              actions: <Widget>[
                IconButton(
                  onPressed: () async {
                    final result = await bottomSheetDialogManager.showBottomSheetDialog(
                      context,
                      title: loc.generalStrings.options,
                      children: <BottomSheetModel?>[
                        BottomSheetModel(
                          title: "Cari İşlemleri",
                          iconWidget: Icons.person_outline_outlined,
                          onTap: () async {
                            Get.back();
                            dialogManager.showCariIslemleriGridViewDialog(await networkManager.getCariModel(CariRequestModel.fromBaseSiparisEditModel(BaseSiparisEditModel.instance)));
                          },
                        ),
                        BottomSheetModel(
                          title: "Kalemleri KDV'ye Göre Birleştir",
                          iconWidget: Icons.person_outline_outlined,
                          onTap: () async {
                            Get.back();
                            final List<KalemModel> newList = [];
                            if (BaseSiparisEditModel.instance.kalemList.ext.isNotNullOrEmpty) {
                              for (final KalemModel item in BaseSiparisEditModel.instance.kalemList ?? []) {
                                if (newList.any((element) => element.kdvOrani == item.kdvOrani)) {
                                  final int index = newList.indexWhere((element) => element.kdvOrani == item.kdvOrani);
                                  newList[index] = newList[index]
                                    // ..miktar = (newList[index].miktar ?? 0) + (item.miktar ?? 0)
                                    ..dovizFiyati = (newList[index].dovizFiyati ?? 0) + (item.dovizFiyati ?? 0)
                                    ..brutFiyat = (newList[index].brutFiyat ?? 0) + ((item.brutFiyat ?? 0) * (item.miktar ?? 0));
                                } else {
                                  newList.add(
                                    item
                                      ..brutFiyat = (item.brutFiyat ?? 0) * (item.miktar ?? 0)
                                      ..miktar = 1,
                                  );
                                }
                              }
                              BaseSiparisEditModel.instance.kalemList = newList;
                              if (tabController.index == 2) {
                                tabController.animateTo(3);
                                await Future.delayed(const Duration(milliseconds: 500));
                                tabController.animateTo(2);
                              }
                              // setState(() {});
                            }
                          },
                        ).yetkiKontrol(BaseSiparisEditModel.instance.efattanTutar != null && tabController.index == 2),
                        // topluIskontoBottomSheetModel(context),
                        BottomSheetModel(
                          title: "PDF Görüntüle",
                          iconWidget: Icons.picture_as_pdf_outlined,
                          onTap: () async {
                            Get.back();
                            final List<NetFectDizaynList> dizaynList = (CacheManager.getAnaVeri?.paramModel?.netFectDizaynList?.filteredDizaynList(widget.model.editTipiEnum) ?? [])
                                .where((element) => element.ozelKod == BaseSiparisEditModel.instance.getEditTipiEnum?.getPrintValue)
                                .whereType<NetFectDizaynList>()
                                .toList();
                            final result = await bottomSheetDialogManager.showBottomSheetDialog(
                              Get.context!,
                              title: "PDF Görüntüle",
                              children: dizaynList.map((NetFectDizaynList e) => BottomSheetModel(title: e.dizaynAdi ?? "", value: e)).toList(),
                            );
                            if (result is NetFectDizaynList) {
                              await Get.to(
                                () => PDFViewerView(
                                  title: result.dizaynAdi ?? "Serbest Raporlar",
                                  pdfData: PdfModel(
                                    dizaynId: result.id,
                                    raporOzelKod: result.ozelKod,
                                    etiketSayisi: result.kopyaSayisi,
                                    dicParams: DicParams(
                                      belgeNo: BaseSiparisEditModel.instance.belgeNo,
                                      cariKodu: BaseSiparisEditModel.instance.cariKodu,
                                      belgeTipi: widget.model.editTipiEnum?.rawValue,
                                    ),
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                        BottomSheetModel(
                          title: "Döviz Kurları",
                          iconWidget: Icons.attach_money_outlined,
                          onTap: () {
                            Get.back();
                            Get.toNamed("/dovizKurlari");
                          },
                        ),
                        BottomSheetModel(
                          title: "Döviz Kurlarını Güncelle",
                          iconWidget: Icons.attach_money_outlined,
                          onTap: () async {
                            Get.back();
                            await dovizGuncelle();
                          },
                        ).yetkiKontrol(BaseSiparisEditModel.instance.dovizAdi != null && !widget.model.isGoruntule),
                        BottomSheetModel(
                          title: "Cari'ye Yapılan Son Satışlar",
                          iconWidget: Icons.info_outline_rounded,
                          onTap: () async {
                            Get.back();
                            if (BaseSiparisEditModel.instance.cariKodu == null) {
                              dialogManager.showAlertDialog("Cari kodu bulunamadı. Lütfen cari seçiniz.");
                              return;
                            }
                            final cariModel = await networkManager.getCariModel(CariRequestModel.fromBaseSiparisEditModel(BaseSiparisEditModel.instance));
                            Get.toNamed("/mainPage/cariStokSatisOzeti", arguments: cariModel);
                          },
                        ).yetkiKontrol(yetkiController.cariRapStokSatisOzeti),
                        BottomSheetModel(title: "Barkod Tanımla", iconWidget: Icons.qr_code_scanner),
                        BottomSheetModel(
                          title: "Ekranı Yeni Kayda Hazırla",
                          description: "Belge kaydından sonra yeni belge giriş ekranını otomatik hazırla.",
                          iconWidget: viewModel.yeniKaydaHazirlaMi ? Icons.check_box_outlined : Icons.check_box_outline_blank_outlined,
                          onTap: () {
                            Get.back();
                            viewModel.changeYeniKaydaHazirlaMi();
                          },
                        ).yetkiKontrol(widget.model.isEkle),
                      ].nullCheckWithGeneric,
                    );
                    if (result != null) {
                      // viewModel.changeUpdateKalemler();
                    }
                  },
                  icon: const Icon(Icons.more_vert_outlined),
                ),
                Observer(
                  builder: (_) => Visibility(
                    visible: viewModel.isLastPage && kaydetButonuYetki,
                    child: IconButton(
                      onPressed: () async {
                        await dialogManager.showAreYouSureDialog(() async {
                          if (await postData()) {
                            await CacheManager.removeFaturaEditListWithUuid(BaseSiparisEditModel.instance.uuid);
                            Get.back(result: true);
                            if (viewModel.yeniKaydaHazirlaMi && widget.model.isEkle) {
                              BaseSiparisEditModel.resetInstance();
                              BaseSiparisEditModel.instance.isNew = true;
                              await Get.toNamed("/mainPage/faturaEdit", arguments: BaseEditModel<SiparisEditRequestModel>(baseEditEnum: BaseEditEnum.ekle, editTipiEnum: model.editTipiEnum));
                            }
                          }
                        });
                      },
                      icon: const Icon(Icons.save_outlined),
                    ),
                  ),
                ),
              ],
              bottom: TabBar(
                controller: tabController,
                tabs: [
                  Tab(child: Text(loc.generalStrings.general)),
                  Tab(child: Text(loc.generalStrings.other)).yetkiVarMi(widget.model.editTipiEnum?.digerSekmesiGoster ?? false),
                  const Tab(child: Text("Kalemler")),
                  const Tab(child: Text("Toplamlar")),
                ].whereType<Tab>().toList(),
              ),
            ),
            body: TabBarView(
              controller: tabController,
              physics: const NeverScrollableScrollPhysics(),
              children: <Widget>[
                Observer(
                  builder: (_) {
                    if (viewModel.showLoading) {
                      return const Center(child: CircularProgressIndicator.adaptive());
                    } else {
                      return BaseFaturaGenelView(model: model);
                    }
                  },
                ),
                BaseFaturaDigerView(model: model).yetkiVarMi(widget.model.editTipiEnum?.digerSekmesiGoster ?? false),
                BaseFaturaKalemlerView(model: model),
                BaseFaturaToplamlarView(model: model),
              ].where((Widget element) => element is! SizedBox).toList().nullCheckWithGeneric,
            ),
          ),
        ),
      );

  Future<void> dovizGuncelle() async {
    final result = await networkManager.getDovizKurlari(BaseSiparisEditModel.instance.dovizTipi, tarih: BaseSiparisEditModel.instance.tarih);
    String dovizInfo = "";
    if (result != null) {
      BaseSiparisEditModel.instance.kalemList = BaseSiparisEditModel.instance.kalemList?.map((e) {
        if (!e.dovizliMi) return e;
        final dovizModel = result.firstWhereOrNull((element) => element.dovizTipi == e.dovizTipi);
        if (BaseSiparisEditModel.instance.getEditTipiEnum?.satisMi ?? false) {
          e.dovizKuru = dovizModel?.dovSatis;
          e.brutFiyat = (e.dovizBrutTutar / (e.miktar ?? 0)) * (dovizModel?.dovSatis ?? 0);
        } else {
          e.dovizKuru = dovizModel?.dovAlis;
          e.brutFiyat = (e.dovizliBrutTutar / (e.miktar ?? 0)) * (dovizModel?.dovAlis ?? 0);
        }
        return e;
      }).toList();
      viewModel.changeUpdateKalemler();
      for (final DovizKurlariModel element in result) {
        final selectedDovizList = BaseSiparisEditModel.instance.kalemList?.where((e) => e.dovizTipi == element.dovizTipi);
        if (selectedDovizList?.isNotEmpty ?? false) {
          dovizInfo = selectedDovizList?.map((e) => e.stokKodu ?? "").join(", ") ?? "";
          dovizInfo += " için ${element.dovizAdi} döviz kuru ${(BaseSiparisEditModel.instance.getEditTipiEnum?.satisMi ?? false) ? element.dovSatis : element.dovAlis} olarak güncellendi.\n";
        }
      }
      dialogManager.showSuccesDialog(
        dovizInfo,
      );
    }
  }

  ListTile topluIskontoListTile(KalemModel? model, List<double?>? iskonto1, int index, TextEditingController controller) => ListTile(
        title: Row(
          children: <Widget>[
            Expanded(child: Text(model?.stokAdi?.toString() ?? "", overflow: TextOverflow.fade)),
            Expanded(
              child: CustomTextField(
                labelText: "İsk. 1%",
                controller: controller,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                suffix: Wrap(
                  children: <Widget>[
                    IconButton(
                      onPressed: () {
                        iskonto1?[index] = (double.tryParse(controller.text) ?? 0) - 1;
                        controller.text = (iskonto1?[index].toIntIfDouble ?? 0).toStringIfNotNull ?? "";
                      },
                      icon: const Icon(Icons.remove_outlined),
                    ),
                    IconButton(
                      onPressed: () {
                        iskonto1?[index] = (double.tryParse(controller.text) ?? 0) + 1;
                        controller.text = (iskonto1?[index].toIntIfDouble ?? 0).toStringIfNotNull ?? "";
                      },
                      icon: const Icon(Icons.add_outlined),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );

  Future<void> getData() async {
    final result = await networkManager.dioPost<BaseSiparisEditModel>(path: ApiUrls.getFaturaDetay, bodyModel: BaseSiparisEditModel(), data: widget.model.model?.toJson(), showLoading: true);
    if (result.isSuccess) {
      // viewModel.changeFuture();
      BaseSiparisEditModel.setInstance(result.dataList.first);
    }
  }

  Future<bool> postData() async {
    final instance = BaseSiparisEditModel.instance;
    if (widget.model.baseEditEnum == BaseEditEnum.ekle || widget.model.baseEditEnum.kopyalaMi || (instance.isNew ?? false)) {
      instance.yeniKayit = true;
      if (yetkiController.kontrolluBelgeAktarimAktif) {
        instance.remoteTempBelge = yetkiController.kontrolluAktarBelgeTipleri(instance) ? true : null;
      }
    }
    if (widget.model.baseEditEnum.siparistenKopyalaMi) {
      instance.kalemList = instance.kalemList?.map((e) => e.copyWith(teklifKalemSira: null, teklifNo: null)).toList();
      instance.tarih = DateTime.now().dateTimeWithoutTime;
    }
    if (instance.getEditTipiEnum?.birim1denGelsin ?? false) {
      instance.kalemList = instance.kalemList
          ?.map(
            (e) => e
              ..olcuBirimKodu = 1
              ..miktar = (e.miktar ?? 0) / ((e.olcuBirimCarpani == 0 || e.olcuBirimCarpani == null) ? 1 : e.olcuBirimCarpani!)
              ..gercekMiktar = null
              ..olcuBirimCarpani = null,
          )
          .toList();
    }
    const Uuid uuid = Uuid();
    BaseSiparisEditModel newInstance = instance.copyWith(
      islemId: uuid.v4(),
      cariModel: null,
      kalemList: null,
      otvTutari: instance.getOTVToplam,
      belgeTuru: widget.model.editTipiEnum?.rawValue,
      kalemler: instance.kalemList?.map((e) => e..siparisSira = e.sira).toList(),
    );
    if (widget.model.baseEditEnum == BaseEditEnum.duzenle) {
      newInstance.mevcutBelgeNo = widget.model.model?.belgeNo;
      newInstance.mevcutCariKodu = widget.model.model?.cariKodu;
    } else if (widget.model.baseEditEnum.kopyalaMi) {
      newInstance = newInstance.copyWith(
        // kalemler: BaseSiparisEditModel.instance.kalemList
        //     .map(
        //       (e) => e
        //         ..siparisNo = e.belgeNo
        //         ..belgeNo = null,
        //     )
        //     .toList(),
        kayityapankul: null,
        plasiyerAciklama: null,
        //TODO kontrol et
        // efatOzelkod: null,
        // efaturaTipi: null,

        // vadeTarihi: null,
        // projeAciklama: null,
        kalemList: null,
      );
    }
    if (widget.model.baseEditEnum.siparistenKopyalaMi) {
      newInstance = newInstance.copyWith(
        kalemler: instance.kalemList
            ?.map(
              (e) => e..belgeNo = null,
            )
            .toList(),
      );
    }
    final GenericResponseModel<NetworkManagerMixin> result = await networkManager.dioPost<BaseSiparisEditModel>(
      path: ApiUrls.saveFatura,
      bodyModel: BaseSiparisEditModel(),
      data: newInstance.toJson(),
      showLoading: true,
    );
    if (result.isSuccess) {
      CacheManager.removeFaturaEditList(instance.belgeNo ?? "");
      dialogManager.showSuccessSnackBar(result.message ?? "Kayıt Başarılı");
      return true;
    } else {
      return false;
    }
  }

  Future<bool?> getSiparisBaglantisi() async => await bottomSheetDialogManager.showBottomSheetDialog(
        context,
        title: "Sipariş Bağlantısı",
        body: Column(
          children: [
            Row(
              children: [
                const Icon(Icons.info_outline).paddingOnly(right: UIHelper.lowSize),
                const Text("Cari veya Sipariş seçiniz."),
              ],
            ).paddingAll(UIHelper.lowSize),
            CustomTextField(
              labelText: "Cari",
              controller: _cariKoduController,
              readOnly: true,
              suffixMore: true,
              valueWidget: Observer(builder: (_) => Text(viewModel.baseSiparisEditModel.cariKodu ?? "")),
              suffix: IconButton(
                onPressed: () async {
                  if (_cariKoduController.text.isEmpty) {
                    dialogManager.showAlertDialog("Lütfen Cari seçiniz.");
                    return;
                  }
                  dialogManager.showCariGridViewDialog(CariListesiModel());
                },
                icon: const Icon(Icons.open_in_new_outlined, color: UIHelper.primaryColor),
              ),
              onClear: () => viewModel.setCariKodu(null),
              onTap: () async {
                final result = await Get.toNamed(
                  "mainPage/cariRehberi",
                  arguments: CariListesiRequestModel(
                    menuKodu: "CARI_CREH",
                    belgeTuru: BaseSiparisEditModel.instance.getEditTipiEnum?.rawValue,
                  ),
                );
                if (result is CariListesiModel) {
                  _cariKoduController.text = result.cariAdi ?? "";
                  viewModel.setCariKodu(result);
                }
              },
            ),
            CustomTextField(
              labelText: "Sipariş",
              controller: _siparisController,
              readOnly: true,
              suffixMore: true,
              valueWidget: Observer(builder: (_) => Text((jsonDecode(viewModel.baseSiparisEditModel.arrBelgeNo ?? "[]") as List?)?.firstOrNull ?? "")),
              onClear: () => viewModel.setBelgeNo(null),
              onTap: () async {
                final result = await Get.toNamed(
                  "/mainPage/siparisRehberi",
                  arguments: BaseSiparisEditModel(
                    pickerBelgeTuru: widget.model.editTipiEnum?.rawValue,
                    cariKodu: viewModel.baseSiparisEditModel.cariKodu,
                  ),
                );
                if (result is List) {
                  final List<BaseSiparisEditModel> list = result.map((e) => e as BaseSiparisEditModel).toList().cast<BaseSiparisEditModel>();
                  viewModel.setBelgeNo(list);
                  if (list.length == 1) {
                    // if (_cariKoduController.text.isEmpty) {
                    //   final cariModel = await getCari();
                    //   viewModel.baseSiparisEditModel.cariKodu = cariModel?.cariKodu;
                    // }
                    _siparisController.text = list.firstOrNull?.belgeNo ?? "";
                  } else {
                    _siparisController.text = "${list.length} adet Sipariş Seçildi.";
                  }
                }
              },
            ),
            CustomTextField(
              labelText: "Kalemler",
              controller: _kalemlerController,
              readOnly: true,
              isMust: true,
              suffixMore: true,
              onTap: () async {
                if (_siparisController.text.isEmpty && _cariKoduController.text.isEmpty) {
                  dialogManager.showAlertDialog("Lütfen Cari veya Sipariş seçiniz.");
                  return;
                } else {
                  final result = await Get.toNamed(
                    "/mainPage/kalemRehberi",
                    arguments: SiparislerRequestModel.fromBaseSiparisEditModel(viewModel.baseSiparisEditModel)
                      ..pickerBelgeTuru = "MS"
                      ..refBelgeTuru = widget.model.editTipiEnum?.rawValue,
                  );
                  if (result is List) {
                    List<KalemModel> list = result.map((e) => e as KalemModel).toList().cast<KalemModel>();
                    list = list
                        .map(
                          (KalemModel e) => e
                            ..miktar = e.kalan
                            ..kalan = 0,
                        )
                        .toList();
                    viewModel.setKalemList(list);
                    if (_cariKoduController.text.isEmpty) {
                      final cariModel = await getCari();
                      viewModel.baseSiparisEditModel.cariTitle = cariModel?.efaturaCarisi == "E"
                          ? "E-Fatura"
                          : cariModel?.efaturaCarisi == "H"
                              ? "E-Arşiv"
                              : null;
                      viewModel.baseSiparisEditModel.efaturaTipi = cariModel?.efaturaTipi;
                      viewModel.baseSiparisEditModel.vadeGunu = cariModel?.vadeGunu;
                      viewModel.baseSiparisEditModel.plasiyerAciklama = cariModel?.plasiyerAciklama;
                      viewModel.baseSiparisEditModel.plasiyerKodu = cariModel?.plasiyerKodu;
                      viewModel.baseSiparisEditModel.cariAdi = cariModel?.cariAdi;
                      viewModel.baseSiparisEditModel.cariKodu = cariModel?.cariKodu;
                      viewModel.baseSiparisEditModel.kosulKodu = cariModel?.kosulKodu;
                    }
                    _kalemlerController.text = "${list.length} adet Kalem Seçildi.";
                  }
                }
              },
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Get.back(result: false);
                    },
                    style: ButtonStyle(backgroundColor: WidgetStateProperty.all(UIHelper.secondaryColor)),
                    child: const Text("İptal"),
                  ),
                ),
                const SizedBox(width: UIHelper.lowSize),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_kalemlerController.text.isEmpty) {
                        dialogManager.showAlertDialog("Lütfen Kalem seçiniz.");
                        return;
                      }
                      Get.back(result: true);
                      if (BaseSiparisEditModel.instance.kalemList?.any((element) => element.dovizliMi) ?? false) {
                        dialogManager.showAreYouSureDialog(
                          () async {
                            await dovizGuncelle();
                          },
                          title: "Döviz Kurları Güncellensin mi?",
                        );
                      } else {
                        dialogManager.showInfoSnackBar("Güncellenecek dövizli kalem bulunamadı.");
                      }
                    },
                    child: const Text("Kaydet"),
                  ),
                ),
              ],
            ).paddingAll(UIHelper.lowSize),
          ],
        ).paddingAll(UIHelper.lowSize),
      );

  Future<CariListesiModel?> getCari() async {
    final result = await networkManager.dioGet(
      path: ApiUrls.getCariler,
      bodyModel: CariListesiModel(),
      showLoading: true,
      queryParameters: {
        "filterText": "",
        "Kod": viewModel.baseSiparisEditModel.cariKodu,
        "EFaturaGoster": true,
        "KisitYok": true,
        "BelgeTuru": widget.model.editTipiEnum?.rawValue,
        "PlasiyerKisitiYok": true,
      },
    );
    return result.dataList.firstOrNull;
  }

  Future<void> getKalemRehberi() async {
    final result = await Get.toNamed("/mainPage/kalemRehberi", arguments: BaseSiparisEditModel.instance..belgeTuru = "MS");
    if (result is List) {
      List<KalemModel> list = result.map((e) => e as KalemModel).toList().cast<KalemModel>();
      list = list
          .map(
            (KalemModel e) => e
              ..miktar = e.kalan
              ..kalan = 0,
          )
          .toList();
      viewModel.setKalemList(list);
    }
  }

  bool get kaydetButonuYetki {
    if (widget.model.baseEditEnum == BaseEditEnum.goruntule) return false;
    switch (widget.model.baseEditEnum) {
      case BaseEditEnum.ekle:
      case BaseEditEnum.kopyala:
      case BaseEditEnum.siparistenKopyala:
      case BaseEditEnum.revize:
      case BaseEditEnum.taslak:
        return widget.model.editTipiEnum?.eklensinMi ?? false;
      case BaseEditEnum.duzenle:
        return widget.model.editTipiEnum?.duzenlensinMi ?? false;
      default:
        return false;
    }
  }
}
