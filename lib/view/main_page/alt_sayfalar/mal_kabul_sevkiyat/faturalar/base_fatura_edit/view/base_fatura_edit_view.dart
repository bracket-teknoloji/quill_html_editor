import "dart:convert";

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/view/cari_rehberi/model/cari_listesi_request_model.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:uuid/uuid.dart";

import "../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../../core/base/model/generic_response_model.dart";
import "../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "../../../../../../../core/base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../../core/constants/extensions/list_extensions.dart";
import "../../../../../../../core/constants/extensions/model_extensions.dart";
import "../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../core/constants/extensions/widget_extensions.dart";
import "../../../../../../../core/constants/static_variables/static_variables.dart";
import "../../../../../../../core/init/cache/cache_manager.dart";
import "../../../../../../../core/init/network/login/api_urls.dart";
import "../../../../../model/param_model.dart";
import "../../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../../siparis/siparisler/model/siparis_edit_request_model.dart";
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

class _BaseFaturaEditViewState extends BaseState<BaseFaturaEditView> with SingleTickerProviderStateMixin {
  BaseFaturaEditViewModel viewModel = BaseFaturaEditViewModel();
  late final TabController tabController;
  late BaseEditModel<SiparisEditRequestModel> model;
  late final TextEditingController _cariKoduController;
  late final TextEditingController _siparisController;
  late final TextEditingController _kalemlerController;

