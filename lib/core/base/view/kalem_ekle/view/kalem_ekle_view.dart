import "dart:developer";

import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/model/ek_rehber_request_model.dart";
import "package:picker/core/base/view/genel_rehber/model/genel_rehber_model.dart";
import "package:picker/view/main_page/model/user_model/ek_rehberler_model.dart";
import "package:text_scroll/text_scroll.dart";

import "../../../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../../../view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_detay_model.dart";
import "../../../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "../../../../../view/main_page/alt_sayfalar/uretim/is_emirleri/is_emri_rehberi/model/is_emirleri_model.dart";
import "../../../../../view/main_page/model/param_model.dart";
import "../../../../components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../components/layout/custom_layout_builder.dart";
import "../../../../components/textfield/custom_text_field.dart";
import "../../../../components/wrap/appbar_title.dart";
import "../../../../constants/enum/edit_tipi_enum.dart";
import "../../../../constants/extensions/date_time_extensions.dart";
import "../../../../constants/extensions/iterable_extensions.dart";
import "../../../../constants/extensions/number_extensions.dart";
import "../../../../constants/extensions/widget_extensions.dart";
import "../../../../constants/ondalik_utils.dart";
import "../../../../constants/ui_helper/ui_helper.dart";
import "../../../../init/network/login/api_urls.dart";
import "../../../model/doviz_kurlari_model.dart";
import "../../../state/base_state.dart";
import "../../masraf_kodu/model/masraf_kodu_rehberi_model.dart";
import "../../stok_rehberi/model/stok_rehberi_request_model.dart";
import "../../yapilandirma_rehberi/model/yapilandirma_rehberi_model.dart";
import "../view_model/kalem_ekle_view_model.dart";

final class KalemEkleView extends StatefulWidget {
  const KalemEkleView({super.key, this.stokListesiModel, this.kalemModel});
  final StokListesiModel? stokListesiModel;
  final KalemModel? kalemModel;

  @override
  State<KalemEkleView> createState() => _KalemEkleViewState();
}

final class _KalemEkleViewState extends BaseState<KalemEkleView> {
  final KalemEkleViewModel viewModel = KalemEkleViewModel();
  BaseSiparisEditModel get model => BaseSiparisEditModel.instance;
  StokListesiModel? get stokListesiModel => widget.stokListesiModel;
  EditTipiEnum? get editTipi => model.getEditTipiEnum;
  bool get satisMi => editTipi?.satisMi ?? false;
  bool get transferMi => editTipi?.transferMi ?? false;
  late final TextEditingController kalemAdiController;
  late final TextEditingController ekAlan1Controller;
  late final TextEditingController ekAlan2Controller;
  late final TextEditingController yapKodController;
  late final TextEditingController isEmriController;
  late final TextEditingController teslimTarihiController;
  late final TextEditingController kosulController;
  late final TextEditingController depoController;
  late final TextEditingController projeController;
  late final TextEditingController dovizTipiController;
  late final TextEditingController dovizKuruController;
  late final TextEditingController dovizFiyatiController;
  late final TextEditingController miktarController;
  late final TextEditingController miktar2Controller;
  late final TextEditingController malFazMiktarController;
  late final TextEditingController olcuBirimiController;
  late final TextEditingController kdvOraniController;
  late final TextEditingController fiyatController;
  late final TextEditingController muhKoduController;
  late final TextEditingController muhRefKoduController;
  late final TextEditingController serilerController;
  late final TextEditingController aciklama1Controller;
  late final TextEditingController aciklama2Controller;
  late final TextEditingController aciklama3Controller;
  late final TextEditingController aciklama4Controller;
  late final TextEditingController aciklama5Controller;
  late final TextEditingController aciklama6Controller;
  late final TextEditingController aciklama7Controller;
  late final TextEditingController aciklama8Controller;
  late final TextEditingController aciklama9Controller;
  late final TextEditingController aciklama10Controller;
  TextEditingController? isk1Controller;
  TextEditingController? isk1TipiController;
  TextEditingController? isk2TipiController;
  TextEditingController? isk2YuzdeController;
  TextEditingController? isk3TipiController;
  TextEditingController? isk3YuzdeController;
  TextEditingController? isk4TipiController;
  TextEditingController? isk4YuzdeController;
  TextEditingController? isk5TipiController;
  TextEditingController? isk5YuzdeController;
  TextEditingController? isk6TipiController;
  TextEditingController? isk6YuzdeController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    initControllers();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await getData();

