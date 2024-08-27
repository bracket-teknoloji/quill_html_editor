import "dart:convert";

import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/model/doviz_kurlari_model.dart";
import "package:picker/core/base/view/cari_rehberi/model/cari_listesi_request_model.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/siparisler/model/siparisler_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/transfer/base_transfer_edit/alt_sayfalar/base_transfer_diger/view/base_talep_teklif_diger_view.dart";
import "package:picker/view/main_page/alt_sayfalar/transfer/base_transfer_edit/alt_sayfalar/base_transfer_genel/view/base_transfer_genel_view.dart";
import "package:picker/view/main_page/alt_sayfalar/transfer/base_transfer_edit/alt_sayfalar/base_transfer_kalemler/view/base_transfer_kalemler_view.dart";
import "package:picker/view/main_page/alt_sayfalar/transfer/base_transfer_edit/alt_sayfalar/base_transfer_toplamlar/view/base_transfer_toplamlar_view.dart";
import "package:picker/view/main_page/alt_sayfalar/transfer/base_transfer_edit/view_model/base_transfer_editing_view_model.dart";
import "package:uuid/uuid.dart";

import "../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "../../../../../../core/base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../core/constants/enum/edit_tipi_enum.dart";
import "../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../core/constants/extensions/list_extensions.dart";
import "../../../../../../core/constants/extensions/model_extensions.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/constants/static_variables/static_variables.dart";
import "../../../../../../core/init/cache/cache_manager.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../../../../model/param_model.dart";
import "../../../cari/cari_listesi/model/cari_listesi_model.dart";
import "../../../cari/cari_listesi/model/cari_request_model.dart";
import "../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../siparis/siparisler/model/siparis_edit_request_model.dart";

class BaseTransferEditingView extends StatefulWidget {
  final String? appBarTitle;
  final bool? isSubTitleSmall;
  // final List<Widget>? actions;
  final BaseEditModel model;
  const BaseTransferEditingView({super.key, this.appBarTitle, this.isSubTitleSmall, required this.model});

  @override
  State<BaseTransferEditingView> createState() => _BaseTransferEditingViewState();
}

class _BaseTransferEditingViewState extends BaseState<BaseTransferEditingView> with TickerProviderStateMixin {
  BaseTransferEditingViewModel viewModel = BaseTransferEditingViewModel();
  late final TabController tabController;
  late BaseEditModel<SiparisEditRequestModel> model;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late final TextEditingController _cariKoduController;
  late final TextEditingController _siparisController;
  late final TextEditingController _kalemlerController;

