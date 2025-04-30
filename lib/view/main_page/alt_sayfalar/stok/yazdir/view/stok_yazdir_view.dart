import "dart:convert";

import "package:flutter/foundation.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/init/bluetooth/sewoo_printer.dart";
import "package:picker/core/init/dependency_injection/di_manager.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_bottom_sheet_model.dart";

import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/base/view/pdf_viewer/model/pdf_viewer_model.dart";
import "../../../../../../core/base/view/pdf_viewer/view/pdf_viewer_view.dart";
import "../../../../../../core/base/view/yapilandirma_rehberi/model/yapilandirma_rehberi_model.dart";
import "../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../core/init/cache/cache_manager.dart";
import "../../../../../../core/init/network/login/api_urls.dart";
import "../../../../model/param_model.dart";
import "../../../hucre_takibi/hucre_listesi/model/hucre_listesi_model.dart";
import "../../stok_liste/model/stok_listesi_model.dart";
import "../view_model/stok_yazdir_view_model.dart";

final class StokYazdirView extends StatefulWidget {
  const StokYazdirView({super.key, this.model, this.hucreModel});
  final StokListesiModel? model;
  final HucreListesiModel? hucreModel;

  @override
  State<StokYazdirView> createState() => _StokYazdirViewState();
}

final class _StokYazdirViewState extends BaseState<StokYazdirView> {
  final StokYazdirViewModel viewModel = StokYazdirViewModel();
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
    if (widget.hucreModel != null) {
      viewModel.setHucreKodu(widget.hucreModel?.hucreKodu);
    }
    if (widget.model != null) {
      viewModel.setStokKodu(widget.model);
      stokController = TextEditingController(text: widget.model?.stokKodu);
    } else {
      stokController = TextEditingController(text: viewModel.printModel.dicParams?.stokKodu);
    }
    yapilandirmaKoduController = TextEditingController();
    dizaynController = TextEditingController(text: viewModel.printModel.dizaynId.toStringIfNotNull ?? "");
    yaziciController = TextEditingController(text: viewModel.printModel.yaziciAdi);
    miktarBakiyeController = TextEditingController(
      text: viewModel.printModel.dicParams?.miktar.toStringIfNotNull ?? "",
    );
    kopyaSayisiController = TextEditingController(text: viewModel.printModel.etiketSayisi.toStringIfNotNull ?? "");
    viewModel
      ..changeYaziciVeDizayniHatirla(CacheManager.getProfilParametre.stokYazdirDizaynVeYaziciHatirla)
      ..changeStokSecildigindeYazdir(CacheManager.getProfilParametre.stokSecildigindeYazdir);
    if (viewModel.yaziciVeDizayniHatirla) {
      viewModel
        ..setDizaynId(CacheManager.getProfilParametre.netFectDizaynList?.id)
        ..setYaziciAdi(CacheManager.getProfilParametre.yaziciList?.yaziciAdi);
      dizaynController.text = CacheManager.getProfilParametre.netFectDizaynList?.dizaynAdi ?? "";
      yaziciController.text =
          CacheManager.getProfilParametre.yaziciList?.aciklama ??
          CacheManager.getProfilParametre.yaziciList?.yaziciAdi ??
          "";
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
  Widget build(BuildContext context) => BaseScaffold(
    appBar: AppBar(
      title: AppBarTitle(title: loc.generalStrings.print),
      actions: [
        IconButton(
          icon: const Icon(Icons.picture_as_pdf_outlined),
          onPressed: () async {
            if (formKey.currentState?.validate() != true) {
              return;
            }
            // Get.back();
            Get.to(
              () => PDFViewerView(
                title: viewModel.printModel.raporOzelKod,
                pdfData: PdfModel(
                  dizaynId: viewModel.printModel.dizaynId,
                  raporOzelKod: viewModel.printModel.raporOzelKod,
                  etiketSayisi: viewModel.printModel.etiketSayisi,
                  dicParams: DicParams(stokKodu: widget.model?.stokKodu, belgeNo: ""),
                ),
              ),
            );
          },
        ),
        IconButton(icon: const Icon(Icons.print_outlined), onPressed: postPrint),
      ],
    ),
    body: Form(
      key: formKey,
      child: Column(
        children: [
          if (widget.hucreModel == null)
            CustomTextField(
              labelText: "Stok",
              controller: stokController,

              isMust: true,
              onSubmitted: getStok,
              valueWidget: Observer(builder: (_) => Text(viewModel.stokAdi ?? "")),
              suffix: Wrap(
                children: [
                  IconButton(
                    icon: const Icon(Icons.qr_code_scanner),
                    onPressed: () async {
                      final result = await Get.toNamed("/qr");
                      if (result != null) {
                        // barkodKontroller.text = result.toString();
                      }
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.more_horiz_outlined),
                    onPressed: () async {
                      final result = await Get.toNamed("/mainPage/stokListesi", arguments: true);
                      if (result is StokListesiModel) {
                        await getStok(result.stokKodu);
                      }
                    },
                  ),
                ],
              ),
            ),
          Observer(
            builder:
                (_) => Visibility(
                  visible: viewModel.stokListesiModel != null && viewModel.showYapilandirma,
                  child: CustomTextField(
                    labelText: "Yapılandırma Kodu",
                    controller: yapilandirmaKoduController,
                    readOnly: true,
                    suffixMore: true,
                    valueWidget: Observer(builder: (_) => Text(viewModel.printModel.dicParams?.yapkod ?? "")),
                    onTap: () async {
                      final result = await Get.toNamed(
                        "/mainPage/yapilandirmaRehberi",
                        arguments: viewModel.stokListesiModel,
                      );
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
              if (widget.hucreModel == null)
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
                            miktarBakiyeController.text =
                                viewModel.printModel.dicParams?.miktar.toStringIfNotNull ?? "";
                          },
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: () {
                            viewModel.increaseMiktar();
                            miktarBakiyeController.text =
                                viewModel.printModel.dicParams?.miktar.toStringIfNotNull ?? "";
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
              if (widget.model == null && widget.hucreModel == null)
                Expanded(
                  child: CustomWidgetWithLabel(
                    isVertical: true,
                    text: "Stok Seçildiğinde Yazdır",
                    child: Observer(
                      builder:
                          (_) => Switch.adaptive(
                            value: viewModel.stokSecildigindeYazdir,
                            onChanged: viewModel.changeStokSecildigindeYazdir,
                          ),
                    ),
                  ).paddingAll(UIHelper.lowSize),
                ),
              Expanded(
                child: CustomWidgetWithLabel(
                  isVertical: true,
                  text: "Yazıcı ve Dizaynı Hatırla",
                  child: Observer(
                    builder:
                        (_) => Switch.adaptive(
                          value: viewModel.yaziciVeDizayniHatirla,
                          onChanged: (value) {
                            viewModel.changeYaziciVeDizayniHatirla(value);
                            if (value) {
                              CacheManager.setProfilParametre(
                                CacheManager.getProfilParametre.copyWith(stokYazdirDizaynVeYaziciHatirla: true),
                              );
                            } else {
                              CacheManager.setProfilParametre(
                                CacheManager.getProfilParametre.copyWith(
                                  stokYazdirDizaynVeYaziciHatirla: false,
                                  yaziciList: null,
                                  netFectDizaynList: null,
                                ),
                              );
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
    final List<NetFectDizaynList>? dizaynList =
        parametreModel.netFectDizaynList
            ?.where(
              (element) =>
                  element.ozelKod == "StokEtiket" &&
                  (profilYetkiModel.yazdirmaDizaynStokEtiketi?.any((element2) => element.id == element2) ?? true),
            )
            .toList();
    final result = await bottomSheetDialogManager.showBottomSheetDialog(
      context,
      title: "Dizayn",
      children: List.generate(
        dizaynList?.length ?? 0,
        (index) => BottomSheetModel(
          title: dizaynList?[index].dizaynAdi ?? "",
          value: dizaynList?[index],
          description: dizaynList?[index].id.toStringIfNotNull ?? "",
        ),
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
    // final List<YaziciList>? yaziciList =
    //     parametreModel.yaziciList
    //         ?.where(
    //           (element) =>
    //               profilYetkiModel.yazdirmaStokEtiketiYazicilari?.any((element2) => element2 == element.yaziciAdi) ??
    //               true,
    //         )
    //         .toList();
    final result = await bottomSheetDialogManager.showYaziciBottomSheetDialog(
      context,
      viewModel.printModel.yaziciAdi,
      filter:
          (item) =>
              profilYetkiModel.yazdirmaStokEtiketiYazicilari?.any((element2) => element2 == item.yaziciAdi) ?? true,
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

  Future<void> postPrint2() async {
    if (formKey.currentState?.validate() ?? false) {
      final result = await networkManager.postPrint(
        model: viewModel.printModel.copyWith(yaziciAdi: "SW_2CCF", yazdir: null),
      );
      if (result.isSuccess) {
        final pdfModel = result.dataList.first;
        if (kDebugMode) {
          DIManager.read<SewooPrinter>().printPDF(
            base64Decode(pdfModel.byteData ?? "").buffer.asInt64List(),
            (pdfModel.reportWidth ?? 70).toInt(),
            (pdfModel.reportHeight ?? 70).toInt(),
          );
        }
        dialogManager.showSuccesDialog(result.message ?? loc.generalStrings.success);
        if (widget.model != null) {
          Get.back(result: result.isSuccess);
        }
      }
    }
  }

  Future<void> postPrint() async {
    if (formKey.currentState?.validate() ?? false) {
      final result = await networkManager.postPrint(model: viewModel.printModel);
      if (result.isSuccess) {
        dialogManager.showSuccesDialog(result.message ?? loc.generalStrings.success);
        if (widget.model != null) {
          Get.back(result: result.isSuccess);
        }
      }
    }
  }

  Future<void> getStok(String? stokKodu) async {
    StokListesiModel? stokModel;
    final result = await networkManager.dioPost<StokListesiModel>(
      path: ApiUrls.getStoklar,
      bodyModel: StokListesiModel(),
      data: {"StokKodu": stokKodu, "EkranTipi": "D", "Okutuldu": true, "MenuKodu": "STOK_ETIK"},
      showLoading: true,
    );
    if (result.isSuccess) {
      if (result.dataList.isEmpty) {
        final result = await Get.toNamed(
          "/mainPage/stokListesiOzel",
          arguments: StokBottomSheetModel(searchText: stokKodu),
        );
        if (result is StokListesiModel) {
          stokModel = result;
        }
      } else {
        stokModel = result.dataList.firstOrNull;
      }
    }
    if (stokModel != null) {
      viewModel.setStokKodu(stokModel);
      stokController.text = stokModel.stokKodu.toString();
      if (parametreModel.esnekYapilandir == true && stokModel.yapilandirmaAktif != null) {
        final stokYapilandirmaKodu = await Get.toNamed("/mainPage/yapilandirmaRehberi", arguments: stokModel);
        if (stokYapilandirmaKodu is YapilandirmaRehberiModel) {
          viewModel.setYapilandirmaKodu(stokYapilandirmaKodu.yapkod);
          yapilandirmaKoduController.text = stokYapilandirmaKodu.yapacik ?? "";
        }
      }
      stokController.text = stokModel.stokKodu.toString();
      viewModel.setStokKodu(stokModel);
      if (viewModel.stokSecildigindeYazdir) {
        postPrint();
      }
    }
  }
}
