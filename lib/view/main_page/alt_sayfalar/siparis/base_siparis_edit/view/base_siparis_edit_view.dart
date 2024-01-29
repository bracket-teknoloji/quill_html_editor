import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:uuid/uuid.dart";

import "../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../core/base/model/doviz_kurlari_model.dart";
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
import "../../siparisler/model/siparis_edit_request_model.dart";
import "../alt_sayfalar/base_siparisler_diger/view/base_siparisler_diger_view.dart";
import "../alt_sayfalar/base_siparisler_genel/view/base_siparisler_genel_view.dart";
import "../alt_sayfalar/base_siparisler_kalemler/view/base_siparis_kalemler_view.dart";
import "../alt_sayfalar/base_siparisler_toplamlar/view/base_siparis_toplamlar_view.dart";
import "../model/base_siparis_edit_model.dart";
import "../view_model/base_siparis_editing_view_model.dart";

class BaseSiparisEditingView extends StatefulWidget {
  final String? appBarTitle;
  final String? appBarSubtitle;
  final bool? isSubTitleSmall;
  // final List<Widget>? actions;
  final BaseEditModel model;
  const BaseSiparisEditingView({super.key, this.appBarTitle, this.appBarSubtitle, this.isSubTitleSmall, required this.model});

  @override
  State<BaseSiparisEditingView> createState() => _BaseSiparisEditingViewState();
}

class _BaseSiparisEditingViewState extends BaseState<BaseSiparisEditingView> with TickerProviderStateMixin {
  BaseSiparisEditingViewModel viewModel = BaseSiparisEditingViewModel();
  late final TabController tabController;
  late BaseEditModel<SiparisEditRequestModel> model;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    StaticVariables.instance.editTipi = widget.model.editTipiEnum ?? EditTipiEnum.musteri;
    tabController = TabController(length: yetkiController.siparisDigerSekmesiGoster ? 4 : 3, vsync: this);
    tabController.addListener(() {
      if (tabController.indexIsChanging && tabController.previousIndex == 0) {
        final result = StaticVariables.instance.siparisGenelFormKey.currentState?.validate();
        if (result == null || !result) {
          dialogManager.showErrorSnackBar("Lütfen gerekli alanları doldurunuz.");
          tabController.animateTo(tabController.previousIndex);
        }
      }
      if (tabController.index == (yetkiController.siparisDigerSekmesiGoster ? 3 : 2) &&
          BaseSiparisEditModel.instance.kalemList.ext.isNotNullOrEmpty &&
          widget.model.baseEditEnum != BaseEditEnum.goruntule) {
        viewModel.changeIsLastPage(true);
      } else {
        viewModel.changeIsLastPage(false);
      }
    });

    if (widget.model.model is BaseSiparisEditModel) {
      model = BaseEditModel<SiparisEditRequestModel>()..model = SiparisEditRequestModel.fromSiparislerModel(widget.model.model as BaseSiparisEditModel);
      model.baseEditEnum = widget.model.baseEditEnum;
      model.editTipiEnum = widget.model.editTipiEnum ?? (StaticVariables.instance.isMusteriSiparisleri ? EditTipiEnum.musteri : EditTipiEnum.satici);
    } else if (widget.model.model is SiparisEditRequestModel) {
      model = widget.model as BaseEditModel<SiparisEditRequestModel>;
    } else {
      model = BaseEditModel<SiparisEditRequestModel>()..model = SiparisEditRequestModel();
      model.baseEditEnum = widget.model.baseEditEnum;
      model.editTipiEnum = widget.model.editTipiEnum ?? (StaticVariables.instance.isMusteriSiparisleri ? EditTipiEnum.musteri : EditTipiEnum.satici);
    }