      viewModel.setIskonto1OranMi(widget.kalemModel?.iskonto1OranMi ?? true);
      await controllerFiller();
    });

    super.initState();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BaseScaffold(
        appBar: appBar(),
        floatingActionButton: fab(),
        body: body(context),
      );

  AppBar appBar() => AppBar(
        title: Observer(
          builder: (_) => AppBarTitle(
            title: "Kalem Ekle",
            subtitle: viewModel.model?.stokAdi ?? "",
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await bottomSheetDialogManager.showBottomSheetDialog(
                context,
                title: loc.generalStrings.options,
                children: [
                  BottomSheetModel(
                    title: "Döviz Kurları",
                    iconWidget: Icons.money_outlined,
                    onTap: () => Get.toNamed("/dovizKurlari"),
                  ),
                ],
              );
            },
            icon: const Icon(Icons.more_vert_outlined),
          ),
          IconButton(
            onPressed: () {
              if (viewModel.model?.seriMiktarKadarSor == true && viewModel.kalemModel.miktar != viewModel.kalemModel.seriList?.length && seriliMi) {
                dialogManager.showErrorSnackBar(
                  "Girdiğiniz miktar (${viewModel.kalemModel.miktar.toIntIfDouble ?? 0}) ve seri miktarı (${viewModel.kalemModel.seriList?.length ?? 0})",
                );
                return;
              }
              if (viewModel.kalemModel.miktar != viewModel.kalemModel.seriList?.map((e) => e.miktar).sum && seriliMi) {
                dialogManager.showErrorSnackBar(
                  "Girdiğiniz miktar (${viewModel.kalemModel.miktar.toIntIfDouble ?? 0}) ve serilerin miktar toplamı (${viewModel.kalemModel.seriList?.map((e) => e.miktar).sum.toIntIfDouble ?? 0})",
                );
                return;
              }
              if (transferMi) {
                if (model.girisDepoKodu == (model.cikisDepoKodu ?? viewModel.model?.depoKodu)) {
                  dialogManager.showAlertDialog("Giriş ve Çıkış depo kodu aynı olamaz.");
                }
              }
              if (formKey.currentState?.validate() ?? false) {
                viewModel.kalemModel.otvHesapla();
                if (!yetkiController.lokalDepoUygulamasiAcikMi) {
                  viewModel.kalemModel.depoKodu = 0;
                }
                if (!viewModel.dovizliMi) {
                  viewModel.kalemModel.dovizKuru = null;
                  viewModel.kalemModel.dovizliFiyat = null;
                } else {
                  model.dovizListesi = model.dovizListesi?..[viewModel.kalemModel.dovizKodu ?? 0] = viewModel.kalemModel.dovizKuru ?? 0;
                }
                // viewModel.kalemModel.brutTutar = viewModel.;
                viewModel.kalemModel.kalemList?.map((e) => e.miktar = viewModel.kalemModel.miktar2).toList();
                model.kalemList ??= [];
                // if (widget.kalemModel != null) {
                //   Get.back(result: viewModel.kalemModel);
                // }
                viewModel.kalemModel.sira = widget.kalemModel?.sira ?? (model.kalemList?.length ?? 0) + 1;
                if (viewModel.kalemModel.olcuBirimCarpani != null) {
                  viewModel.kalemModel.stokOlcuBirimi = viewModel.model?.olcuBirimi;
                  final olcuBirimi = ((viewModel.kalemModel.olcuBirimCarpani == 0 || viewModel.kalemModel.olcuBirimCarpani == null) ? 1 : viewModel.kalemModel.olcuBirimCarpani!);
                  viewModel.kalemModel.gercekMiktar = (viewModel.kalemModel.miktar ?? 0) / olcuBirimi;
                }
                log(viewModel.kalemModel.dovizliFiyat.toString());
                if (widget.kalemModel != null) {
                  Get.back(
                    result: viewModel.kalemModel..paketMi = viewModel.model?.paketMi ?? (viewModel.koliMi ? "K" : null),
                  );
                  dialogManager.showSuccessSnackBar("Kalem düzenlendi.");
                } else {
                  model.kalemList?.add(
                    viewModel.kalemModel..paketMi = viewModel.model?.paketMi,
                  );
                  Get.back(
                    result: viewModel.kalemModel..paketMi = viewModel.model?.paketMi,
                  );
                  dialogManager.showSuccessSnackBar("Kalem eklendi.");
                }
                // if (model.kalemList?.any((element) => element.stokKodu == viewModel.kalemModel.stokKodu) ?? false) {
                //   // model.kalemList?[model.kalemList?.indexWhere((element) => element.stokKodu == viewModel.kalemModel.stokKodu) ?? 0] =
                //   //     viewModel.kalemModel..paketMi = viewModel.model?.paketMi ?? (viewModel.koliMi ? "K" : null);
                // } else {
                //   model.kalemList?.add(viewModel.kalemModel..paketMi = viewModel.model?.paketMi);
                //   Get.back(result: viewModel.kalemModel..paketMi = viewModel.model?.paketMi);
                // }
              } else {
                dialogManager.showErrorSnackBar("Lütfen gerekli alanları doldurunuz.");
              }
            },
            icon: const Icon(Icons.save_outlined),
          ),
        ],
      );

  FloatingActionButton fab() => FloatingActionButton(
        onPressed: () async {
          dialogManager.showStokGridViewDialog(viewModel.model);
        },
        child: const Icon(Icons.open_in_new_outlined),
      );

  SingleChildScrollView body(BuildContext context) => SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: UIHelper.lowPadding,
            child: Column(
              children: [
                Card(
                  child: Observer(
                    builder: (_) => Padding(
                      padding: UIHelper.lowPadding,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CustomLayoutBuilder(
                            splitCount: 2,
                            children: [
                              Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(text: "Stok Kodu: "),
                                    TextSpan(
                                      text: viewModel.model?.stokKodu ?? "",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(text: "Stok Bakiye: "),
                                    TextSpan(
                                      text: "${viewModel.model?.bakiye.toIntIfDouble.toStringIfNotNull ?? "0"} ${viewModel.model?.olcuBirimi ?? viewModel.kalemModel.olcuBirimAdi ?? ""}",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (editTipi?.fiyatGor == true)
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(text: "Brüt Tutar: "),
                                      TextSpan(
                                        text:
                                            "${viewModel.kalemModel.brutTutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency ${(viewModel.showDovizBilgileri) ? '\n(${viewModel.kalemModel.getDovizBrutTutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${viewModel.kalemModel.dovizAdi ?? ""})' : ""}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (editTipi?.fiyatGor == true && !editTipi.talepTeklifMi && !transferMi)
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(text: "MF Tutarı: "),
                                      TextSpan(
                                        text:
                                            "${viewModel.kalemModel.mfTutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency ${(viewModel.showDovizBilgileri) ? '\n(${viewModel.kalemModel.dovizMfTutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${viewModel.kalemModel.dovizAdi ?? ""})' : ""}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (editTipi?.fiyatGor == true && !transferMi)
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(text: "İsk. Tutarı: "),
                                      TextSpan(
                                        text:
                                            "${viewModel.kalemModel.iskontoTutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency ${(viewModel.showDovizBilgileri) ? '\n(${viewModel.kalemModel.dovizIskontoTutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${viewModel.kalemModel.dovizAdi ?? ""})' : ""}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (editTipi?.fiyatGor == true)
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(text: "Ara Toplam: "),
                                      TextSpan(
                                        text:
                                            "${viewModel.kalemModel.getAraToplamTutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency ${(viewModel.showDovizBilgileri) ? '\n(${viewModel.kalemModel.getKdvsizDovizAraToplamTutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${viewModel.kalemModel.dovizAdi ?? ""})' : ""}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (editTipi?.fiyatGor == true && viewModel.kalemModel.otvVarmi == true && (viewModel.kalemModel.otvTutar ?? 0) > 0)
                                Observer(
                                  builder: (_) => Text.rich(
                                    TextSpan(
                                      children: [
                                        const TextSpan(text: "ÖTV Tutar: "),
                                        TextSpan(
                                          text:
                                              "${viewModel.kalemModel.otvTutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency ${(viewModel.showDovizBilgileri) ? '\n(${viewModel.kalemModel.dovizliOTVTutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${viewModel.kalemModel.dovizAdi ?? ""})' : ""}",
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              if (editTipi?.fiyatGor == true && !editTipi.talepTeklifMi && !transferMi)
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(text: "KDV Tutarı: "),
                                      TextSpan(
                                        text:
                                            "${viewModel.kalemModel.kdvTutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency ${(viewModel.showDovizBilgileri) ? '\n(${viewModel.kalemModel.dovizKdvTutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${viewModel.kalemModel.dovizAdi ?? ""})' : ""}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              if (editTipi?.fiyatGor == true)
                                Text.rich(
                                  TextSpan(
                                    children: [
                                      const TextSpan(text: "Genel Toplam: "),
                                      TextSpan(
                                        text:
                                            "${viewModel.kalemModel.genelToplamTutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency ${(viewModel.showDovizBilgileri) ? '\n(${viewModel.kalemModel.dovizGenelToplamTutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${viewModel.kalemModel.dovizAdi ?? ""})' : ""}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                            ].where((element) => element is! SizedBox).toList(),
                          ),
                          Card(
                            color: theme.colorScheme.primary.withOpacity(0.1),
                            child: Center(
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(text: "Son Fiyat: "),
                                    TextSpan(
                                      text: "0,00 $mainCurrency",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ).paddingOnly(top: UIHelper.lowSize),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                CustomTextField(
                  labelText: "Kalem Adı",
                  controller: kalemAdiController,
                  onChanged: (p0) {
                    viewModel.kalemModel.kalemAdi = p0;
                    if (kalemAdiController.text != viewModel.model?.stokAdi) {
                      if (editTipi?.ekAlan1GorunsunMu ?? false) {
                        viewModel.kalemModel
                          ..ekalan1 = p0
                          ..kalemAdiDegisti = true
                          ..kalemAdiDegistimi = true;
                        ekAlan1Controller.text = p0;
                      } else if (editTipi?.talepTeklifMi == true) {
                        viewModel.kalemModel
                          ..kalemAdiDegisti = true
                          ..kalemAdiDegistimi = true;
                      }
                    } else {
                      viewModel.kalemModel
                        ..kalemAdiDegisti = null
                        ..kalemAdiDegistimi = null;
                    }
                  },
                ),
                // Observer(
                //   builder: (_) => Row(
                //     children: [
                //       Expanded(
                //         child:
                //       ).yetkiVarMi(((viewModel.kalemModel.stokKodu?.startsWith("HIZ") ?? false) && yetkiController.siparisHizmetAktifMi) || model.faturaIrsaliyeMi),
                //     ],
                //   ),
                // ),

                //* Ambar Fişi
                if ((editTipi?.ekAlan1GorunsunMu ?? false) && model.getEditTipiEnum?.ambarFisiMi == true)
                  CustomTextField(
                    labelText: "Ek Alan 1",
                    controller: ekAlan1Controller,
                    readOnly: true,
                    suffixMore: true,
                    onTap: () async {
                      final result = await Get.toNamed(
                        "mainPage/masrafKoduRehberi",
                        arguments: model.masrafKoduTipi,
                      );
                      if (result is MasrafKoduRehberiModel) {
                        ekAlan1Controller.text = result.masrafAdi ?? "";
                        viewModel.kalemModel.ekalan1 = result.masrafKodu;
                      }
                    },
                  ),
                //* Geri Kalanlar
                if ((editTipi?.ekAlan1GorunsunMu ?? false) && !(editTipi?.gizlenecekAlanlar("ekalan1") ?? false) && model.getEditTipiEnum?.ambarFisiMi == false)
                  CustomTextField(
                    labelText: "Ek Alan 1",
                    controller: ekAlan1Controller,
                    readOnly: getEkRehberModel("EKALAN1") != null,
                    isMust: editTipi?.bosGecilmeyecekAlanlar("ekalan1") ?? false,
                    suffixMore: getEkRehberModel("EKALAN1") != null,
                    onChanged: (p0) {
                      viewModel.kalemModel.ekalan1 = p0;
                      if (viewModel.kalemModel.kalemAdiDegisti ?? false) {
                        viewModel.kalemModel.kalemAdi = p0;
                        kalemAdiController.text = p0;
                      }
                    },
                    onTap: () {
                      if (viewModel.kalemModel.kalemAdiDegistimi ?? false) {
                        dialogManager.showInfoDialog(
                          "Alan 1 açıkken Alan 1'de yapılan değişiklikler kalem adına yansıtılacaktır.",
                        );
                      }
                      getGenelRehberModel("EKALAN1");
                    },
                    valueWidget: getEkRehberModel("EKALAN1") == null
                        ? null
                        : Observer(
                            builder: (_) => Text(viewModel.kalemModel.ekalan1 ?? ""),
                          ),
                  ),
                if ((editTipi?.ekAlan2GorunsunMu ?? false) && !(editTipi?.gizlenecekAlanlar("ekalan2") ?? false))
                  CustomTextField(
                    labelText: "Ek Alan 2",
                    controller: ekAlan2Controller,
                    readOnly: getEkRehberModel("EKALAN2") != null,
                    isMust: editTipi?.bosGecilmeyecekAlanlar("ekalan2") ?? false,
                    suffixMore: getEkRehberModel("EKALAN2") != null,
                    onChanged: (p0) => viewModel.kalemModel.ekalan2 = p0,
                    onTap: () => getGenelRehberModel("EKALAN2"),
                    valueWidget: getEkRehberModel("EKALAN2") == null
                        ? null
                        : Observer(
                            builder: (_) => Text(viewModel.kalemModel.ekalan2 ?? ""),
                          ),
                  ),
                if ((parametreModel.satisSatirdaIsEmriSorulsun ?? false) &&
                    (editTipi?.satisMi ?? false) &&
                    !(editTipi?.gizlenecekAlanlar("isemri") ?? false) &&
                    (editTipi?.depoTransferiMi ?? false) &&
                    !yetkiController.transferLokalDatGizlenecekAlanlar(
                      "FATURA_BOS_GECILMESIN_ISEMR",
                    ))
                  CustomTextField(
                    labelText: "İş Emri",
                    controller: isEmriController,
                    isMust: editTipi?.bosGecilmeyecekAlanlar("isemri") ?? false,
                    enabled: !(editTipi?.degistirilmeyecekAlanlar("isemri") ?? false),
                    suffixMore: true,
                    valueWidget: Observer(
                      builder: (_) => Text(viewModel.kalemModel.isemriNo ?? ""),
                    ),
                    onTap: () async {
                      final result = await Get.toNamed("/mainPage/isEmriRehberiOzel");
                      if (result is IsEmirleriModel) {
                        isEmriController.text = result.isemriNo ?? "";
                        viewModel.setIrsaliyeNo(result.isemriNo);
                      }
                    },
                  ),
                Observer(
                  builder: (_) => Row(
                    children: [
                      if (((viewModel.model?.hizmetMi ?? false) && !(editTipi?.talepTeklifMi ?? false)) || (editTipi?.ambarFisiMi == true))
                        Expanded(
                          child: CustomTextField(
                            labelText: "Muh. Kodu",
                            suffixMore: true,
                            readOnly: true,
                            isMust: model.faturaIrsaliyeMi,
                            onClear: !model.faturaIrsaliyeMi ? () => viewModel.setMuhasebeKodu(null) : null,
                            controller: muhKoduController,
                            valueWidget: Observer(
                              builder: (_) => Text(
                                viewModel.kalemModel.muhasebeKodu ?? "",
                              ),
                            ),
                            onTap: () async {
                              final result = await bottomSheetDialogManager.showMuhasebeMuhasebeKoduBottomSheetDialog(
                                context,
                                viewModel.kalemModel.muhasebeKodu,
                                belgeTipi: editTipi?.rawValue,
                                hesapTipi: "M",
                                // groupValue: viewModel.kalemModel.muhasebeKodu,
                                // alisMi: !(editTipi?.satisMi ?? false),
                                // stokMu: false,
                                // queryParams: {},
                              );
                              if (result != null) {
                                viewModel.setMuhasebeKodu(result.hesapKodu ?? "");
                                muhKoduController.text = result.hesapAdi ?? "";
                                // if (editTipi?.satisMi ?? false) {
                                // } else {
                                //   viewModel.setMuhasebeKodu(result.alisHesabi ?? "");
                                //   muhKoduController.text = result.adi ?? result.alisHesabi ?? "";
                                // }
                              }
                            },
                          ),
                        ),
                      if (yetkiController.muhRefSorulsun(editTipi))
                        Expanded(
                          child: CustomTextField(
                            labelText: "Muh. Ref. Kodu",
                            valueWidget: Observer(
                              builder: (_) => Text(viewModel.kalemModel.yapkod ?? ""),
                            ),
                            isMust: true,
                            readOnly: true,
                            suffixMore: true,
                            controller: muhRefKoduController,
                            onTap: () async {
                              final result = await bottomSheetDialogManager.showMuhasebeReferansKoduBottomSheetDialog(
                                context,
                                viewModel.kalemModel.muhRefKodu,
                              );
                              if (result != null) {
                                muhRefKoduController.text = result.hesapAdi ?? result.hesapKodu ?? "";
                                viewModel.setMuhasebeReferansKodu(result.hesapKodu);
                              }
                            },
                          ),
                        ),
                    ],
                  ),
                ),
                if (widget.stokListesiModel?.yapkod != null || widget.kalemModel?.yapkod != null && !transferMi)
                  CustomTextField(
                    labelText: "Yapılandırma Kodu",
                    valueWidget: Observer(
                      builder: (_) => Text(viewModel.kalemModel.yapkod ?? ""),
                    ),
                    isMust: true,
                    readOnly: true,
                    suffixMore: true,
                    controller: yapKodController,
                    onTap: () async {
                      final result = await Get.toNamed(
                        "/mainPage/yapilandirmaRehberi",
                        arguments: widget.stokListesiModel ?? viewModel.model ?? StokListesiModel()
                          ..stokKodu = viewModel.kalemModel.stokKodu,
                      );
                      if (result is YapilandirmaRehberiModel) {
                        yapKodController.text = result.yapacik ?? "";
                        viewModel.setYapKod(result.yapkod);
                      }
                    },
                  ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (yetkiController.siparisSatirdaTeslimTarihiSor(editTipi) && !transferMi)
                      Expanded(
                        child: CustomTextField(
                          labelText: "Teslim Tarihi",
                          controller: teslimTarihiController,
                          readOnly: true,
                          onClear: () => viewModel.kalemModel.teslimTarihi = null,
                          onTap: () async {
                            final result = await dialogManager.showDateTimePicker();
                            if (result != null) {
                              teslimTarihiController.text = result.toDateString;
                              viewModel.kalemModel.teslimTarihi = result;
                            }
                          },
                          suffix: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                onPressed: () async {
                                  final result = await dialogManager.showDateTimePicker();
                                  if (result != null) {
                                    teslimTarihiController.text = result.toDateString;
                                    viewModel.kalemModel.teslimTarihi = result;
                                  }
                                },
                                icon: const Icon(Icons.calendar_today_outlined),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (yetkiController.siparisKosulSatirdaSor(editTipi) && !transferMi)
                      Expanded(
                        child: CustomTextField(
                          labelText: "Koşul",
                          readOnly: true,
                          suffixMore: true,
                          valueWidget: Observer(
                            builder: (_) => Text(viewModel.kalemModel.kosulKodu ?? ""),
                          ),
                          controller: kosulController,
                          onTap: () async {
                            final result = await bottomSheetDialogManager.showKosullarBottomSheetDialog(
                              context,
                              viewModel.kalemModel.kosulKodu,
                              model.kayittarihi,
                            );
                            if (result != null) {
                              kosulController.text = result.genelKosulAdi ?? result.kosulKodu ?? "";
                              viewModel.setKosul(result.kosulKodu ?? "");
                            }
                          },
                        ),
                      ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (yetkiController.lokalDepoUygulamasiAcikMi && (editTipi?.depoTransferiMi != true))
                      Expanded(
                        child: CustomTextField(
                          labelText: "Depo",
                          controller: depoController,
                          isMust: true,
                          readOnly: true,
                          suffixMore: true,
                          valueWidget: Observer(
                            builder: (_) => Text(
                              viewModel.kalemModel.depoKodu.toStringIfNotNull ?? "",
                            ),
                          ),
                          onTap: () async {
                            final result = await bottomSheetDialogManager.showDepoBottomSheetDialog(
                              context,
                              viewModel.kalemModel.depoKodu,
                            );
                            if (result != null) {
                              depoController.text = result.depoTanimi ?? result.depoKodu.toStringIfNotNull ?? "";
                              viewModel.kalemModel.depoTanimi = result.depoTanimi;
                              if (result.depoKodu != null) {
                                viewModel.setDepoKodu(result.depoKodu);
                              }
                            }
                          },
                        ),
                      ),
                    if (yetkiController.projeUygulamasiAcikMi && !(editTipi?.gizlenecekAlanlar("proje") ?? false))
                      Expanded(
                        child: CustomTextField(
                          labelText: "Proje",
                          controller: projeController,
                          isMust: true,
                          readOnly: true,
                          suffixMore: true,
                          valueWidget: Observer(
                            builder: (_) => Text(viewModel.kalemModel.projeKodu ?? ""),
                          ),
                          onTap: () async {
                            final result = await bottomSheetDialogManager.showProjeBottomSheetDialog(
                              context,
                              viewModel.kalemModel.projeKodu,
                            );
                            if (result != null) {
                              projeController.text = result.projeAciklama ?? result.projeKodu ?? "";
                              viewModel.setProjeKodu(result.projeKodu ?? "");
                            }
                          },
                        ),
                      ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (!(editTipi?.gizlenecekAlanlar("miktar") ?? false))
                      Expanded(
                        child: Observer(
                          builder: (_) => CustomTextField(
                            enabled: !viewModel.koliMi && !(editTipi?.degistirilmeyecekAlanlar("miktar") ?? false),
                            labelText: "Miktar",
                            isFormattedString: true,
                            isMust: true,
                            controller: viewModel.koliMi ? null : miktarController,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            validator: (value) {
                              if (value case ("" || null)) {
                                return "Miktar boş bırakılamaz";
                              }
                              if ((int.tryParse(value) ?? 0) <= 0) {
                                return "Miktar sıfırdan büyük olmalı";
                              }
                              return null;
                            },
                            onChanged: (value) => viewModel.setMiktar(value.toDoubleWithFormattedString),
                            suffix: Wrap(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove_outlined),
                                  onPressed: () => viewModel.decreaseMiktar(miktarController),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add_outlined),
                                  onPressed: () => viewModel.increaseMiktar(miktarController),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    if (!(editTipi?.gizlenecekAlanlar("miktar2") ?? false))
                      Expanded(
                        child: Observer(
                          builder: (_) => CustomTextField(
                            labelText: "Miktar 2",
                            controller: miktar2Controller,
                            isFormattedString: true,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            enabled: !(editTipi?.degistirilmeyecekAlanlar("miktar2") ?? false),
                            validator: miktar2Validator,
                            isMust: (viewModel.model?.koliMi ?? false) || (editTipi?.bosGecilmeyecekAlanlar("miktar2") ?? false),
                            onChanged: (value) => viewModel.setMiktar2(value.toDoubleWithFormattedString),
                            suffix: Wrap(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove_outlined),
                                  onPressed: () => viewModel.decreaseMiktar2(miktar2Controller),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add_outlined),
                                  onPressed: () => viewModel.increaseMiktar2(miktar2Controller),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        labelText: "Mal. Faz. Miktar",
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        controller: malFazMiktarController,
                        onChanged: (value) => viewModel.setMFMiktar(value.toDoubleWithFormattedString),
                        suffix: Wrap(
                          children: [
                            IconButton(
                              icon: const Icon(Icons.remove_outlined),
                              onPressed: () => viewModel.decreaseMFMiktar(malFazMiktarController),
                            ),
                            IconButton(
                              icon: const Icon(Icons.add_outlined),
                              onPressed: () => viewModel.increaseMFMiktar(malFazMiktarController),
                            ),
                          ],
                        ),
                      ),
                    ).yetkiVarMi(
                      !editTipi.talepTeklifMi && (editTipi?.depoTransferiMi != true),
                    ),
                    if (!editTipi.talepKalemlerFiltrele) Expanded(
                      child: CustomTextField(
                        labelText: "Ölçü Birimi",
                        readOnly: true,
                        suffixMore: true,
                        controller: olcuBirimiController,
                        valueWidget: Observer(
                          builder: (_) => TextScroll(
                            viewModel.kalemModel.olcuBirimKodu == null
                                ? ""
                                : "${viewModel.kalemModel.olcuBirimKodu.toStringIfNotNull ?? ""} ${viewModel.kalemModel.olcuBirimKodu == 1 ? "" : "- ${viewModel.kalemModel.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)} ${viewModel.kalemModel.olcuBirimAdi} = ${((viewModel.kalemModel.miktar ?? 0) * (viewModel.olcuBirimiMap.firstWhereOrNull((element) => element.adi == viewModel.kalemModel.olcuBirimAdi)?.payda ?? 0)).commaSeparatedWithDecimalDigits(OndalikEnum.oran)} ${viewModel.olcuBirimiMap.firstOrNull?.adi}"}",
                          ),
                        ),
                        // valueWidget: Observer(builder: (_) => TextScroll("12345678910    " * 10)),
                        onClear: () => viewModel.setOlcuBirimi(null),
                        onTap: () async {
                          final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                            context,
                            title: "Ölçü Birimi Seçiniz",
                            groupValue: viewModel.kalemModel.olcuBirimKodu,
                            children: List.generate(
                              viewModel.olcuBirimiMap.length,
                              (index) => BottomSheetModel(
                                title: viewModel.olcuBirimiMap[index].adi ?? "",
                                description: (index + 1).toStringIfNotNull,
                                groupValue: index + 1,
                                value: MapEntry<Olculer, int>(
                                  viewModel.olcuBirimiMap[index],
                                  index + 1,
                                ),
                              ),
                            ),
                          );
                          if (result != null) {
                            viewModel.setOlcuBirimi(result);
                            olcuBirimiController.text = result.key.adi ?? "";
                          }
                        },
                      ),
                    ),
                  ],
                ),
                if (editTipi?.fiyatGor == true)
                  Observer(
                    builder: (_) => Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CustomTextField(
                            labelText: "Döviz Tipi",
                            controller: dovizTipiController,
                            isMust: true,
                            enabled: !(editTipi?.fiyatDegistirilmesin ?? false),
                            readOnly: true,
                            suffixMore: true,
                            valueWidget: Observer(
                              builder: (_) => Text(
                                viewModel.kalemModel.dovizTipi.toStringIfNotNull ?? "",
                              ),
                            ),
                            onTap: () async {
                              final result = await bottomSheetDialogManager.showDovizBottomSheetDialog(
                                context,
                                viewModel.kalemModel.dovizKodu,
                              );
                              if (result != null) {
                                viewModel.kalemModel.dovizTipi = result.dovizKodu;
                                viewModel.kalemModel.dovizKodu = result.dovizKodu;
                                viewModel.setDovizAdi(result.isim ?? mainCurrency);
                                dovizTipiController.text = result.isim ?? "";
                                viewModel.setShowDovizBilgileri(
                                  result.dovizTipi != 0,
                                );
                                await getDovizData();
                              }
                            },
                          ),
                        ).yetkiVarMi(
                          (viewModel.model?.dovizliMi ?? false) && !transferMi,
                        ),
                        Expanded(
                          child: CustomTextField(
                            labelText: "Döviz Kuru",
                            isMust: true,
                            controller: dovizKuruController,
                            enabled: !(editTipi?.fiyatDegistirilmesin ?? false),
                            isFormattedString: true,
                            keyboardType: const TextInputType.numberWithOptions(
                              decimal: true,
                            ),
                            onChanged: (value) {
                              viewModel.kalemModel.dovizKuru = value.toDoubleWithFormattedString;
                              viewModel.setBrutFiyat(
                                (viewModel.kalemModel.dovizliFiyat ?? 0) * (viewModel.kalemModel.dovizKuru ?? 1),
                              );
                              fiyatController.text = viewModel.kalemModel.brutFiyat.commaSeparatedWithDecimalDigits(
                                OndalikEnum.fiyat,
                              );
                            },
                          ),
                        ).yetkiVarMi(
                          viewModel.kalemModel.dovizliMi && !transferMi,
                        ),
                      ],
                    ),
                  ),
                if (editTipi?.fiyatGor == true)
                  Observer(
                    builder: (_) => CustomTextField(
                      labelText: "Döviz Fiyatı",
                      isMust: true,
                      controller: dovizFiyatiController,
                      enabled: !(editTipi?.fiyatDegistirilmesin ?? false),
                      keyboardType: const TextInputType.numberWithOptions(decimal: true),
                      isFormattedString: true,
                      onChanged: (p0) {
                        viewModel
                          ..setDovizFiyati(p0.toDoubleWithFormattedString)
                          ..setBrutFiyat((viewModel.kalemModel.dovizliFiyat ?? 0) * (viewModel.kalemModel.dovizKuru ?? 1));
                        log(viewModel.kalemModel.brutFiyat.toString());
                        log(viewModel.kalemModel.dovizliFiyat.toString());
                        fiyatController.text = viewModel.kalemModel.brutFiyat.commaSeparatedWithDecimalDigits(
                          OndalikEnum.dovizFiyati,
                        );
                      },
                    ).yetkiVarMi(viewModel.kalemModel.dovizliMi && !transferMi),
                  ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: CustomTextField(
                        enabled: yetkiController.siparisSatirdaKDVSor(editTipi),
                        labelText: "KDV Oranı",
                        controller: kdvOraniController,
                        isMust: true,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                        isFormattedString: true,
                        onChanged: (p0) => viewModel.setKdvOrani(p0.toDoubleWithFormattedString),
                        suffix: IconButton(
                          icon: const Icon(Icons.more_horiz_outlined),
                          onPressed: () async {
                            final result = await bottomSheetDialogManager.showKdvOranlariBottomSheetDialog(
                              context,
                              viewModel.kalemModel.kdvOrani,
                            );
                            if (result != null) {
                              viewModel.setKdvOrani(result);
                              kdvOraniController.text = result.toIntIfDouble.toStringIfNotNull ?? "";
                              // kdvOraniController.value = TextEditingValue(text: result.toIntIfDouble.toStringIfNotNull ?? "");
                              // kdvOraniController.buildTextSpan(context: context, withComposing: true);
                            }
                          },
                        ),
                      ),
                    ).yetkiVarMi(
                      !editTipi.talepKalemlerFiltrele && !transferMi,
                    ),
                    if (editTipi?.fiyatGor == true && !(editTipi?.gizlenecekAlanlar("fiyat") ?? false))
                      Expanded(
                        child: CustomTextField(
                          labelText: "Fiyat",
                          controller: fiyatController,
                          enabled: !(editTipi?.fiyatDegistirilmesin ?? false) && !(editTipi?.gizlenecekAlanlar("fiyat") ?? false),
                          keyboardType: const TextInputType.numberWithOptions(
                            decimal: true,
                          ),
                          isMust: editTipi?.bosGecilmeyecekAlanlar("fiyat"),
                          isFormattedString: true,
                          onChanged: (p0) {
                            viewModel.setBrutFiyat(p0.toDoubleWithFormattedString);
                            if (viewModel.model?.dovizliMi ?? false) {
                              viewModel.setDovizFiyati(
                                (viewModel.kalemModel.brutFiyat ?? 0) / (viewModel.kalemModel.dovizKuru ?? 1),
                              );
                              dovizFiyatiController.text = viewModel.kalemModel.dovizliFiyat.commaSeparatedWithDecimalDigits(
                                OndalikEnum.fiyat,
                              );
                            }
                          },
                        ),
                      ),
                  ],
                ),
                Observer(
                  builder: (_) => CustomTextField(
                    labelText: "Seriler",
                    isMust: true,
                    controller: serilerController,
                    suffixMore: true,
                    readOnly: true,
                    onTap: serilerOnTap,
                    validator: (value) {
                      if (value == "") {
                        return "Bu alan boş bırakılamaz.";
                      }
                      if (widget.stokListesiModel?.seriMiktarKadarSor == true && viewModel.kalemModel.miktar != viewModel.kalemModel.seriList?.length) {
                        return "Girdiğiniz miktar (${viewModel.kalemModel.miktar.toIntIfDouble ?? 0}) ve seri miktarı (${viewModel.kalemModel.seriList?.length ?? 0})";
                      }
                      return null;
                    },
                  ).yetkiVarMi(seriliMi),
                ),
                if (!(editTipi?.gizlenecekAlanlar("satir_iskontolari") ?? false))
                  ...List.generate(
                    editTipi.kademeliIskontoSayisi > 6 ? 6 : editTipi.kademeliIskontoSayisi,
                    (index) => !(editTipi?.gizlenecekAlanlar("sat_isk$index") ?? false)
                        ? Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: CustomTextField(
                                  labelText: "İsk.${index + 1}${index != 0 ? " %" : ""}",
                                  controller: iskontoController(index + 1),
                                  keyboardType: const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                                  isFormattedString: true,
                                  suffix: yetkiController.siparisMSISk1YuzdeSor(editTipi) && index == 0
                                      ? Observer(
                                          builder: (_) => IconButton(
                                            onPressed: viewModel.changeIskonto1OranMi,
                                            icon: Icon(
                                              (viewModel.kalemModel.iskonto1OranMi ?? false) ? Icons.percent_outlined : Icons.payments_outlined,
                                            ),
                                          ),
                                        )
                                      : null,
                                  onChanged: (p0) => setIskonto(index + 1, p0),
                                ),
                              ),
                              Expanded(
                                child: CustomTextField(
                                  labelText: "İsk.Tipi ${index + 1}",
                                  readOnly: true,
                                  suffixMore: true,
                                  keyboardType: const TextInputType.numberWithOptions(
                                    decimal: true,
                                  ),
                                  controller: iskontoTipiController(index + 1),
                                  onClear: () => iskontoFiller(index + 1, null),
                                  onTap: () async {
                                    final result = await bottomSheetDialogManager.showIskontoTipiBottomSheetDialog(
                                      context,
                                      getIskontoWithIndex(index + 1),
                                    );
                                    if (result != null) {
                                      iskontoFiller(index + 1, result);
                                    }
                                  },
                                ),
                              ),
                            ],
                          ).yetkiVarMi(!editTipi.talepKalemlerFiltrele && !transferMi)
                        : const SizedBox.shrink(),
                  ),
                // TODO Açıklama parametrelerini düzenle
                const Text(
                  "Açıklamalar",
                  style: TextStyle(fontSize: UIHelper.highSize),
                ).paddingSymmetric(vertical: UIHelper.lowSize).yetkiVarMi(
                      yetkiController.siparisSatirAciklamaAlanlari(null) && !editTipi.talepTeklifMi && !transferMi,
                    ),
                if (!editTipi.talepTeklifMi && yetkiController.siparisSatirAciklamaAlanlari(1) && !transferMi)
                  CustomTextField(
                    labelText: getAciklamaLabel(1),
                    maxLength: 35,
                    readOnly: getEkRehberModel("SATIR_ACIK1") != null,
                    suffixMore: getEkRehberModel("SATIR_ACIK1") != null,
                    onTap: () async => getGenelRehberModel("SATIR_ACIK1"),
                    valueWidget: getEkRehberModel("SATIR_ACIK1") == null
                        ? null
                        : Observer(
                            builder: (_) => Text(viewModel.kalemModel.aciklama1 ?? ""),
                          ),
                    onClear: () => viewModel.setAciklama1(null),
                    controller: aciklama1Controller,
                    onChanged: (value) => viewModel.kalemModel.aciklama1 = value,
                  ),
                if (!editTipi.talepTeklifMi && yetkiController.siparisSatirAciklamaAlanlari(2) && !transferMi)
                  CustomTextField(
                    labelText: getAciklamaLabel(2),
                    maxLength: 35,
                    readOnly: getEkRehberModel("SATIR_ACIK2") != null,
                    suffixMore: getEkRehberModel("SATIR_ACIK2") != null,
                    onClear: () => viewModel.setAciklama2(null),
                    onTap: () async => getGenelRehberModel("SATIR_ACIK2"),
                    valueWidget: getEkRehberModel("SATIR_ACIK2") == null
                        ? null
                        : Observer(
                            builder: (_) => Text(viewModel.kalemModel.aciklama2 ?? ""),
                          ),
                    controller: aciklama2Controller,
                    onChanged: (value) => viewModel.kalemModel.aciklama2 = value,
                  ),
                if (!editTipi.talepTeklifMi && yetkiController.siparisSatirAciklamaAlanlari(3) && !transferMi)
                  CustomTextField(
                    labelText: getAciklamaLabel(3),
                    maxLength: 35,
                    readOnly: getEkRehberModel("SATIR_ACIK3") != null,
                    suffixMore: getEkRehberModel("SATIR_ACIK3") != null,
                    onTap: () async => getGenelRehberModel("SATIR_ACIK3"),
                    valueWidget: getEkRehberModel("SATIR_ACIK3") == null
                        ? null
                        : Observer(
                            builder: (_) => Text(viewModel.kalemModel.aciklama3 ?? ""),
                          ),
                    onClear: () => viewModel.setAciklama3(null),
                    controller: aciklama3Controller,
                    onChanged: (value) => viewModel.kalemModel.aciklama3 = value,
                  ),
                if (!editTipi.talepTeklifMi && yetkiController.siparisSatirAciklamaAlanlari(4) && !transferMi)
                  CustomTextField(
                    labelText: getAciklamaLabel(4),
                    maxLength: 35,
                    readOnly: getEkRehberModel("SATIR_ACIK4") != null,
                    suffixMore: getEkRehberModel("SATIR_ACIK4") != null,
                    onTap: () async => getGenelRehberModel("SATIR_ACIK4"),
                    valueWidget: getEkRehberModel("SATIR_ACIK4") == null
                        ? null
                        : Observer(
                            builder: (_) => Text(viewModel.kalemModel.aciklama4 ?? ""),
                          ),
                    onClear: () => viewModel.setAciklama4(null),
                    controller: aciklama4Controller,
                    onChanged: (value) => viewModel.kalemModel.aciklama4 = value,
                  ),
                if (!editTipi.talepTeklifMi && yetkiController.siparisSatirAciklamaAlanlari(5) && !transferMi)
                  CustomTextField(
                    labelText: getAciklamaLabel(5),
                    maxLength: 35,
                    readOnly: getEkRehberModel("SATIR_ACIK5") != null,
                    suffixMore: getEkRehberModel("SATIR_ACIK5") != null,
                    onTap: () async => getGenelRehberModel("SATIR_ACIK5"),
                    valueWidget: getEkRehberModel("SATIR_ACIK5") == null
                        ? null
                        : Observer(
                            builder: (_) => Text(viewModel.kalemModel.aciklama5 ?? ""),
                          ),
                    onClear: () => viewModel.setAciklama5(null),
                    controller: aciklama5Controller,
                    onChanged: (value) => viewModel.kalemModel.aciklama5 = value,
                  ),
                if (!editTipi.talepTeklifMi && yetkiController.siparisSatirAciklamaAlanlari(6) && !transferMi)
                  CustomTextField(
                    labelText: getAciklamaLabel(6),
                    maxLength: 35,
                    readOnly: getEkRehberModel("SATIR_ACIK6") != null,
                    suffixMore: getEkRehberModel("SATIR_ACIK6") != null,
                    onTap: () async => getGenelRehberModel("SATIR_ACIK6"),
                    valueWidget: getEkRehberModel("SATIR_ACIK6") == null
                        ? null
                        : Observer(
                            builder: (_) => Text(viewModel.kalemModel.aciklama6 ?? ""),
                          ),
                    onClear: () => viewModel.setAciklama6(null),
                    controller: aciklama6Controller,
                    onChanged: (value) => viewModel.kalemModel.aciklama6 = value,
                  ),
                if (!editTipi.talepTeklifMi && yetkiController.siparisSatirAciklamaAlanlari(7) && !transferMi)
                  CustomTextField(
                    labelText: getAciklamaLabel(7),
                    maxLength: 35,
                    readOnly: getEkRehberModel("SATIR_ACIK7") != null,
                    suffixMore: getEkRehberModel("SATIR_ACIK7") != null,
                    onTap: () async => getGenelRehberModel("SATIR_ACIK7"),
                    valueWidget: getEkRehberModel("SATIR_ACIK7") == null
                        ? null
                        : Observer(
                            builder: (_) => Text(viewModel.kalemModel.aciklama7 ?? ""),
                          ),
                    onClear: () => viewModel.setAciklama7(null),
                    controller: aciklama7Controller,
                    onChanged: (value) => viewModel.kalemModel.aciklama7 = value,
                  ),
                if (!editTipi.talepTeklifMi && yetkiController.siparisSatirAciklamaAlanlari(8) && !transferMi)
                  CustomTextField(
                    labelText: getAciklamaLabel(8),
                    maxLength: 35,
                    readOnly: getEkRehberModel("SATIR_ACIK8") != null,
                    suffixMore: getEkRehberModel("SATIR_ACIK8") != null,
                    onTap: () async => getGenelRehberModel("SATIR_ACIK8"),
                    valueWidget: getEkRehberModel("SATIR_ACIK8") == null
                        ? null
                        : Observer(
                            builder: (_) => Text(viewModel.kalemModel.aciklama8 ?? ""),
                          ),
                    onClear: () => viewModel.setAciklama8(null),
                    controller: aciklama8Controller,
                    onChanged: (value) => viewModel.kalemModel.aciklama8 = value,
                  ),
                if (!editTipi.talepTeklifMi && yetkiController.siparisSatirAciklamaAlanlari(9) && !transferMi)
                  CustomTextField(
                    labelText: getAciklamaLabel(9),
                    maxLength: 35,
                    readOnly: getEkRehberModel("SATIR_ACIK9") != null,
                    suffixMore: getEkRehberModel("SATIR_ACIK9") != null,
                    onTap: () async => getGenelRehberModel("SATIR_ACIK9"),
                    valueWidget: getEkRehberModel("SATIR_ACIK9") == null
                        ? null
                        : Observer(
                            builder: (_) => Text(viewModel.kalemModel.aciklama9 ?? ""),
                          ),
                    onClear: () => viewModel.setAciklama9(null),
                    controller: aciklama9Controller,
                    onChanged: (value) => viewModel.kalemModel.aciklama9 = value,
                  ),
                if (!editTipi.talepTeklifMi && yetkiController.siparisSatirAciklamaAlanlari(10) && !transferMi)
                  CustomTextField(
                    labelText: getAciklamaLabel(10),
                    maxLength: 35,
                    readOnly: getEkRehberModel("SATIR_ACIK10") != null,
                    suffixMore: getEkRehberModel("SATIR_ACIK10") != null,
                    onTap: () async => getGenelRehberModel("SATIR_ACIK10"),
                    onClear: () => viewModel.setAciklama10(null),
                    valueWidget: getEkRehberModel("SATIR_ACIK10") == null
                        ? null
                        : Observer(
                            builder: (_) => Text(viewModel.kalemModel.aciklama10 ?? ""),
                          ),
                    controller: aciklama10Controller,
                    onChanged: (value) => viewModel.kalemModel.aciklama10 = value,
                  ),
                const SizedBox(height: 50),
              ],
            ),
          ),
        ),
      );

  bool get seriliMi =>
      ((model.getEditTipiEnum?.satisMi ?? false) ? viewModel.model?.seriCikislardaAcik : viewModel.model?.seriGirislerdeAcik) == true &&
      !editTipi.siparisMi &&
      !editTipi.talepTeklifMi &&
      yetkiController.seriUygulamasiAcikMi &&
      !editTipi.ambarGirisiMi;

  String? miktar2Validator(String? p0) {
    if (viewModel.model?.koliMi == true) {
      if (p0 case ("" || null)) {
        return "Lütfen miktar giriniz";
      } else if (p0 == "0") {
        return "Miktar Sıfır olamaz";
      }
    }
    return null;
  }

  String getAciklamaLabel(int index) {
    if (getEkRehberModel("SATIR_ACIK$index") != null) {
      return getEkRehberModel("SATIR_ACIK$index")?.baslik ?? "";
    }
    return "${editTipi?.rawValue} $index";
  }

  void initControllers() {
    kalemAdiController = TextEditingController();
    ekAlan1Controller = TextEditingController();
    ekAlan2Controller = TextEditingController();
    yapKodController = TextEditingController();
    isEmriController = TextEditingController();
    teslimTarihiController = TextEditingController();
    kosulController = TextEditingController();
    depoController = TextEditingController();
    projeController = TextEditingController();
    dovizTipiController = TextEditingController();
    dovizKuruController = TextEditingController();
    dovizFiyatiController = TextEditingController();
    miktarController = TextEditingController();
    miktar2Controller = TextEditingController();
    malFazMiktarController = TextEditingController();
    olcuBirimiController = TextEditingController();
    kdvOraniController = TextEditingController();
    fiyatController = TextEditingController();
    muhKoduController = TextEditingController();
    muhRefKoduController = TextEditingController();
    serilerController = TextEditingController();
    aciklama1Controller = TextEditingController();
    aciklama2Controller = TextEditingController();
    aciklama3Controller = TextEditingController();
    aciklama4Controller = TextEditingController();
    aciklama5Controller = TextEditingController();
    aciklama6Controller = TextEditingController();
    aciklama7Controller = TextEditingController();
    aciklama8Controller = TextEditingController();
    aciklama9Controller = TextEditingController();
    aciklama10Controller = TextEditingController();
    viewModel.setShowDovizBilgileri(
      widget.kalemModel?.dovizliMi ?? widget.stokListesiModel?.dovizliMi ?? false,
    );
  }

  Future<void> getData() async {
    if (widget.stokListesiModel != null) {
      viewModel.setModel(widget.stokListesiModel);
    } else if (widget.kalemModel != null) {
      viewModel.setKalemModel(widget.kalemModel);
      await viewModel.getData(StokRehberiRequestModel.fromKalemModel(widget.kalemModel!));
    } else {
      final result = await Get.toNamed("/mainPage/stokListesi", arguments: true);
      if (result is StokListesiModel) {
        viewModel.setModel(result);
      }
      // var stokResult = await networkManager.dioGet(path: ApiUrls.getStokFiyatOzeti, bodyModel: bodyModel)
    }
  }

  Future<void> getDovizData() async {
    if (viewModel.dovizliMi) {
      if (viewModel.kalemModel.sira == null) {
        viewModel.kalemModel.dovizTipi = widget.stokListesiModel?.bulunanDovizTipi;
        viewModel.kalemModel.dovizKodu = widget.stokListesiModel?.bulunanDovizTipi;
      }
      if (model.dovizListesi?[viewModel.kalemModel.dovizKodu] != null) {
        viewModel.kalemModel.dovizKuru = model.dovizListesi?[viewModel.kalemModel.dovizKodu];
      } else {
        final dovizResult = await networkManager.dioGet(
          path: ApiUrls.getDovizKurlari,
          bodyModel: DovizKurlariModel(),
          queryParameters: {
            "EkranTipi": "D",
            "DovizTipi": viewModel.kalemModel.dovizKodu,
            "Tarih": model.tarih?.toDateString,
          },
        );
        if (dovizResult.isSuccess && viewModel.kalemModel.dovizTipi != null) {
          final result = dovizResult.dataList.firstWhereOrNull(
            (element) => element.dovizTipi == viewModel.kalemModel.dovizTipi,
          );
          if (result != null) {
            switch (parametreModel.satisDovizTakipHangiDeger) {
              case 1:
                viewModel.kalemModel.dovizKuru = result.dovAlis;
              case 2:
                viewModel.kalemModel.dovizKuru = result.dovSatis;
              case 3:
                viewModel.kalemModel.dovizKuru = result.effAlis;
              case 4:
                viewModel.kalemModel.dovizKuru = result.effSatis;
              default:
                break;
            }
          }
          viewModel.setDovizAdi(result?.dovizAdi);
          dovizTipiController.text = result?.dovizAdi ?? mainCurrency;

          viewModel.setShowDovizBilgileri((result?.dovizTipi ?? 0) > 0);
        }
      }
      viewModel.setDovizFiyati(
        (viewModel.kalemModel.brutFiyat ?? 0) / (viewModel.kalemModel.dovizKuru ?? 1),
      );
      dovizKuruController.text = viewModel.kalemModel.dovizKuru.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati);
      dovizFiyatiController.text = viewModel.kalemModel.dovizliFiyat.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari);
    } else {
      viewModel.kalemModel.dovizKuru = null;
      viewModel.kalemModel.dovizliFiyat = null;
      dovizKuruController.clear();
      dovizFiyatiController.clear();
    }
  }

  Future<void> controllerFiller() async {
    if (widget.kalemModel != null) {
      viewModel.setKalemModel(widget.kalemModel);
      await viewModel.getData(StokRehberiRequestModel.fromKalemModel(widget.kalemModel!));
      if (editTipi?.ambarFisiMi == true) {
        viewModel.setKdvOrani(0);
      }
    } else {
      viewModel.setOTVliMi();
      viewModel.kalemModel.kalemList ??= viewModel.model?.stokList?.map(KalemModel.fromStokList).toList();
      viewModel.kalemModel.stokKodu ??= viewModel.model?.stokKodu;
      if (editTipi?.satisMi == true) {
        viewModel.kalemModel.stokSatDovizAdi ??= stokListesiModel?.bulunanDovizTipi.toStringIfNotNull ?? viewModel.model?.satisDovizAdi;
        viewModel.kalemModel.stokSatDovTip ??= stokListesiModel?.bulunanDovizTipi ?? stokListesiModel?.satDovTip ?? viewModel.model?.satDovTip;
      } else {
        viewModel.kalemModel.stokAlisDovizAdi ??= stokListesiModel?.bulunanDovizTipi.toStringIfNotNull ?? viewModel.model?.alisDovizAdi;
        viewModel.kalemModel.stokAlisDovTip ??= stokListesiModel?.bulunanDovizTipi ?? stokListesiModel?.alisDovTip ?? viewModel.model?.alisDovTip;
      }
      viewModel.setYapKod(stokListesiModel?.yapkod);
      if (editTipi?.satisMi == true ? yetkiController.satisMiktar1Gelsin : yetkiController.alisMiktar1Gelsin) {
        viewModel.setMiktar(1);
      }
      viewModel.kalemModel.isemriNo = model.isemriNo;
      viewModel.kalemModel.stokBirimAgirlik = stokListesiModel?.birimAgirlik;
      viewModel.kalemModel.stokAlisDovTip ??= stokListesiModel?.alisDovTip ?? viewModel.model?.alisDovTip;
      viewModel.kalemModel.dovizTipi ??= (editTipi?.satisMi == true ? stokListesiModel?.satDovTip : viewModel.model?.alisDovTip);
      viewModel.kalemModel.dovizAdi ??= editTipi?.satisMi == true ? viewModel.model?.satisDovizAdi : viewModel.model?.alisDovizAdi;
      if (stokListesiModel?.okutulanBarkod != null) {
        viewModel.setMiktar(stokListesiModel?.varsayilanMiktar);
        final SeriList newSeri = SeriList(miktar: stokListesiModel?.varsayilanMiktar, sonKullanmaTarihi: stokListesiModel?.bulunanSeriSkt);
        viewModel.kalemModel.brutFiyat = stokListesiModel?.bulunanFiyat;
        if (stokListesiModel?.bulunanSeriAcik1 case final value?) newSeri.acik1 = value;
        if (stokListesiModel?.bulunanSeriAcik2 case final value?) newSeri.acik2 = value;
        if (stokListesiModel?.bulunanSeriAcik3 case final value?) newSeri.acik3 = value;
        if (stokListesiModel?.bulunanSeriAcik4 case final value?) newSeri.acik4 = value;
        if (stokListesiModel?.bulunanSerilot case final value?) {
          newSeri
            ..seri1 = value
            ..seriNo = value;
        }
        if (stokListesiModel?.bulunanSerilot2 case final value?) newSeri.seri2 = value;
        if (stokListesiModel?.bulunanSerilot3 case final value?) newSeri.seri3 = value;
        if (stokListesiModel?.bulunanSerilot4 case final value?) newSeri.seri4 = value;
        viewModel.addSeriList(newSeri);
        setSerilerController();
      }
    }
    kalemAdiController.text = viewModel.kalemModel.kalemAdi ?? viewModel.model?.stokAdi ?? viewModel.model?.stokKodu ?? "";
    ekAlan1Controller.text = viewModel.kalemModel.ekalan1 ?? model.masrafKodu ?? "";
    ekAlan2Controller.text = viewModel.kalemModel.ekalan2 ?? "";
    teslimTarihiController.text = viewModel.kalemModel.teslimTarihi?.toDateString ?? "";
    yapKodController.text = viewModel.kalemModel.yapkod ?? viewModel.model?.yapkodAciklama ?? viewModel.model?.yapkod ?? "";
    isEmriController.text = viewModel.kalemModel.isemriNo ?? "";
    isk1Controller?.text = viewModel.kalemModel.iskonto1.commaSeparatedWithDecimalDigits(OndalikEnum.oran);
    isk1TipiController?.text = getIskTipiAciklama(viewModel.kalemModel.isk1Tipi.toIntIfDouble);
    isk2YuzdeController?.text = viewModel.kalemModel.iskonto2.commaSeparatedWithDecimalDigits(OndalikEnum.oran);
    isk2TipiController?.text = getIskTipiAciklama(viewModel.kalemModel.isk2Tipi.toIntIfDouble);
    isk3YuzdeController?.text = viewModel.kalemModel.iskonto3.commaSeparatedWithDecimalDigits(OndalikEnum.oran);
    isk3TipiController?.text = getIskTipiAciklama(viewModel.kalemModel.isk3Tipi.toIntIfDouble);
    isk4YuzdeController?.text = viewModel.kalemModel.iskonto4.commaSeparatedWithDecimalDigits(OndalikEnum.oran);
    isk4TipiController?.text = getIskTipiAciklama(viewModel.kalemModel.isk4Tipi.toIntIfDouble);
    isk5YuzdeController?.text = viewModel.kalemModel.iskonto5.commaSeparatedWithDecimalDigits(OndalikEnum.oran);
    isk5TipiController?.text = getIskTipiAciklama(viewModel.kalemModel.isk5Tipi.toIntIfDouble);
    isk6YuzdeController?.text = viewModel.kalemModel.iskonto6.commaSeparatedWithDecimalDigits(OndalikEnum.oran);
    isk6TipiController?.text = getIskTipiAciklama(viewModel.kalemModel.isk6Tipi.toIntIfDouble);
    fiyatController.text = (viewModel.kalemModel.brutFiyat.toIntIfDouble ?? viewModel.model?.bulunanFiyat.toIntIfDouble)?.commaSeparatedWithDecimalDigits(OndalikEnum.fiyat) ?? "";
    miktarController.text = viewModel.kalemModel.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar);
    miktar2Controller.text = viewModel.kalemModel.miktar2.commaSeparatedWithDecimalDigits(OndalikEnum.miktar);
    muhKoduController.text = viewModel.kalemModel.muhasebeTanimi ?? viewModel.kalemModel.muhasebeKodu ?? "";
    muhRefKoduController.text = viewModel.kalemModel.muhRefKodu ?? "";
    malFazMiktarController.text = (viewModel.kalemModel.malFazlasiMiktar ?? viewModel.kalemModel.malFazlasiMiktar)?.toIntIfDouble.toStringIfNotNull ?? "";
    olcuBirimiController.text = viewModel.kalemModel.olcuBirimAdi ?? viewModel.model?.olcuBirimi ?? "";
    kdvOraniController.text = editTipi?.ambarFisiMi == true
        ? ""
        : viewModel.kalemModel.kdvOrani?.commaSeparatedWithDecimalDigits(OndalikEnum.oran) ??
            (model.getEditTipiEnum?.satisMi == true ? (stokListesiModel?.satisKdv ?? 0) : (stokListesiModel?.alisKdv ?? 0)).commaSeparatedWithDecimalDigits(OndalikEnum.oran);
    // projeController.text = teslimTarihiController.text = model.teslimTarihi.toDateString;
    kosulController.text = viewModel.kalemModel.kosulKodu ?? model.kosulKodu ?? model.kosulKodu ?? "";
    dovizTipiController.text =
        viewModel.kalemModel.dovizliMi ? (viewModel.kalemModel.dovizAdi ?? (editTipi?.satisMi == true ? viewModel.model?.satisDovizAdi : viewModel.model?.alisDovizAdi) ?? "") : mainCurrency;
    dovizFiyatiController.text = (viewModel.kalemModel.dovizliFiyat ?? viewModel.model?.dovAlisFiat).commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari);
    aciklama1Controller.text = viewModel.kalemModel.aciklama1 ?? "";
    aciklama2Controller.text = viewModel.kalemModel.aciklama2 ?? "";
    aciklama3Controller.text = viewModel.kalemModel.aciklama3 ?? "";
    aciklama4Controller.text = viewModel.kalemModel.aciklama4 ?? "";
    aciklama5Controller.text = viewModel.kalemModel.aciklama5 ?? "";
    aciklama6Controller.text = viewModel.kalemModel.aciklama6 ?? "";
    aciklama7Controller.text = viewModel.kalemModel.aciklama7 ?? "";
    aciklama8Controller.text = viewModel.kalemModel.aciklama8 ?? "";
    aciklama9Controller.text = viewModel.kalemModel.aciklama9 ?? "";
    aciklama10Controller.text = viewModel.kalemModel.aciklama10 ?? "";
    if (yetkiController.projeUygulamasiAcikMi) {
      projeController.text = model.projeAciklama ?? model.projeKodu ?? "";
      viewModel.kalemModel.projeKodu = model.projeKodu;
    }
    viewModel.kalemModel.kalemAdi = kalemAdiController.text;
    viewModel.kalemModel.belgeTipi = editTipi?.rawValue;
    viewModel.kalemModel.stokKodu = viewModel.kalemModel.stokKodu ?? viewModel.model?.stokKodu ?? "";
    viewModel.kalemModel.kosulKodu = model.kosulKodu;
    viewModel.kalemModel.teslimTarihi = (editTipi?.siparisMi == true) && yetkiController.siparisSatirdaTeslimTarihiSor(editTipi) ? model.teslimTarihi : null;
    // viewModel.setShowDovizBilgileri(viewModel.dovizliMi);
    // viewModel.setOlcuBirimi(MapEntry<Olculer, int>((adi: stokListesiModel?.olcuBirimi ?? viewModel.kalemModel.olcuBirimAdi ?? "", pay: 0.0, payda: 0.0), 1));
    if (widget.kalemModel == null) {
      viewModel.setKosul(model.kosulKodu ?? "");
      if (yetkiController.projeUygulamasiAcikMi) {
        viewModel.setProjeKodu(model.projeKodu ?? "");
      }
      viewModel
        ..setFiyat(fiyatController.text.toDoubleWithFormattedString)
        ..setBrutFiyat(fiyatController.text.toDoubleWithFormattedString)
        ..setMiktar2(double.tryParse(miktar2Controller.text) ?? 0)
        ..setMiktar(double.tryParse(miktarController.text) ?? 0)
        ..setMFMiktar(double.tryParse(malFazMiktarController.text) ?? 0)
        ..setKdvOrani(double.tryParse(kdvOraniController.text) ?? 0)
        ..setIskonto1(double.tryParse(isk1Controller?.text ?? "") ?? 0)
        ..setIskonto2(double.tryParse(isk2YuzdeController?.text ?? "") ?? 0)
        ..setIskonto3(double.tryParse(isk3YuzdeController?.text ?? "") ?? 0)
        ..setIskonto4(double.tryParse(isk4YuzdeController?.text ?? "") ?? 0)
        ..setIskonto5(double.tryParse(isk5YuzdeController?.text ?? "") ?? 0)
        ..setIskonto6(double.tryParse(isk6YuzdeController?.text ?? "") ?? 0);
    }
    if (editTipi?.depoTransferiMi == true) {
      viewModel.kalemModel.depoKodu ??= model.cikisDepoKodu ?? viewModel.model?.depoKodu;
      viewModel.kalemModel.hedefDepo ??= model.girisDepoKodu;
      viewModel.kalemModel.hedefDepoAdi = parametreModel.depoList
              ?.where(
                (element) => element.depoKodu == viewModel.kalemModel.hedefDepo,
              )
              .firstOrNull
              ?.depoTanimi ??
          "";
    } else {
      viewModel.kalemModel.depoKodu ??= model.cikisDepoKodu ?? model.topluDepo ?? viewModel.model?.depoKodu ?? parametreModel.satisHizmetDepoKodu;
    }
    viewModel.kalemModel.depoTanimi = parametreModel.depoList
            ?.where(
              (element) => element.depoKodu == viewModel.kalemModel.depoKodu,
            )
            .firstOrNull
            ?.depoTanimi ??
        "";
    depoController.text = viewModel.kalemModel.depoTanimi ?? "";
    viewModel.kalemModel.depoTanimi ??= depoController.text;
    if (widget.kalemModel == null) {
      await getDovizData();
    } else {
      setSerilerController();
      dovizKuruController.text = viewModel.kalemModel.dovizKuru.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati);
      viewModel.kalemModel.dovizAdi ??= viewModel.model?.alisDovizAdi ?? mainCurrency;
      viewModel.kalemModel.dovizliFiyat = (viewModel.kalemModel.brutFiyat ?? 0) / (viewModel.kalemModel.dovizKuru ?? 1);
      dovizFiyatiController.text = viewModel.kalemModel.dovizliFiyat.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari);
    }

    viewModel.kalemModel.sira ??= (model.kalemList?.length ?? 0) + 1;
  }

  String setSerilerController() => serilerController.text = viewModel.kalemModel.seriList.ext.isNotNullOrEmpty ? "${viewModel.kalemModel.seriList?.length ?? 0} kalemler" : "";

  void disposeControllers() {
    kalemAdiController.dispose();
    ekAlan1Controller.dispose();
    ekAlan2Controller.dispose();
    yapKodController.dispose();
    isEmriController.dispose();
    teslimTarihiController.dispose();
    kosulController.dispose();
    depoController.dispose();
    projeController.dispose();
    dovizTipiController.dispose();
    dovizKuruController.dispose();
    dovizFiyatiController.dispose();
    miktarController.dispose();
    miktar2Controller.dispose();
    malFazMiktarController.dispose();
    olcuBirimiController.dispose();
    kdvOraniController.dispose();
    fiyatController.dispose();
    isk1Controller?.dispose();
    isk1TipiController?.dispose();
    isk2TipiController?.dispose();
    isk2YuzdeController?.dispose();
    isk3TipiController?.dispose();
    isk3YuzdeController?.dispose();
    isk4TipiController?.dispose();
    isk4YuzdeController?.dispose();
    isk5TipiController?.dispose();
    isk5YuzdeController?.dispose();
    isk6TipiController?.dispose();
    isk6YuzdeController?.dispose();
    muhKoduController.dispose();
    muhRefKoduController.dispose();
    serilerController.dispose();
    aciklama1Controller.dispose();
    aciklama2Controller.dispose();
    aciklama3Controller.dispose();
    aciklama4Controller.dispose();
    aciklama5Controller.dispose();
    aciklama6Controller.dispose();
    aciklama7Controller.dispose();
    aciklama8Controller.dispose();
    aciklama9Controller.dispose();
    aciklama10Controller.dispose();
  }

  String getIskTipiAciklama(num? value) => parametreModel.listIskTip?.firstWhereOrNull((element) => element.iskontoTipi == value)?.aciklama ?? "";

  void iskontoFiller(int index, ListIskTip? iskTip) {
    switch (index) {
      case 1:
        isk1TipiController?.text = iskTip?.aciklama ?? "";
        viewModel.kalemModel.isk1Tipi = iskTip?.iskontoTipi;
      case 2:
        isk2TipiController?.text = iskTip?.aciklama ?? "";
        viewModel.kalemModel.isk2Tipi = iskTip?.iskontoTipi;
      case 3:
        isk3TipiController?.text = iskTip?.aciklama ?? "";
        viewModel.kalemModel.isk3Tipi = iskTip?.iskontoTipi;
      case 4:
        isk4TipiController?.text = iskTip?.aciklama ?? "";
        viewModel.kalemModel.isk4Tipi = iskTip?.iskontoTipi;
      case 5:
        isk5TipiController?.text = iskTip?.aciklama ?? "";
        viewModel.kalemModel.isk5Tipi = iskTip?.iskontoTipi;
      case 6:
        isk6TipiController?.text = iskTip?.aciklama ?? "";
        viewModel.kalemModel.isk6Tipi = iskTip?.iskontoTipi;
      default:
    }
  }

  int? getIskontoWithIndex(int index) => switch (index) {
        1 => viewModel.kalemModel.isk1Tipi,
        2 => viewModel.kalemModel.isk2Tipi,
        3 => viewModel.kalemModel.isk3Tipi,
        4 => viewModel.kalemModel.isk4Tipi,
        5 => viewModel.kalemModel.isk5Tipi,
        6 => viewModel.kalemModel.isk6Tipi,
        _ => null,
      };

  TextEditingController iskontoController(int index) {
    switch (index) {
      case 1:
        isk1Controller = TextEditingController();
        return isk1Controller!;
      case 2:
        isk2YuzdeController = TextEditingController();
        return isk2YuzdeController!;
      case 3:
        isk3YuzdeController = TextEditingController();
        return isk3YuzdeController!;
      case 4:
        isk4YuzdeController = TextEditingController();
        return isk4YuzdeController!;
      case 5:
        isk5YuzdeController = TextEditingController();
        return isk5YuzdeController!;
      case 6:
        isk6YuzdeController = TextEditingController();
        return isk6YuzdeController!;
      default:
        isk1Controller = TextEditingController();
        return isk1Controller!;
    }
  }

  TextEditingController iskontoTipiController(int index) {
    switch (index) {
      case 1:
        isk1TipiController = TextEditingController();
        return isk1TipiController!;
      case 2:
        isk2TipiController = TextEditingController();
        return isk2TipiController!;
      case 3:
        isk3TipiController = TextEditingController();
        return isk3TipiController!;
      case 4:
        isk4TipiController = TextEditingController();
        return isk4TipiController!;
      case 5:
        isk5TipiController = TextEditingController();
        return isk5TipiController!;
      case 6:
        isk6TipiController = TextEditingController();
        return isk6TipiController!;
      default:
        isk1TipiController = TextEditingController();
        return isk1TipiController!;
    }
  }

  String get getDovizAdi => model.getEditTipiEnum?.satisMi == true ? (viewModel.kalemModel.stokSatDovizAdi ?? "") : (viewModel.kalemModel.stokAlisDovizAdi ?? "");

  void setIskonto(int index, String value) {
    switch (index) {
      case 1:
        viewModel.setIskonto1(value.toDoubleWithFormattedString);
      case 2:
        viewModel.setIskonto2(value.toDoubleWithFormattedString);
      case 3:
        viewModel.setIskonto3(value.toDoubleWithFormattedString);
      case 4:
        viewModel.setIskonto4(value.toDoubleWithFormattedString);
      case 5:
        viewModel.setIskonto5(value.toDoubleWithFormattedString);
      case 6:
        viewModel.setIskonto6(value.toDoubleWithFormattedString);
      default:
    }
  }

  Future<void> serilerOnTap() async {
    if ((viewModel.kalemModel.miktar ?? 0) < 1) {
      dialogManager.showErrorSnackBar("Lütfen önce miktar giriniz.");
    } else {
      final result = await Get.toNamed("/seriListesi", arguments: viewModel.kalemModel);
      if (result is List<SeriList>) {
        viewModel.kalemModel.seriList = result;
        setSerilerController();
        // viewModel.setMiktar(result.map((e) => e.miktar).sum);
      }
    }
  }

  EkRehberlerModel? getEkRehberModel(String? name) {
    if (name == null) return null;
    return userModel.ekRehberler?.firstWhereOrNull(
      (element) => element.alan == name && element.ekran == editTipi?.rawValue,
    );
  }

  Future<void> getGenelRehberModel(String? name) async {
    if (viewModel.kalemModel.stokKodu == null) return dialogManager.showErrorSnackBar("Stok seçiniz.");
    final ekRehberModel = getEkRehberModel(name);
    if (ekRehberModel == null) return;
    var result = await Get.toNamed(
      "mainPage/genelRehber",
      arguments: EkRehberRequestModel(
        belgeNo: model.belgeNo,
        belgeTipi: model.getEditTipiEnum?.rawValue,
        belgeTarihi: model.tarih,
        id: ekRehberModel.id,
        cariKodu: model.cariKodu,
        stokKodu: viewModel.kalemModel.stokKodu,
        yapkod: viewModel.kalemModel.yapkod,
        baslik: ekRehberModel.baslik,
        rehberKodu: 8,
      ),
    );
    if (result == null) return;
    result = result as GenelRehberModel;
    switch (name) {
      case "EKALAN1":
        viewModel.kalemModel.ekalan1 = result.kodu;
        ekAlan1Controller.text = result.kodu ?? "";
      case "EKALAN2":
        viewModel.kalemModel.ekalan2 = result.kodu;
        ekAlan2Controller.text = result.kodu ?? "";
      case "SATIR_ACIK1":
        viewModel.setAciklama1(result.kodu);
        aciklama1Controller.text = result.kodu ?? "";
      case "SATIR_ACIK2":
        viewModel.setAciklama2(result.kodu);
        aciklama2Controller.text = result.kodu ?? "";
      case "SATIR_ACIK3":
        viewModel.setAciklama3(result.kodu);
        aciklama3Controller.text = result.kodu ?? "";
      case "SATIR_ACIK4":
        viewModel.setAciklama4(result.kodu);
        aciklama4Controller.text = result.kodu ?? "";
      case "SATIR_ACIK5":
        viewModel.setAciklama5(result.kodu);
        aciklama5Controller.text = result.kodu ?? "";
      case "SATIR_ACIK6":
        viewModel.setAciklama6(result.kodu);
        aciklama6Controller.text = result.kodu ?? "";
      case "SATIR_ACIK7":
        viewModel.setAciklama7(result.kodu);
        aciklama7Controller.text = result.kodu ?? "";
      case "SATIR_ACIK8":
        viewModel.setAciklama8(result.kodu);
        aciklama8Controller.text = result.kodu ?? "";
      case "SATIR_ACIK9":
        viewModel.setAciklama9(result.kodu);
        aciklama9Controller.text = result.kodu ?? "";
      case "SATIR_ACIK10":
        viewModel.setAciklama10(result.kodu);
        aciklama10Controller.text = result.kodu ?? "";
    }
  }
}