  @override
  void initState() {
    StaticVariables.instance.editTipi = widget.model.editTipiEnum ?? EditTipiEnum.alisFatura;
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
        }
      }
      if (tabController.index == (widget.model.editTipiEnum?.digerSekmesiGoster ?? false ? 3 : 2) && BaseSiparisEditModel.instance.kalemList.ext.isNotNullOrEmpty) {
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

    if (widget.model.baseEditEnum == BaseEditEnum.duzenle || widget.model.baseEditEnum == BaseEditEnum.kopyala) {
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
      if (BaseSiparisEditModel.instance.isEmpty && widget.model.baseEditEnum != BaseEditEnum.ekle) {
        final GenericResponseModel<NetworkManagerMixin> result =
            await networkManager.dioPost<BaseSiparisEditModel>(path: ApiUrls.getFaturaDetay, bodyModel: BaseSiparisEditModel(), data: model.model?.toJson(), showLoading: true);
        if (result.success == true) {
          BaseSiparisEditModel.setInstance(result.data!.first);
          BaseSiparisEditModel.instance.tag = "FaturaModel";
          BaseSiparisEditModel.instance.islemeBaslamaTarihi = DateTime.now();
          BaseSiparisEditModel.instance.isNew = false;
          if (widget.model.baseEditEnum == BaseEditEnum.duzenle) {
          } else if (widget.model.baseEditEnum == BaseEditEnum.kopyala) {
            BaseSiparisEditModel.setInstance(widget.model.model);
            if (widget.model.model?.kalemList != null) {
              BaseSiparisEditModel.instance.kalemList = widget.model.model?.kalemList;
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
      } else if (widget.model.baseEditEnum == BaseEditEnum.ekle) {
        BaseSiparisEditModel.resetInstance();
        final result = await getSiparisBaglantisi();
        if (model.editTipiEnum.irsaliyeMi) {
          BaseSiparisEditModel.instance.ebelgeCheckbox = "E";
        }
        BaseSiparisEditModel.instance.tarih = DateTime.now();
        BaseSiparisEditModel.instance.tag = "FaturaModel";
        BaseSiparisEditModel.instance.siparisTipi = model.editTipiEnum;
        BaseSiparisEditModel.instance.isNew = true;
        if (result != true) {
          BaseSiparisEditModel.instance.belgeNo = null;
          BaseSiparisEditModel.instance.cariKodu = null;
          BaseSiparisEditModel.instance.kalemList = <KalemModel>[];
          BaseSiparisEditModel.instance.arrBelgeNo = null;
        } else {
          final cariModel = await getCari();
          if (cariModel is CariListesiModel) {
            viewModel.changeIsBaseSiparisEmpty(true);
            BaseSiparisEditModel.instance.plasiyerAciklama = cariModel.plasiyerAciklama;
            BaseSiparisEditModel.instance.plasiyerKodu = cariModel.plasiyerKodu;
            BaseSiparisEditModel.instance.cariAdi = cariModel.cariAdi;
            BaseSiparisEditModel.instance.cariKodu = cariModel.cariKodu;
            BaseSiparisEditModel.instance.kosulKodu = cariModel.kosulKodu;
            BaseSiparisEditModel.instance.belgeTipi = int.tryParse(cariModel.odemeTipi ?? "0");
          }
        }
      }

      BaseSiparisEditModel.instance.belgeTuru = widget.model.editTipiEnum?.rawValue;
      BaseSiparisEditModel.instance.pickerBelgeTuru = widget.model.editTipiEnum?.rawValue;
      viewModel.changeIsBaseSiparisEmpty(false);
    });
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
  Widget build(BuildContext context) => WillPopScope(
        child: DefaultTabController(
          length: widget.model.editTipiEnum?.digerSekmesiGoster ?? false ? 4 : 3,
          child: Scaffold(
            appBar: AppBar(
              title: AppBarTitle(
                title: widget.model.editTipiEnum?.getName ?? "Fatura",
                subtitle: widget.model.model?.belgeNo,
                isSubTitleSmall: widget.isSubTitleSmall,
              ),
              actions: <Widget>[
                IconButton(
                  onPressed: () async {
                    final result = await bottomSheetDialogManager.showBottomSheetDialog(
                      context,
                      title: loc(context).generalStrings.options,
                      children: <BottomSheetModel?>[
                        BottomSheetModel(
                          title: "Cari İşlemleri",
                          iconWidget: Icons.person_outline_outlined,
                          onTap: () {
                            Get.back();
                            dialogManager.showCariGridViewDialog(BaseSiparisEditModel.instance.cariModel);
                          },
                        ),
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
                        BottomSheetModel(title: "Döviz Kurlarını Güncelle", iconWidget: Icons.attach_money_outlined).yetkiKontrol(BaseSiparisEditModel.instance.dovizAdi != null),
                        BottomSheetModel(
                          title: "Cari'ye Yapılan Son Satışlar",
                          iconWidget: Icons.info_outline_rounded,
                          onTap: () {
                            Get.back();
                            Get.toNamed("/mainPage/cariStokSatisOzeti", arguments: BaseSiparisEditModel.instance.cariModel);
                          },
                        ).yetkiKontrol(yetkiController.cariRapStokSatisOzeti),
                        BottomSheetModel(title: "Barkod Tanımla", iconWidget: Icons.qr_code_outlined),
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
                    visible: viewModel.isLastPage && widget.model.baseEditEnum != BaseEditEnum.goruntule,
                    child: IconButton(
                      onPressed: () async {
                        await dialogManager.showAreYouSureDialog(() async {
                          if (await postData()) {
                            await CacheManager.removeSiparisEditListWithUuid(BaseSiparisEditModel.instance.uuid);
                            Get.back();
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
                  const Tab(child: Text("Genel")),
                  Tab(child: Text(loc(context).generalStrings.other)).yetkiVarMi(widget.model.editTipiEnum?.digerSekmesiGoster ?? false),
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
                    if (viewModel.isBaseSiparisEmpty) {
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
        onWillPop: () async {
          if (widget.model.baseEditEnum == BaseEditEnum.goruntule) {
            return true;
          }
          bool result = false;
          await dialogManager.showAreYouSureDialog(() {
            result = true;
            BaseSiparisEditModel.resetInstance();
          });
          return result;
        },
      );

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
    final GenericResponseModel<NetworkManagerMixin> result =
        await networkManager.dioPost<BaseSiparisEditModel>(path: ApiUrls.getFaturaDetay, bodyModel: BaseSiparisEditModel(), data: widget.model.model?.toJson(), showLoading: true);
    if (result.success == true) {
      // viewModel.changeFuture();
      BaseSiparisEditModel.setInstance(result.data!.first);
    }
  }

  Future<bool> postData() async {
    if (widget.model.baseEditEnum == BaseEditEnum.ekle || (BaseSiparisEditModel.instance.isNew ?? false)) {
      BaseSiparisEditModel.instance.yeniKayit = true;
    }
    const Uuid uuid = Uuid();
    final GenericResponseModel<NetworkManagerMixin> result = await networkManager.dioPost<BaseSiparisEditModel>(
      path: ApiUrls.saveFatura,
      bodyModel: BaseSiparisEditModel(),
      data: (BaseSiparisEditModel.instance.copyWith(islemId: uuid.v4(), cariModel: null)).toJson(),
      showLoading: true,
    );
    if (result.success == true) {
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
                icon: Icon(Icons.open_in_new_outlined, color: UIHelper.primaryColor),
              ),
              onTap: () async {
                final result = await Get.toNamed(
                  "mainPage/cariRehberi",
                  arguments: CariListesiRequestModel(
                    menuKodu: "CARI_CREH",
                    belgeTuru: "MS",
                    siparisKarsilanmaDurumu: "K",
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
              onTap: () async {
                final result = await Get.toNamed("/mainPage/siparisRehberi", arguments: BaseSiparisEditModel(pickerBelgeTuru: widget.model.editTipiEnum?.rawValue));
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
                  final result = await Get.toNamed("/mainPage/kalemRehberi", arguments: viewModel.baseSiparisEditModel..belgeTuru = "MS");
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
                      viewModel.baseSiparisEditModel.cariKodu = cariModel?.cariKodu;
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
                    style: ButtonStyle(backgroundColor: MaterialStateProperty.all(UIHelper.secondaryColor)),
                    child: const Text("İptal"),
                  ),
                ),
                SizedBox(width: UIHelper.lowSize),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_kalemlerController.text.isEmpty) {
                        dialogManager.showAlertDialog("Lütfen Kalem seçiniz.");
                        return;
                      }
                      Get.back(result: true);
                      if (BaseSiparisEditModel.instance.kalemList?.any((element) => element.dovizliMi) ?? false) {
                        dialogManager.showAreYouSureDialog(() async {});
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
    return result.data.first;
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
}