    if (widget.model.baseEditEnum == BaseEditEnum.duzenle || widget.model.baseEditEnum == BaseEditEnum.kopyala) {
      model.model?.kayitModu = "S";
    } else if (widget.model.baseEditEnum == BaseEditEnum.goruntule) {
      model.model?.kayitModu = "U";
    } else {
      model.model?.kayitModu = null;
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (BaseSiparisEditModel.instance.isEmpty && widget.model.baseEditEnum != BaseEditEnum.ekle) {
        final result = await networkManager.dioPost<BaseSiparisEditModel>(path: ApiUrls.getFaturaDetay, bodyModel: BaseSiparisEditModel(), data: model.model?.toJson(), showLoading: true);
        if (result.success == true) {
          viewModel.changeFuture();
          BaseSiparisEditModel.setInstance(result.data!.first);
          BaseSiparisEditModel.instance.isNew = false;
          BaseSiparisEditModel.instance.belgeTipi ??= BaseSiparisEditModel.instance.tipi ?? 2;
          BaseSiparisEditModel.instance.kdvDahilMi ??= BaseSiparisEditModel.instance.kdvDahil == "E";
          BaseSiparisEditModel.instance.mevcutBelgeNo = BaseSiparisEditModel.instance.belgeNo;
          BaseSiparisEditModel.instance.mevcutCariKodu = BaseSiparisEditModel.instance.cariKodu;
          if (widget.model.baseEditEnum == BaseEditEnum.duzenle) {
          } else if (widget.model.baseEditEnum == BaseEditEnum.kopyala) {
            BaseSiparisEditModel.instance.tarih = DateTime.now().dateTimeWithoutTime;
            BaseSiparisEditModel.instance.isNew = true;
            BaseSiparisEditModel.instance.belgeNo = null;
            BaseSiparisEditModel.instance.belgeTuru = widget.model.editTipiEnum?.rawValue;
            BaseSiparisEditModel.instance.pickerBelgeTuru = widget.model.editTipiEnum?.rawValue;
            BaseSiparisEditModel.instance.vadeGunu = (widget.model.model as BaseSiparisEditModel).vadeGunu;
            BaseSiparisEditModel.instance.vadeTarihi = (widget.model.model as BaseSiparisEditModel).vadeTarihi;
          }
        }
      } else if (widget.model.baseEditEnum == BaseEditEnum.ekle) {
        BaseSiparisEditModel.resetInstance();
        BaseSiparisEditModel.instance.tarih = DateTime.now().dateTimeWithoutTime;
        if (widget.model.model is BaseSiparisEditModel) {
          BaseSiparisEditModel.instance.cariAdi = widget.model.model?.cariAdi;
          BaseSiparisEditModel.instance.cariKodu = widget.model.model?.cariKodu;
        }
        BaseSiparisEditModel.instance.isNew = true;
        final CariListesiModel? cariModel;
        if (widget.model.model?.cariKodu == null) {
          final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
          if (result is CariListesiModel) {
            cariModel = result;
          } else {
            cariModel = null;
          }
        } else {
          cariModel = await networkManager.getCariModel(CariRequestModel.fromBaseSiparisEditModel(BaseSiparisEditModel.instance));
        }
        if (cariModel is CariListesiModel) {
          viewModel.changeIsBaseSiparisEmpty(true);
          BaseSiparisEditModel.instance.tag = "FaturaModel";
          BaseSiparisEditModel.instance.vadeGunu = cariModel.vadeGunu;
          BaseSiparisEditModel.instance.vadeTarihi = DateTime.now().add(Duration(days: cariModel.vadeGunu ?? 0)).dateTimeWithoutTime;
          BaseSiparisEditModel.instance.siparisTipi = model.editTipiEnum;
          BaseSiparisEditModel.instance.plasiyerAciklama = cariModel.plasiyerAciklama;
          BaseSiparisEditModel.instance.plasiyerKodu = cariModel.plasiyerKodu;
          BaseSiparisEditModel.instance.cariAdi = cariModel.cariAdi;
          BaseSiparisEditModel.instance.cariKodu = cariModel.cariKodu;
          BaseSiparisEditModel.instance.kosulKodu = cariModel.kosulKodu;
          BaseSiparisEditModel.instance.belgeTipi = int.tryParse(cariModel.odemeTipi ?? "0");
        }
      }

      BaseSiparisEditModel.instance.belgeTuru ??= widget.model.editTipiEnum?.rawValue;
      BaseSiparisEditModel.instance.pickerBelgeTuru ??= widget.model.editTipiEnum?.rawValue;
      viewModel.changeIsBaseSiparisEmpty(false);
    });
    super.initState();
  }

  @override
  void dispose() {
    BaseSiparisEditModel.resetInstance();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async {
          if (widget.model.baseEditEnum == BaseEditEnum.goruntule) {
            return true;
          } else {
            bool result = false;
            await dialogManager.showAreYouSureDialog(() {
              result = true;
              BaseSiparisEditModel.resetInstance();
            });
            return result;
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: AppBarTitle(
              title: widget.appBarTitle ?? widget.model.editTipiEnum?.getName ?? "Sipariş",
              subtitle: widget.model.getSubTitle ?? widget.model.model?.belgeNo,
              isSubTitleSmall: widget.isSubTitleSmall,
            ),
            // title: const Text("Sipariş Detayları"),
            actions: [
              IconButton(
                onPressed: () async {
                  final result = await bottomSheetDialogManager.showBottomSheetDialog(
                    context,
                    title: loc(context).generalStrings.options,
                    children: [
                      BottomSheetModel(
                        title: "Cari İşlemleri",
                        iconWidget: Icons.person_2_outlined,
                        onTap: () async {
                          Get.back();
                          dialogManager.showCariIslemleriGridViewDialog(await networkManager.getCariModel(CariRequestModel.fromBaseSiparisEditModel(BaseSiparisEditModel.instance)));
                        },
                      ),
                      topluIskontoBottomSheetModel(context),
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
                            children: dizaynList.map((e) => BottomSheetModel(title: e.dizaynAdi ?? "", value: e)).toList(),
                          );
                          if (result is NetFectDizaynList) {
                            Get.to(
                              () => PDFViewerView(
                                title: result.dizaynAdi ?? "Serbest Raporlar",
                                pdfData: PdfModel(
                                  dizaynId: result.id,
                                  raporOzelKod: result.ozelKod,
                                  etiketSayisi: result.kopyaSayisi,
                                  dicParams: DicParams(
                                    belgeNo: BaseSiparisEditModel.instance.belgeNo,
                                    cariKodu: BaseSiparisEditModel.instance.cariKodu,
                                    belgeTipi: model.editTipiEnum?.rawValue,
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
                          final result = await networkManager.getDovizKurlari(BaseSiparisEditModel.instance.dovizTipi);
                          if (result is DovizKurlariModel) {
                            BaseSiparisEditModel.instance.kalemList?.forEach((element) {
                              if (BaseSiparisEditModel.instance.getEditTipiEnum?.satisMi ?? false) {
                                element.dovizKuru = result.dovSatis;
                              } else {
                                element.dovizKuru = result.dovAlis;
                              }
                            });
                            viewModel.changeUpdateKalemler();
                            dialogManager.showSuccesDialog(
                              "${BaseSiparisEditModel.instance.dovizAdi} döviz kuru ${BaseSiparisEditModel.instance.getEditTipiEnum?.satisMi ?? false ? result.dovSatis : result.dovAlis} olarak güncellendi.",
                            );
                          }
                        },
                      ).yetkiKontrol(BaseSiparisEditModel.instance.dovizAdi != null),
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
                      // BottomSheetModel(title: "Barkod Tanımla", iconWidget: Icons.qr_code_outlined),
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
                    viewModel.changeUpdateKalemler();
                  }
                },
                icon: const Icon(Icons.more_vert_outlined),
              ),
              Observer(
                builder: (_) => Visibility(
                  visible: viewModel.isLastPage,
                  child: IconButton(
                    onPressed: () async {
                      dialogManager.showAreYouSureDialog(() async {
                        if (await postData()) {
                          await CacheManager.removeSiparisEditListWithUuid(BaseSiparisEditModel.instance.uuid);
                          Get.back(result: true);
                          if (viewModel.yeniKaydaHazirlaMi && widget.model.isEkle) {
                            BaseSiparisEditModel.resetInstance();
                            BaseSiparisEditModel.instance.isNew = true;
                            Get.toNamed("/mainPage/siparisEdit", arguments: BaseEditModel<SiparisEditRequestModel>(baseEditEnum: BaseEditEnum.ekle, editTipiEnum: model.editTipiEnum));
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
                Tab(child: Text(loc(context).generalStrings.general)),
                if (yetkiController.siparisDigerSekmesiGoster) Tab(child: Text(loc(context).generalStrings.other)),
                const Tab(child: Text("Kalemler")),
                const Tab(child: Text("Toplamlar")),
              ].whereType<Widget>().toList(),
            ),
          ),
          body: Observer(
            builder: (_) => TabBarView(
              controller: tabController,
              physics: viewModel.isValid ? null : const NeverScrollableScrollPhysics(),
              children: [
                Observer(
                  builder: (_) {
                    if (viewModel.isBaseSiparisEmpty) {
                      return const Center(child: CircularProgressIndicator.adaptive());
                    } else {
                      return BaseSiparislerGenelView(model: model);
                    }
                  },
                ),
                if (yetkiController.siparisDigerSekmesiGoster) BaseSiparislerDigerView(model: model),
                BaseSiparisKalemlerView(model: model),
                BaseSiparisToplamlarView(model: model),
              ].whereType<Widget>().toList(),
            ),
          ),
        ),
      );

  BottomSheetModel topluIskontoBottomSheetModel(BuildContext context) => BottomSheetModel(
        title: "Toplu İskonto Girişi",
        iconWidget: Icons.add_outlined,
        onTap: viewModel.baseSiparisEditModel.kalemList.ext.isNullOrEmpty
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
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(theme.colorScheme.onSurface.withOpacity(0.1))),
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
    if (result.success == true) {
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
    if (result.success == true) {
      dialogManager.showSuccessSnackBar("Kayıt Başarılı");
      return true;
    } else {
      return false;
    }
  }
}
