import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../../../core/base/model/base_bottom_sheet_response_model.dart";
import "../../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../core/constants/static_variables/static_variables.dart";
import "../../../../../../../../core/init/cache/cache_manager.dart";
import "../../../../../../../../core/init/network/login/api_urls.dart";
import "../../../../../../model/main_page_model.dart";
import "../../../../cari_listesi/model/cari_detay_model.dart";
import "../../../../cari_listesi/model/cari_listesi_model.dart";
import "../../../../cari_listesi/model/cari_save_request_model.dart";
import "../../../../cari_network_manager.dart";
import "../model/ulke_model.dart";
import "../view_model/base_cari_genel_edit_view_model.dart";

class BaseEditCariGenelView extends StatefulWidget {
  final BaseEditModel? model;
  const BaseEditCariGenelView({super.key, this.model});

  @override
  State<BaseEditCariGenelView> createState() => BaseEditCariGenelViewState();
}

class BaseEditCariGenelViewState extends BaseState<BaseEditCariGenelView> {
  static BaseCariGenelEditViewModel viewModel = BaseCariGenelEditViewModel();
  MainPageModel? anaVeri = CacheManager.getAnaVeri();
  String? siradakiKod = "";
  CariListesiModel? get model => widget.model?.model;
  List? ulkeler;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  CariSaveRequestModel requestModel = CariSaveRequestModel.instance;
  FocusNode focusNode = FocusNode();
  List<CariDetayModel>? cariDetayListesi;

  @override
  void initState() {
    StaticVariables.instance.cariKartiGenelFormKey.currentState?.activate();
    if (widget.model?.baseEditEnum != BaseEditEnum.ekle && widget.model?.baseEditEnum != BaseEditEnum.kopyala) {
      getCariDetay(model?.cariKodu ?? "");
    }
    viewModel.changeModel(model);
    viewModel.changeIsSahisFirmasi(model?.sahisFirmasiMi ?? false);
    viewModel.changeIsDovizli(model?.dovizli ?? false);
    super.initState();
  }

