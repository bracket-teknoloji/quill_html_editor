import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/base/view/yapilandirma_rehberi/model/yapilandirma_rehberi_model.dart";
import "../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../core/init/cache/cache_manager.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../../../../model/param_model.dart";
import "../../stok_liste/model/stok_listesi_model.dart";
import "../view_model/stok_yazdir_view_model.dart";

class StokYazdirView extends StatefulWidget {
  final StokListesiModel? model;
  const StokYazdirView({super.key, this.model});

  @override
  State<StokYazdirView> createState() => _StokYazdirViewState();
}

class _StokYazdirViewState extends BaseState<StokYazdirView> {
  StokYazdirViewModel viewModel = StokYazdirViewModel();
  late final TextEditingController stokController;
  late final TextEditingController yapilandirmaKoduController;
  late final TextEditingController dizaynController;
  late final TextEditingController yaziciController;
  late final TextEditingController miktarBakiyeController;
  late final TextEditingController kopyaSayisiController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    viewModel.init();
    if (widget.model != null) {
      viewModel.setStokKodu(widget.model);
      stokController = TextEditingController(text: widget.model?.stokAdi);
    } else {
      stokController = TextEditingController(text: viewModel.printModel.dicParams?.stokKodu);
    }
    yapilandirmaKoduController = TextEditingController();
    dizaynController = TextEditingController(text: viewModel.printModel.dizaynId.toStringIfNotNull ?? "");
    yaziciController = TextEditingController(text: viewModel.printModel.yaziciAdi);
    miktarBakiyeController = TextEditingController(text: viewModel.printModel.dicParams?.miktar.toStringIfNotNull ?? "");
    kopyaSayisiController = TextEditingController(text: viewModel.printModel.etiketSayisi.toStringIfNotNull ?? "");
    viewModel.changeStokSecildigindeYazdir(CacheManager.getProfilParametre.stokYazdirDizaynVeYaziciHatirla);
    if (viewModel.stokSecildigindeYazdir) {
      viewModel.changeYaziciVeDizayniHatirla(true);
      viewModel.setDizaynId(CacheManager.getProfilParametre.netFectDizaynList?.id);
      viewModel.setYaziciAdi(CacheManager.getProfilParametre.yaziciList?.yaziciAdi);
      dizaynController.text = CacheManager.getProfilParametre.netFectDizaynList?.dizaynAdi ?? "";
      yaziciController.text = CacheManager.getProfilParametre.yaziciList?.aciklama ?? CacheManager.getProfilParametre.yaziciList?.yaziciAdi ?? "";
    }

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (viewModel.printModel.dizaynId == null) await setDizayn();
      if (viewModel.printModel.dizaynId != null && viewModel.printModel.yaziciAdi == null) {
        await setYazici();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    stokController.dispose();
    yapilandirmaKoduController.dispose();
    dizaynController.dispose();
    yaziciController.dispose();
    miktarBakiyeController.dispose();
    kopyaSayisiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(loc(context).generalStrings.print),
          actions: [
            IconButton(
              icon: const Icon(Icons.print_outlined),
              onPressed: () async => postPrint(),
            ),
          ],
        ),
        body: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextField(
                labelText: "Stok",
                controller: stokController,
                readOnly: true,
                isMust: true,
                suffixMore: true,
                onSubmitted: getStok,
                valueWidget: Observer(builder: (_) => Text(viewModel.printModel.dicParams?.stokKodu ?? "")),
                onTap: () async {
                  var result = await Get.toNamed("/mainPage/stokListesi", arguments: true);
                  if (result is StokListesiModel) {
                    result = await getStok(result.stokKodu);
                    viewModel.setStokKodu(result);
                    stokController.text = result.stokKodu.toString();
                    if (parametreModel.esnekYapilandir == true && result.yapilandirmaAktif != null) {
                      final stokYapilandirmaKodu = await Get.toNamed("/mainPage/yapilandirmaRehberi", arguments: result);
                      if (stokYapilandirmaKodu is YapilandirmaRehberiModel) {
                        viewModel.setYapilandirmaKodu(stokYapilandirmaKodu.yapkod);
                        yapilandirmaKoduController.text = stokYapilandirmaKodu.yapacik ?? "";
                      }
                    }
                    stokController.text = result.stokAdi.toString();
                    viewModel.setStokKodu(result);
                    if (viewModel.stokSecildigindeYazdir) {
                      postPrint();
                    }
                  }
                },
                suffix: IconButton(
                  icon: const Icon(Icons.qr_code_scanner),
                  onPressed: () async {
                    final result = await Get.toNamed("/qr");
                    if (result != null) {
                      // barkodKontroller.text = result.toString();
                    }
                  },
                ),
              ),
              Observer(
                builder: (_) => Visibility(
                  visible: viewModel.stokListesiModel != null && viewModel.showYapilandirma,
                  child: CustomTextField(
                    labelText: "Yapılandırma Kodu",
                    controller: yapilandirmaKoduController,
                    readOnly: true,
                    suffixMore: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.printModel.dicParams?.yapkod ?? "")),
                    onTap: () async {
                      final result = await Get.toNamed("/mainPage/yapilandirmaRehberi", arguments: viewModel.stokListesiModel);
                      if (result is YapilandirmaRehberiModel) {
                        viewModel.setYapilandirmaKodu(result.yapkod);
                        yapilandirmaKoduController.text = result.yapacik ?? "";
                      }
                    },
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: "Dizayn",
                      controller: dizaynController,
                      readOnly: true,
                      isMust: true,
                      suffixMore: true,
                      valueWidget: Observer(builder: (_) => Text(viewModel.printModel.dizaynId.toStringIfNotNull ?? "")),
                      onTap: () async => setDizayn(),
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      labelText: "Yazıcı",
                      controller: yaziciController,
                      readOnly: true,
                      isMust: true,
                      suffixMore: true,
                      onTap: () async => setYazici(),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: "Miktar/Bakiye",
                      controller: miktarBakiyeController,
                      suffix: Wrap(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              viewModel.decreaseMiktar();
                              miktarBakiyeController.text = viewModel.printModel.dicParams?.miktar.toStringIfNotNull ?? "";
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              viewModel.increaseMiktar();
                              miktarBakiyeController.text = viewModel.printModel.dicParams?.miktar.toStringIfNotNull ?? "";
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      labelText: "Kopya Sayısı",
                      controller: kopyaSayisiController,
                      isMust: true,
                      suffix: Wrap(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {
                              viewModel.decreaseKopyaSayisi();
                              kopyaSayisiController.text = viewModel.printModel.etiketSayisi.toStringIfNotNull ?? "";
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {
                              viewModel.increaseKopyaSayisi();
                              kopyaSayisiController.text = viewModel.printModel.etiketSayisi.toStringIfNotNull ?? "";
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomWidgetWithLabel(
                      isVertical: true,
                      text: "Stok Seçildiğinde Yazdır",
                      child: Observer(builder: (_) => Switch(value: viewModel.stokSecildigindeYazdir, onChanged: (value) => viewModel.changeStokSecildigindeYazdir(value))),
                    ).paddingAll(UIHelper.lowSize),
                  ),
                  Expanded(
                    child: CustomWidgetWithLabel(
                      isVertical: true,
                      text: "Yazıcı ve Dizaynı Hatırla",
                      child: Observer(
                        builder: (_) => Switch(
                          value: viewModel.yaziciVeDizayniHatirla,
                          onChanged: (value) {
                            viewModel.changeYaziciVeDizayniHatirla(value);
                            if (value) {
                              CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(stokYazdirDizaynVeYaziciHatirla: true));
                            } else {
                              CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(stokYazdirDizaynVeYaziciHatirla: false, yaziciList: null, netFectDizaynList: null));
                            }
                          },
                        ),
                      ),
                    ).paddingAll(UIHelper.lowSize),
                  ),
                ],
              ),
            ],
          ).paddingAll(UIHelper.lowSize),
        ),
      );

  Future<void> setDizayn() async {
    final List<NetFectDizaynList>? dizaynList = parametreModel.netFectDizaynList
        ?.where((element) => element.ozelKod == "StokEtiket" && (profilYetkiModel.yazdirmaDizaynStokEtiketi?.any((element2) => element.id == element2) ?? true))
        .toList();
    final result = await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: "Dizayn",
      children: List.generate(
        dizaynList?.length ?? 0,
        (index) => BottomSheetModel(title: dizaynList?[index].dizaynAdi ?? "", value: dizaynList?[index], description: dizaynList?[index].id.toStringIfNotNull ?? ""),
      ),
    );
    if (result is NetFectDizaynList) {
      dizaynController.text = result.dizaynAdi ?? "";
      viewModel.setDizaynId(result.id);
      if (viewModel.yaziciVeDizayniHatirla) {
        CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(netFectDizaynList: result));
      } else {
        CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(netFectDizaynList: null));
      }
    } else {
      return;
    }
  }

  Future<void> setYazici() async {
    final List<YaziciList>? yaziciList =
        parametreModel.yaziciList?.where((element) => profilYetkiModel.yazdirmaStokEtiketiYazicilari?.any((element2) => element2 == element.yaziciAdi) ?? true).toList();
    final result = await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: "Yazıcı",
      children: List.generate(
        yaziciList?.length ?? 0,
        (index) => BottomSheetModel(
          title: yaziciList?[index].aciklama ?? yaziciList?[index].yaziciAdi ?? "",
          value: yaziciList?[index],
          description: yaziciList?[index].aciklama != null ? (yaziciList?[index].yaziciAdi ?? "") : null,
        ),
      ),
    );
    if (result is YaziciList) {
      yaziciController.text = result.aciklama ?? result.yaziciAdi ?? "";
      viewModel.setYaziciAdi(result.yaziciAdi);
      if (viewModel.yaziciVeDizayniHatirla) {
        CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(yaziciList: result));
      } else {
        CacheManager.setProfilParametre(CacheManager.getProfilParametre.copyWith(yaziciList: null));
      }
    } else {
      return;
    }
  }

  Future<void> postPrint() async {
    if (formKey.currentState?.validate() ?? false) {
      final result = await networkManager.postPrint(context, model: viewModel.printModel);
      if (result.success == true) {}
    }
  }

  Future<StokListesiModel?> getStok(String? stokKodu) async {
    final result = await networkManager.dioPost<StokListesiModel>(
      path: ApiUrls.getStoklar,
      bodyModel: StokListesiModel(),
      data: {"StokKodu": stokKodu, "EkranTipi": "D", "Okutuldu": true, "MenuKodu": "STOK_ETIK"},
      showLoading: true,
    );
    if (result.data != null) {
      final List<StokListesiModel> list = result.data.map((e) => e as StokListesiModel).toList().cast<StokListesiModel>();
      return list.firstWhereOrNull((element) => element.stokKodu == stokKodu);
    }
    return null;
  }
}