  @override
  void initState() {
    viewModel.setLoading(true);
    _cariKoduController = TextEditingController();
    _siparisController = TextEditingController();
    _kalemlerController = TextEditingController();
    tabController = TabController(length: widget.model.editTipiEnum?.digerSekmesiGoster ?? false ? 4 : 3, vsync: this);
    if (widget.model.baseEditEnum != BaseEditEnum.goruntule) {
      tabController.addListener(() {
        if (tabController.indexIsChanging && tabController.previousIndex == 0) {
          final result = StaticVariables.instance.transferGenelFormKey.currentState?.validate();
          if (result == null || !result) {
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
    }

    if (widget.model.model is BaseSiparisEditModel) {
      model = BaseEditModel<SiparisEditRequestModel>()..model = SiparisEditRequestModel.fromSiparislerModel(widget.model.model as BaseSiparisEditModel);
      model.baseEditEnum = widget.model.baseEditEnum;
      model.editTipiEnum = widget.model.editTipiEnum;
    } else if (widget.model.model is BaseSiparisEditModel) {
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (!widget.model.baseEditEnum.ekleMi) {
        final result = await networkManager.dioPost<BaseSiparisEditModel>(path: ApiUrls.getFaturaDetay, bodyModel: BaseSiparisEditModel(), data: model.model?.toJson(), showLoading: true);
        if (result.isSuccess) {
          BaseSiparisEditModel.setInstance(result.data!.first);
          BaseSiparisEditModel.instance.isNew = false;
          BaseSiparisEditModel.instance.islemeBaslamaTarihi = DateTime.now();
          BaseSiparisEditModel.instance.mevcutBelgeNo = BaseSiparisEditModel.instance.belgeNo;
          BaseSiparisEditModel.instance.mevcutCariKodu = BaseSiparisEditModel.instance.cariKodu;
          if (widget.model.baseEditEnum == BaseEditEnum.duzenle) {
          } else if (widget.model.baseEditEnum == BaseEditEnum.kopyala) {
            BaseSiparisEditModel.instance.tarih = DateTime.now().dateTimeWithoutTime;
            BaseSiparisEditModel.instance.belgeNo = widget.model.model?.belgeNo;
            BaseSiparisEditModel.instance.isNew = true;
            BaseSiparisEditModel.instance.vadeGunu = (widget.model.model as BaseSiparisEditModel).vadeGunu;
            BaseSiparisEditModel.instance.vadeTarihi = (widget.model.model as BaseSiparisEditModel).vadeTarihi;
          } else if (widget.model.baseEditEnum == BaseEditEnum.revize) {
            BaseSiparisEditModel.instance.isNew = true;
            BaseSiparisEditModel.instance.yeniKayit = true;
            BaseSiparisEditModel.instance.belgeNo = null;
            BaseSiparisEditModel.instance.teklifRevizeIslemi = true;
            BaseSiparisEditModel.instance.vadeGunu = (widget.model.model as BaseSiparisEditModel).vadeGunu;
            BaseSiparisEditModel.instance.vadeTarihi = (widget.model.model as BaseSiparisEditModel).vadeTarihi;
          }
        }
      } else if (widget.model.baseEditEnum == BaseEditEnum.ekle) {
        BaseSiparisEditModel.resetInstance();
        BaseSiparisEditModel.instance.belgeTuru = widget.model.editTipiEnum?.rawValue;
        if ((widget.model.model as BaseSiparisEditModel?)?.kalemList != null) {
          BaseSiparisEditModel.instance.olcumBelgeRefKey = (widget.model.model as BaseSiparisEditModel).olcumBelgeRefKey;
          BaseSiparisEditModel.instance.kalemList = (widget.model.model as BaseSiparisEditModel).kalemList;
        } else {
          final result = await getSiparisBaglantisi();
          if (result != true && !(BaseSiparisEditModel.instance.getEditTipiEnum?.siparisBaglantisiOpsiyonelMi ?? false)) {
            Get.back();
          } else if (result != true) {
            BaseSiparisEditModel.resetInstance();
          }
        }
        BaseSiparisEditModel.instance.belgeTuru ??= widget.model.editTipiEnum?.rawValue;
        BaseSiparisEditModel.instance.pickerBelgeTuru ??= widget.model.editTipiEnum?.rawValue;
        BaseSiparisEditModel.instance.tarih = DateTime.now().dateTimeWithoutTime;
        BaseSiparisEditModel.instance.isNew = true;
        BaseSiparisEditModel.instance.cariAdi = widget.model.model?.cariAdi;
        BaseSiparisEditModel.instance.hareketTuru = widget.model.model?.hareketTuru;
        BaseSiparisEditModel.instance.cariKodu = widget.model.model?.cariKodu;
        BaseSiparisEditModel.instance.projeKodu = widget.model.model?.projeKodu;
        BaseSiparisEditModel.instance.girisDepoKodu = widget.model.model?.girisDepoKodu;
        BaseSiparisEditModel.instance.cikisDepoKodu = widget.model.model?.cikisDepoKodu;
        BaseSiparisEditModel.instance.topluGirisDepoTanimi = widget.model.model?.topluGirisDepoTanimi;
        BaseSiparisEditModel.instance.topluCikisDepoTanimi = widget.model.model?.topluCikisDepoTanimi;
        BaseSiparisEditModel.instance.isNew = true;
        if (BaseSiparisEditModel.instance.getEditTipiEnum?.siparisBaglantisiGoster ?? false) {
          BaseSiparisEditModel.instance.belgeTipi = 2;
          BaseSiparisEditModel.instance.tipi = 2;
          BaseSiparisEditModel.instance.tarih = DateTime.now().dateTimeWithoutTime;
          BaseSiparisEditModel.instance.tag = "FaturaModel";
          BaseSiparisEditModel.instance.siparisTipi = model.editTipiEnum;
          BaseSiparisEditModel.instance.isNew = true;
        }
        BaseSiparisEditModel.instance.cikisDepoKodu ??= yetkiController.transferLokalDatCikisDepo?.depoKodu;
        BaseSiparisEditModel.instance.girisDepoKodu ??= yetkiController.transferLokalDatGirisDepo?.depoKodu;
        BaseSiparisEditModel.instance.topluCikisDepoTanimi ??= yetkiController.transferLokalDatCikisDepo?.depoTanimi;
        BaseSiparisEditModel.instance.topluGirisDepoTanimi ??= yetkiController.transferLokalDatGirisDepo?.depoTanimi;
        if (yetkiController.transferDatLokalDATSeciliGelmesin) {
          BaseSiparisEditModel.instance.lokalDat = "H";
        } else {
          BaseSiparisEditModel.instance.lokalDat = "E";
        }
        BaseSiparisEditModel.instance.tag = "FaturaModel";
        // 2 olma sebebi yeni açılan her kayıtta yurtiçi belge tipinde olarak başlaması için
        BaseSiparisEditModel.instance.tipi = 2;
        BaseSiparisEditModel.instance.siparisTipi = model.editTipiEnum;
      }

      BaseSiparisEditModel.instance.belgeTuru ??= widget.model.editTipiEnum?.rawValue;
      BaseSiparisEditModel.instance.pickerBelgeTuru ??= widget.model.editTipiEnum?.rawValue;
      viewModel.setLoading(false);
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
  Widget build(BuildContext context) => PopScope(
        canPop: widget.model.baseEditEnum == BaseEditEnum.goruntule,
        onPopInvokedWithResult: (didPop, value) async {
          if (didPop) {
            return;
          }
          await dialogManager.showAreYouSureDialog(() => Get.back(result: true));
          BaseSiparisEditModel.resetInstance();
        },
        child: Scaffold(
          appBar: AppBar(
            title: AppBarTitle(
              title: "${model.editTipiEnum?.getName ?? "Talep Teklif"}${widget.model.baseEditEnum.revizeMi ? " (Revize)" : ""}",
              subtitle: widget.model.baseEditEnum?.getName,
              isSubTitleSmall: widget.isSubTitleSmall,
            ),
            actions: [
              seceneklerButton(context),
              Observer(
                builder: (_) => Visibility(
                  visible: viewModel.isLastPage && kaydetButonuYetki,
                  child: IconButton(
                    onPressed: () async {
                      dialogManager.showAreYouSureDialog(() async {
                        if (await postData()) {
                          Get.back(result: true);
                          await dialogManager.showAreYouSureDialog(
                            () async {
                              final PdfModel pdfModel = PdfModel(
                                raporOzelKod: BaseSiparisEditModel.instance.getEditTipiEnum?.getPrintValue ?? "",
                                dicParams: DicParams(
                                  belgeNo: BaseSiparisEditModel.instance.belgeNo,
                                  cariKodu: BaseSiparisEditModel.instance.cariKodu,
                                  belgeTipi: BaseSiparisEditModel.instance.getEditTipiEnum?.rawValue,
                                ),
                              );
                              await showPdfView(pdfModel);
                            },
                            title: "PDF görüntülemek ister misiniz?",
                          );
                          await CacheManager.removeSiparisEditListWithUuid(BaseSiparisEditModel.instance.uuid);
                          BaseSiparisEditModel.resetInstance();
                          if (viewModel.yeniKaydaHazirlaMi && widget.model.isEkle) {
                            BaseSiparisEditModel.instance.isNew = true;
                            Get.toNamed("/mainPage/TalTekEdit", arguments: BaseEditModel<BaseSiparisEditModel>(baseEditEnum: BaseEditEnum.ekle, editTipiEnum: model.editTipiEnum));
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
              ].whereNot((element) => element is SizedBox).toList(),
            ),
          ),
          body: Observer(
            builder: (_) => TabBarView(
              controller: tabController,
              physics: viewModel.isValid ? null : const NeverScrollableScrollPhysics(),
              children: [
                Observer(
                  builder: (_) {
                    if (viewModel.showLoading) {
                      return const Center(child: CircularProgressIndicator.adaptive());
                    } else {
                      return BaseTransferGenelView(model: model);
                    }
                  },
                ),
                BaseTransferDigerView(model: model).yetkiVarMi(widget.model.editTipiEnum?.digerSekmesiGoster ?? false),
                BaseTransferKalemlerView(model: model),
                BaseTransferToplamlarView(model: model),
              ].whereNot((element) => element is SizedBox).toList(),
            ),
          ),
        ),
      );

  IconButton seceneklerButton(BuildContext context) => IconButton(
        onPressed: () async {
          final result = await bottomSheetDialogManager.showBottomSheetDialog(
            context,
            title: loc.generalStrings.options,
            children: [
              BottomSheetModel(
                title: "Seri Hareket kaydı",
                iconWidget: Icons.dynamic_form_outlined,
                onTap: () async {
                  Get.back();
                  Get.toNamed("/seriGirisi");
                },
              ),
              BottomSheetModel(
                title: "Cari İşlemleri",
                iconWidget: Icons.person_2_outlined,
                onTap: () async {
                  Get.back();
                  dialogManager.showCariIslemleriGridViewDialog(await networkManager.getCariModel(CariRequestModel.fromBaseSiparisEditModel(BaseSiparisEditModel.instance)));
                },
              ),
              // topluIskontoBottomSheetModel(context),
              // BottomSheetModel(
              //   title: "PDF Görüntüle",
              //   iconWidget: Icons.picture_as_pdf_outlined,
              //   onTap: () async {
              //     Get.back();
              //     final List<NetFectDizaynList> dizaynList = (CacheManager.getAnaVeri?.paramModel?.netFectDizaynList?.filteredDizaynList(widget.model.editTipiEnum) ?? [])
              //         .where((element) => element.ozelKod == BaseSiparisEditModel.instance.getEditTipiEnum?.getPrintValue)
              //         .whereType<NetFectDizaynList>()
              //         .toList();
              //     final result = await bottomSheetDialogManager.showBottomSheetDialog(
              //       Get.context!,
              //       title: "PDF Görüntüle",
              //       children: dizaynList.map((e) => BottomSheetModel(title: e.dizaynAdi ?? "", value: e)).toList(),
              //     );
              //     if (result is NetFectDizaynList) {
              //       Get.to(
              //         () => PDFViewerView(
              //           title: result.dizaynAdi ?? "Serbest Raporlar",
              //           pdfData: PdfModel(
              //             dizaynId: result.id,
              //             raporOzelKod: result.ozelKod,
              //             etiketSayisi: result.kopyaSayisi,
              //             dicParams: DicParams(
              //               belgeNo: BaseSiparisEditModel.instance.belgeNo,
              //               cariKodu: BaseSiparisEditModel.instance.cariKodu,
              //               belgeTipi: widget.model.editTipiEnum?.rawValue,
              //             ),
              //           ),
              //         ),
              //       );
              //     }
              //   },
              // ),
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
                  final result = await networkManager.getDovizKurlari(BaseSiparisEditModel.instance.dovizTipi, tarih: BaseSiparisEditModel.instance.tarih);
                  String dovizInfo = "";
                  if (result != null) {
                    BaseSiparisEditModel.instance.kalemList = BaseSiparisEditModel.instance.kalemList?.map((e) {
                      if (!e.dovizliMi) return e;
                      final dovizModel = result.firstWhereOrNull((element) => element.dovizTipi == e.dovizTipi);
                      if (BaseSiparisEditModel.instance.getEditTipiEnum?.satisMi ?? false) {
                        e.dovizKuru = dovizModel?.dovSatis;
                        e.brutFiyat = (e.dovizliBrutTutar) * (dovizModel?.dovSatis ?? 0);
                      } else {
                        e.dovizKuru = dovizModel?.dovAlis;
                        e.brutFiyat = (e.dovizliBrutTutar) * (dovizModel?.dovAlis ?? 0);
                      }
                      return e;
                    }).toList();
                    viewModel.changeUpdateKalemler();
                    for (final DovizKurlariModel element in result) {
                      final selectedDovizList = BaseSiparisEditModel.instance.kalemList?.where((e) => e.dovizTipi == element.dovizTipi);
                      if (selectedDovizList?.isNotEmpty ?? false) {
                        dovizInfo = selectedDovizList?.map((e) => e.stokKodu ?? "").join(", ") ?? "";
                        dovizInfo +=
                            " için ${element.dovizAdi} döviz kuru ${(BaseSiparisEditModel.instance.getEditTipiEnum?.satisMi ?? false) ? element.dovSatis : element.dovAlis} olarak güncellendi.\n";
                      }
                    }
                    dialogManager.showSuccesDialog(
                      dovizInfo,
                    );
                  }
                },
              ).yetkiKontrol(BaseSiparisEditModel.instance.dovizAdi != null),
              // BottomSheetModel(
              //   title: "Cari'ye Yapılan Son Satışlar",
              //   iconWidget: Icons.info_outline_rounded,
              //   onTap: () {
              //     Get.back();
              //     Get.toNamed("/mainPage/cariStokSatisOzeti", arguments: BaseSiparisEditModel.instance.cariModel);
              //   },
              // ).yetkiKontrol(yetkiController.cariRapStokSatisOzeti),
              // BottomSheetModel(title: "Barkod Tanımla", iconWidget: Icons.qr_code_outlined),
              // BottomSheetModel(
              //   title: "Ekranı Yeni Kayda Hazırla",
              //   description: "Belge kaydından sonra yeni belge giriş ekranını otomatik hazırla.",
              //   iconWidget: viewModel.yeniKaydaHazirlaMi ? Icons.check_box_outlined : Icons.check_box_outline_blank_outlined,
              //   onTap: () {
              //     Get.back();
              //     viewModel.changeYeniKaydaHazirlaMi();
              //   },
              // ).yetkiKontrol(widget.model.isEkle),
            ].nullCheckWithGeneric,
          );
          if (result != null) {
            viewModel.changeUpdateKalemler();
          }
        },
        icon: const Icon(Icons.more_vert_outlined),
      );

  BottomSheetModel topluIskontoBottomSheetModel(BuildContext context) => BottomSheetModel(
        title: "Toplu İskonto Girişi",
        iconWidget: Icons.add_outlined,
        onTap: viewModel.model.kalemList.ext.isNullOrEmpty
            ? () {
                Get.back();
                return dialogManager.showAlertDialog("Önce kalem girmeniz gerekiyor.");
              }
            : () async {
                Get.back();
                final List<KalemModel>? kalemList = BaseSiparisEditModel.instance.kalemList;
                final List<double?>? iskontoList = kalemList?.map((e) => e.iskonto1).toList();
                await bottomSheetDialogManager.showBottomSheetDialog(
                  context,
                  title: "Toplu İskonto Girişi",
                  body: SafeArea(
                    child: Column(
                      children: [
                        Container(
                          constraints: BoxConstraints(maxHeight: height * 0.8),
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: kalemList?.length ?? 0,
                            itemBuilder: (BuildContext context, int index) {
                              final KalemModel? model = kalemList?[index];
                              final TextEditingController controller = TextEditingController(text: (model?.iskonto1.toIntIfDouble ?? 0).toStringIfNotNull);
                              return topluIskontoListTile(model, iskontoList, index, controller);
                            },
                          ),
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: Get.back,
                                style: ButtonStyle(backgroundColor: WidgetStateProperty.all(theme.colorScheme.onSurface.withOpacity(0.1))),
                                child: const Text("İptal"),
                              ),
                            ),
                            SizedBox(width: width * 0.02),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  kalemList?.forEach((element) {
                                    element.iskonto1 = iskontoList?[kalemList.indexOf(element)];
                                  });
                                  viewModel.changeUpdateKalemler();
                                  setState(() {});
                                  Get.back();
                                },
                                child: const Text("Kaydet"),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
      );

  ListTile topluIskontoListTile(KalemModel? model, List<double?>? iskonto1, int index, TextEditingController controller) => ListTile(
        title: Row(
          children: [
            Expanded(child: Text(model?.stokAdi?.toString() ?? "", overflow: TextOverflow.fade)),
            Expanded(
              child: CustomTextField(
                labelText: "İsk. 1%",
                controller: controller,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                suffix: Wrap(
                  children: [
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

  NeverScrollableScrollPhysics? tabBarViewPhysics() {
    viewModel.changeIsValid();
    if (viewModel.isValid) {
      return null;
    } else {
      return const NeverScrollableScrollPhysics();
    }
  }

  Future<void> getData() async {
    final result = await networkManager.dioPost<BaseSiparisEditModel>(path: ApiUrls.getFaturaDetay, bodyModel: BaseSiparisEditModel(), data: widget.model.model?.toJson(), showLoading: true);
    if (result.isSuccess) {
      viewModel.changeFuture();
      BaseSiparisEditModel.setInstance(result.data!.first);
    }
  }

  Future<bool> postData() async {
    if (widget.model.baseEditEnum == BaseEditEnum.ekle || (BaseSiparisEditModel.instance.isNew ?? false)) {
      BaseSiparisEditModel.instance.yeniKayit = true;
    }
    const uuid = Uuid();
    final result = await networkManager.dioPost<BaseSiparisEditModel>(
      path: ApiUrls.saveFatura,
      bodyModel: BaseSiparisEditModel(),
      data: (BaseSiparisEditModel.instance..islemId = uuid.v4()).toJson(),
      showLoading: true,
    );
    if (result.isSuccess) {
      dialogManager.showSuccessSnackBar("Kayıt Başarılı");

      return true;
    } else {
      return false;
    }
  }

  Future<void> showPdfView(PdfModel? pdfModel) async {
    final List<NetFectDizaynList> dizaynList = (CacheManager.getAnaVeri?.paramModel?.netFectDizaynList?.filteredDizaynList(BaseSiparisEditModel.instance.getEditTipiEnum) ?? [])
        .where((element) => element.ozelKod == BaseSiparisEditModel.instance.getEditTipiEnum?.getPrintValue)
        .whereType<NetFectDizaynList>()
        .toList();
    final result = await bottomSheetDialogManager.showBottomSheetDialog(
      Get.context!,
      title: "PDF Görüntüle",
      children: dizaynList.map((e) => BottomSheetModel(title: e.dizaynAdi ?? "", value: e)).toList(),
    );
    if (result is NetFectDizaynList) {
      Get.to(
        () => PDFViewerView(
          title: result.dizaynAdi ?? "Serbest Raporlar",
          pdfData: pdfModel
            ?..dizaynId = result.id
            ..etiketSayisi = result.kopyaSayisi,
        ),
      );
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
                  dialogManager.showCariGridViewDialog(CariListesiModel()..cariKodu = viewModel.model.cariKodu);
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
                  final result = await Get.toNamed("/mainPage/kalemRehberi", arguments: SiparislerRequestModel.fromBaseSiparisEditModel(viewModel.baseSiparisEditModel)..pickerBelgeTuru = "MS");
                  if (result is List) {
                    List<KalemModel> list = result.map((e) => e as KalemModel).toList().cast<KalemModel>();
                    final cariModel = await networkManager.getCariModel(CariRequestModel(kod: [list.firstOrNull?.cariKodu ?? ""]));
                    BaseSiparisEditModel.instance.cariAdi = cariModel?.cariAdi;
                    BaseSiparisEditModel.instance.cariKodu = cariModel?.cariKodu;
                    BaseSiparisEditModel.instance.vadeGunu = cariModel?.vadeGunu;
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

  bool get kaydetButonuYetki {
    if (widget.model.baseEditEnum == BaseEditEnum.goruntule) return false;
    switch (widget.model.baseEditEnum) {
      case BaseEditEnum.ekle:
      case BaseEditEnum.kopyala:
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