  @override
  void deactivate() {
    StaticVariables.instance.cariKartiGenelFormKey.currentState?.deactivate();
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    siradakiKod = widget.model?.siradakiKod;
    if (model?.cariKodu == null || model?.cariKodu == "") {
      model?.cariKodu = siradakiKod;
      viewModel.changeModel(model?..cariKodu = siradakiKod);
      setState(() {});
    }
    bool enabled = widget.model?.baseEditEnum != BaseEditEnum.goruntule;
    TextEditingController kodController = TextEditingController(text: viewModel.model?.cariKodu ?? siradakiKod);
    TextEditingController cariTipiController = TextEditingController(text: viewModel.model?.cariTipAciklama);
    TextEditingController adController = TextEditingController(text: viewModel.model?.cariAdi);
    TextEditingController ulkeController = TextEditingController(text: viewModel.model?.ulkeAdi);
    TextEditingController ilController = TextEditingController(text: viewModel.model?.cariIl);
    TextEditingController ilceCOntroller = TextEditingController(text: viewModel.model?.cariIlce);
    TextEditingController postaKoduController = TextEditingController(text: viewModel.model?.postakodu);
    TextEditingController adresController = TextEditingController(text: viewModel.model?.cariAdres);
    TextEditingController telefonController = TextEditingController(text: viewModel.model?.cariTel);
    TextEditingController ePostaController = TextEditingController(text: viewModel.model?.email);
    TextEditingController webController = TextEditingController(text: viewModel.model?.web);
    TextEditingController vergiDairesiController = TextEditingController(text: viewModel.model?.vergiDairesi);
    TextEditingController vergiNoController = TextEditingController(text: viewModel.model?.vergiNumarasi);
    TextEditingController dovizController = TextEditingController(text: viewModel.model?.dovizAdi);
    TextEditingController plasiyerController = TextEditingController(text: viewModel.model?.plasiyerAciklama);
    TextEditingController vadeGunuController = TextEditingController(text: viewModel.model?.vadeGunu?.toStringIfNull ?? "");
    //! Hangi parametreyi alacak diye sor
    TextEditingController odemeGunController = TextEditingController(
        text: viewModel.model?.odemeTipi == "0"
            ? "Peşin"
            : viewModel.model?.odemeTipi == "1"
                ? "Vade"
                : viewModel.model?.odemeTipi == "2"
                    ? "Çek"
                    : viewModel.model?.odemeTipi == "3"
                        ? "Senet"
                        : "");
    return SingleChildScrollView(
      child: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: StaticVariables.instance.cariKartiGenelFormKey,
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: CustomWidgetWithLabel(
                isVertical: true,
                text: "Şahıs Firması",
                child: Observer(
                    builder: (_) => Switch.adaptive(
                        value: viewModel.isSahisFirmasi,
                        onChanged: enabled
                            ? (value) {
                                viewModel.changeIsSahisFirmasi(value);
                                model?.sahisFirmasiMi = value;
                                viewModel.changeModel(model);
                              }
                            : null)),
              ),
            ),
            Observer(builder: (_) {
              return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Expanded(
                    child: CustomTextField(
                  enabled: enabled && (widget.model?.baseEditEnum == BaseEditEnum.ekle || widget.model?.baseEditEnum == BaseEditEnum.kopyala),
                  readOnly: widget.model?.baseEditEnum != BaseEditEnum.ekle && widget.model?.baseEditEnum != BaseEditEnum.kopyala,
                  isMust: true,
                  labelText: "Kodu",
                  controller: kodController,
                  suffix: Wrap(
                    children: [
                      IconButton(
                          onPressed: () async {
                            var result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
                            if (result != null && result is CariListesiModel) {
                              kodController.text = result.cariKodu ?? "";
                              model?.cariKodu = result.cariKodu ?? "";
                              viewModel.changeModel(model);
                            }
                            log(result.toString());
                          },
                          icon: const Icon(Icons.more_horiz_outlined)),
                      IconButton(
                          onPressed: () async {
                            String kod = await CariNetworkManager.getSiradakiKod(kod: kodController.text);
                            kodController.text = kod;
                            model?.cariKodu = kod;
                            viewModel.changeModel(model);
                          },
                          icon: const Icon(Icons.format_list_numbered_rtl_outlined))
                    ].map((e) => SizedBox(width: 35, child: e)).toList(),
                  ),
                )),
                Expanded(child: Observer(builder: (_) {
                  return CustomTextField(
                    enabled: enabled,
                    isMust: true,
                    labelText: "Cari Tipi",
                    valueText: viewModel.model?.cariTip,
                    readOnly: true,
                    controller: cariTipiController,
                    onTap: () async {
                      var result = await bottomSheetDialogManager.showBottomSheetDialog(context, title: "Cari Tipi", children: [
                        BottomSheetModel(title: "Alıcı", value: "A", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Alıcı", value: "A"))),
                        BottomSheetModel(title: "Satıcı", value: "S", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Satıcı", value: "S"))),
                        BottomSheetModel(title: "Toptancı", value: "T", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Toptancı", value: "T"))),
                        BottomSheetModel(title: "Kefil", value: "K", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Kefil", value: "K"))),
                        BottomSheetModel(title: "Müstahsil", value: "M", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Müstahsil", value: "M"))),
                        BottomSheetModel(title: "Diğer", value: "D", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Diğer", value: "D"))),
                        BottomSheetModel(title: "Komisyoncu", value: "I", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Komisyoncu", value: "I"))),
                      ]);
                      if (result != null) {
                        cariTipiController.text = result.title;
                        model?.cariTip = result.value;
                        model?.cariTipAciklama = result.title;
                        viewModel.changeModel(model
                          ?..cariTip = result.value
                          ..cariTipAciklama = result.title);
                        setState(() {});
                      }
                    },
                    suffix: const Icon(Icons.more_horiz_outlined),
                  );
                }))
              ]);
            }),
            CustomTextField(
              enabled: enabled,
              labelText: "Adı",
              controller: adController,
              isMust: true,
              onChanged: (p0) {
                viewModel.changeModel(model?..cariAdi = p0);
              },
            ),
            Observer(builder: (_) {
              return CustomTextField(
                  enabled: enabled,
                  labelText: "Ülke",
                  readOnly: true,
                  valueText: model?.ulkeKodu,
                  controller: ulkeController,
                  onTap: () async {
                    ulkeler ??= await getUlkeData();
                    if (mounted) {
                      BaseBottomSheetResponseModel? result = await bottomSheetDialogManager.showRadioBottomSheetDialog(context,
                          title: "Ülkeler",
                          children: List.generate(
                              ulkeler!.length,
                              (index) => BottomSheetModel(
                                  title: ulkeler?[index].ulkeAdi!,
                                  value: ulkeler?[index].ulkeKodu,
                                  description: ulkeler?[index].ulkeKodu,
                                  onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: ulkeler?[index].ulkeAdi, value: ulkeler?[index].ulkeKodu)))));
                      if (result != null) {
                        viewModel.changeModel(model
                          ?..ulkeAdi = result.title
                          ..ulkeKodu = result.value);
                        ulkeController.text = result.title ?? "";
                        setState(() {});
                      }
                    }
                  },
                  suffix: Observer(
                    builder: (_) => viewModel.model?.ulkeAdi == null
                        ? const Icon(Icons.more_horiz_outlined)
                        : IconButton(
                            icon: const Icon(Icons.clear_outlined),
                            onPressed: () {
                              viewModel.changeModel(model
                                ?..ulkeAdi = null
                                ..ulkeKodu = null);
                            }),
                  ));
            }),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                  child: CustomTextField(
                enabled: enabled,
                labelText: "İl",
                controller: ilController,
                onChanged: (p0) {
                  viewModel.changeModel(model?..cariIl = p0);
                },
              )),
              Expanded(
                  child: CustomTextField(
                enabled: enabled,
                labelText: "İlçe",
                controller: ilceCOntroller,
                onChanged: (p0) {
                  viewModel.changeModel(model?..cariIlce = p0);
                },
              )),
            ]),
            CustomTextField(
              enabled: enabled,
              labelText: "Posta Kodu",
              controller: postaKoduController,
              onChanged: (p0) {
                viewModel.changeModel(model?..postakodu = p0);
              },
            ),
            CustomTextField(
              enabled: enabled,
              labelText: "Adres",
              controller: adresController,
              onChanged: (p0) {
                viewModel.changeModel(model?..cariAdres = p0);
              },
            ),
            CustomTextField(
              enabled: enabled,
              labelText: "Telefon",
              controller: telefonController,
              onChanged: (p0) {
                viewModel.changeModel(model?..cariTel = p0);
              },
            ),
            CustomTextField(
              enabled: enabled,
              labelText: "E-Posta",
              controller: ePostaController,
              onChanged: (p0) {
                viewModel.changeModel(model?..email = p0);
              },
            ),
            CustomTextField(
              enabled: enabled,
              labelText: "Web",
              controller: webController,
              onChanged: (p0) {
                viewModel.changeModel(model?..web = p0);
              },
            ),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                  child: CustomTextField(
                enabled: enabled,
                labelText: "Vergi Dairesi",
                controller: vergiDairesiController,
                onChanged: (p0) {
                  viewModel.changeModel(model?..vergiDairesi = p0);
                },
              )),
              Expanded(
                  child: CustomTextField(
                enabled: enabled,
                labelText: "Vergi No",
                controller: vergiNoController,
                onChanged: (p0) {
                  viewModel.changeModel(model?..vergiNumarasi = p0);
                },
              ))
            ]),
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                  child: CustomTextField(
                      enabled: enabled,
                      labelText: "Plasiyer",
                      readOnly: true,
                      valueText: model?.plasiyerKodu,
                      controller: plasiyerController,
                      onTap: () {
                        bottomSheetDialogManager.showBottomSheetDialog(context,
                            title: "PLasiyer",
                            children: List.generate(
                                anaVeri?.paramModel?.plasiyerList?.length ?? 0,
                                (index) => BottomSheetModel(
                                    title: anaVeri?.paramModel?.plasiyerList?[index].plasiyerAciklama ?? "",
                                    value: anaVeri?.paramModel?.plasiyerList?[index].plasiyerKodu ?? "",
                                    onTap: () {
                                      viewModel.changeModel(model
                                        ?..plasiyerKodu = anaVeri?.paramModel?.plasiyerList?[index].plasiyerKodu
                                        ..plasiyerAciklama = anaVeri?.paramModel?.plasiyerList?[index].plasiyerAciklama);
                                      setState(() {});
                                      Get.back();
                                    })));
                        setState(() {});
                      },
                      suffix: Observer(
                          builder: (_) => viewModel.model?.plasiyerAciklama == null
                              ? const Icon(Icons.more_horiz_outlined)
                              : IconButton(
                                  icon: const Icon(Icons.clear_outlined),
                                  onPressed: () => viewModel.changeModel(model
                                    ?..plasiyerAciklama = null
                                    ..plasiyerKodu = null))))),
              Expanded(
                  child: CustomWidgetWithLabel(
                      isVertical: true,
                      text: "Dövizli",
                      child: Observer(
                          builder: (_) => Switch.adaptive(
                              value: viewModel.isDovizli,
                              onChanged: enabled
                                  ? (value) {
                                      viewModel.changeIsDovizli(value);
                                      model?.dovizli = value;
                                      viewModel.changeModel(model);
                                    }
                                  : null))))
            ]),
            Observer(
                builder: (_) => Visibility(
                    visible: viewModel.isDovizli,
                    child: CustomTextField(
                      enabled: enabled,
                      labelText: "Döviz Tipi",
                      valueText: model?.dovizKodu == null ? "" : model?.dovizKodu.toString(),
                      controller: dovizController,
                      readOnly: true,
                      suffix: IconButton(
                          onPressed: () async {
                            var dovizList = anaVeri?.paramModel?.dovizList;
                            await bottomSheetDialogManager.showBottomSheetDialog(context,
                                title: "Döviz Tipi",
                                children: List.generate(
                                    dovizList!.length,
                                    (index) => BottomSheetModel(
                                        title: dovizList[index].isim!,
                                        value: dovizList[index].dovizKodu.toString(),
                                        onTap: () {
                                          dovizController.text = dovizList[index].isim!;
                                          model?.dovizAdi = dovizList[index].isim;
                                          model?.dovizKodu = dovizList[index].dovizKodu;
                                          viewModel.changeModel(model);
                                          Get.back();
                                        })));
                          },
                          icon: const Icon(Icons.more_horiz_outlined)),
                    ))),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: CustomTextField(
                  enabled: enabled,
                  labelText: "Vade Günü",
                  valueText: model?.dovizKodu?.toStringIfNull,
                  controller: vadeGunuController,
                  onChanged: (p0) {
                    vadeGunuController.text = p0;
                    model?.vadeGunu = int.tryParse(p0);
                    viewModel.changeModel(model);
                  },
                )),
                Expanded(
                    child: CustomTextField(
                        enabled: enabled,
                        readOnly: true,
                        labelText: "Ödeme Tipi",
                        controller: odemeGunController,
                        valueText: model?.odemeTipi,
                        onTap: () async {
                          BaseBottomSheetResponseModel? result = await bottomSheetDialogManager.showRadioBottomSheetDialog(context, title: "Ödeme Tipi", children: [
                            BottomSheetModel(title: "Nakit", value: "0", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Nakit", value: "0"))),
                            BottomSheetModel(title: "Havale", value: "1", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Havale", value: "1"))),
                            BottomSheetModel(title: "Çek", value: "2", onTap: () => Get.back(result: BaseBottomSheetResponseModel(title: "Çek", value: "2"))),
                          ]);
                          if (result != null) {
                            odemeGunController.text = result.title!;
                            model?.odemeTipi = result.value;
                            viewModel.changeModel(model);
                            setState(() {});
                          }
                        },
                        suffix: Observer(
                            builder: (_) => viewModel.model?.odemeTipi == null
                                ? const Icon(Icons.more_horiz_outlined)
                                : IconButton(
                                    icon: const Icon(Icons.clear_outlined),
                                    onPressed: () {
                                      viewModel.changeModel(model?..odemeTipi = null);
                                    }))))
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<List<UlkeModel>?> getUlkeData() async {
    dialogManager.showLoadingDialog("Yükleniyor");
    var response = await networkManager.dioGet<UlkeModel>(path: ApiUrls.getUlkeler, bodyModel: UlkeModel(), addCKey: true, addSirketBilgileri: true, addTokenKey: true);
    // cast all items to UlkeModel and return
    dialogManager.hideAlertDialog;
    return response.data?.map((e) => e as UlkeModel).toList().cast<UlkeModel>();
  }

  Future<void> getCariDetay(String query) async {
    var result = await networkManager.dioGet<CariDetayModel>(
      path: ApiUrls.getCariDetay,
      bodyModel: CariDetayModel(),
      addSirketBilgileri: true,
      addCKey: true,

      // ,
      queryParameters: {"CariKodu": query},
    );
    if (result.data != null && result.data!.isNotEmpty) {
      CariDetayModel.setInstance(result.data[0]);
      cariDetayListesi = result.data.map((e) => e as CariDetayModel).toList().cast<CariDetayModel>();
    }
  }
}
