import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "../../../../../view/main_page/model/param_model.dart";
import "../../../../components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../components/textfield/custom_text_field.dart";
import "../../../../components/wrap/appbar_title.dart";
import "../../../../constants/extensions/date_time_extensions.dart";
import "../../../../constants/extensions/number_extensions.dart";
import "../../../../constants/extensions/widget_extensions.dart";
import "../../../../constants/ondalik_utils.dart";
import "../../../../constants/static_variables/static_variables.dart";
import "../../../../constants/ui_helper/ui_helper.dart";
import "../../../../init/network/login/api_urls.dart";
import "../../../model/doviz_kurlari_model.dart";
import "../../../state/base_state.dart";
import "../../yapilandirma_rehberi/model/yapilandirma_rehberi_model.dart";
import "../view_model/kalem_ekle_view_model.dart";

class KalemEkleView extends StatefulWidget {
  final StokListesiModel? stokListesiModel;
  final KalemModel? kalemModel;
  const KalemEkleView({super.key, this.stokListesiModel, this.kalemModel});

  @override
  State<KalemEkleView> createState() => _KalemEkleViewState();
}

class _KalemEkleViewState extends BaseState<KalemEkleView> {
  KalemEkleViewModel viewModel = KalemEkleViewModel();
  BaseSiparisEditModel get model => BaseSiparisEditModel.instance;
  late final TextEditingController kalemAdiController;
  late final TextEditingController ekAlan1Controller;
  late final TextEditingController ekAlan2Controller;
  late final TextEditingController yapKodController;
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
    viewModel.setKalemModel(widget.kalemModel);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await getData();
      controllerFiller();
    });

    super.initState();
  }

  @override
  void dispose() {
    disposeControllers();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBar(), floatingActionButton: fab(), body: body(context));
  }

  AppBar appBar() {
    return AppBar(
      title: Observer(builder: (_) {
        return AppBarTitle(title: "Kalem Ekle", subtitle: viewModel.model?.stokAdi ?? "");
      }),
      actions: [
        IconButton(
            onPressed: () async {
              await bottomSheetDialogManager.showBottomSheetDialog(context,
                  title: "Seçenekler", children: [BottomSheetModel(title: "Döviz Kurları", iconWidget: Icons.money_outlined, onTap: () => Get.toNamed("/dovizKurlari"))]);
            },
            icon: const Icon(Icons.more_vert_outlined)),
        IconButton(
            onPressed: () {
              if (formKey.currentState?.validate() ?? false) {
                if (yetkiController.lokalDepoUygulamasiAcikMi != true) {
                  viewModel.kalemModel.depoKodu = 0;
                }
                if (!viewModel.dovizliMi) {
                  viewModel.kalemModel.dovizKuru = null;
                  viewModel.kalemModel.dovizFiyati = null;
                }
                viewModel.kalemModel.kalemList?.map((e) => e.miktar = viewModel.kalemModel.miktar2).toList();
                BaseSiparisEditModel.instance.kalemList ??= [];
                if (BaseSiparisEditModel.instance.kalemList?.any((element) => element.stokKodu == viewModel.kalemModel.stokKodu) ?? false) {
                  //replace
                  BaseSiparisEditModel.instance.kalemList?[BaseSiparisEditModel.instance.kalemList?.indexWhere((element) => element.stokKodu == viewModel.kalemModel.stokKodu) ?? 0] =
                      viewModel.kalemModel..paketMi = widget.stokListesiModel?.paketMi;
                } else {
                  BaseSiparisEditModel.instance.kalemList?.add(viewModel.kalemModel..paketMi = widget.stokListesiModel?.paketMi);
                }
                dialogManager.showSuccessSnackBar("Kalem Eklendi");
                Get.back();
              } else {
                dialogManager.showErrorSnackBar("Lütfen gerekli alanları doldurunuz");
              }
            },
            icon: const Icon(Icons.save_outlined)),
      ],
    );
  }

  FloatingActionButton fab() {
    return FloatingActionButton(
      onPressed: () async {
        dialogManager.showStokGridViewDialog(viewModel.model);
      },
      child: const Icon(Icons.open_in_new_outlined),
    );
  }

  Padding body(BuildContext context) {
    return Padding(
      padding: UIHelper.lowPadding,
      child: Column(
        children: [
          Card(
            child: Observer(
                builder: (_) => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: Text.rich(
                                    TextSpan(children: [const TextSpan(text: "Stok Kodu: "), TextSpan(text: viewModel.model?.stokKodu ?? "", style: const TextStyle(fontWeight: FontWeight.bold))]))),
                            Expanded(
                                child: Text.rich(TextSpan(children: [
                              const TextSpan(text: "StkBakiye: "),
                              TextSpan(
                                  text: "${viewModel.model?.bakiye.toIntIfDouble.toStringIfNotNull ?? "0"} ${viewModel.model?.olcuBirimi ?? viewModel.kalemModel.olcuBirimAdi ?? ""}",
                                  style: const TextStyle(fontWeight: FontWeight.bold))
                            ]))),
                          ],
                        ).paddingSymmetric(horizontal: UIHelper.lowSize).paddingOnly(top: UIHelper.lowSize),
                        Row(
                          children: [
                            Expanded(child: Observer(builder: (_) {
                              return Text.rich(TextSpan(children: [
                                const TextSpan(text: "Brüt Tutar: "),
                                TextSpan(
                                    text:
                                        "${viewModel.kalemModel.brutTutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency ${(viewModel.showDovizBilgileri) ? '\n(${viewModel.kalemModel.dovizBrutTutar.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${viewModel.dovizAdi})' : ""}",
                                    style: const TextStyle(fontWeight: FontWeight.bold))
                              ]));
                            })),
                            Expanded(child: Observer(builder: (_) {
                              return Text.rich(TextSpan(children: [
                                const TextSpan(text: "MF. Tutarı: "),
                                TextSpan(
                                    text:
                                        "${viewModel.kalemModel.mfTutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency ${(viewModel.showDovizBilgileri) ? '\n(${viewModel.kalemModel.dovizMfTutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${viewModel.dovizAdi})' : ""}",
                                    style: const TextStyle(fontWeight: FontWeight.bold))
                              ]));
                            })),
                          ],
                        ).paddingSymmetric(horizontal: UIHelper.lowSize),
                        Row(
                          children: [
                            Expanded(
                                child: Text.rich(TextSpan(children: [
                              const TextSpan(text: "İsk. Tutarı: "),
                              TextSpan(
                                  text:
                                      "${viewModel.kalemModel.iskontoTutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency ${(viewModel.showDovizBilgileri) ? '\n(${viewModel.kalemModel.dovizIskontoTutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${viewModel.dovizAdi})' : ""}",
                                  style: const TextStyle(fontWeight: FontWeight.bold))
                            ]))),
                            Expanded(child: Observer(builder: (_) {
                              return Text.rich(TextSpan(children: [
                                const TextSpan(text: "Ara Toplam: "),
                                TextSpan(
                                    text:
                                        "${viewModel.kalemModel.araToplamTutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency ${(viewModel.showDovizBilgileri) ? '\n(${viewModel.kalemModel.dovizAraToplamTutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${viewModel.dovizAdi})' : ""}",
                                    style: const TextStyle(fontWeight: FontWeight.bold))
                              ]));
                            })),
                          ],
                        ).paddingSymmetric(horizontal: UIHelper.lowSize),
                        Row(
                          children: [
                            Expanded(child: Observer(builder: (_) {
                              return Text.rich(TextSpan(children: [
                                const TextSpan(text: "KDV Tutarı: "),
                                TextSpan(
                                    text:
                                        "${viewModel.kalemModel.kdvTutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency ${(viewModel.showDovizBilgileri) ? '\n(${(viewModel.kalemModel.kdvTutari / (viewModel.kalemModel.dovizKuru ?? 1)).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${viewModel.dovizAdi})' : ""}",
                                    style: const TextStyle(fontWeight: FontWeight.bold))
                              ]));
                            })),
                            Expanded(child: Observer(builder: (_) {
                              return Text.rich(TextSpan(children: [
                                const TextSpan(text: "Genel Toplam: "),
                                TextSpan(
                                    text:
                                        "${viewModel.kalemModel.genelToplamTutari.commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} $mainCurrency ${(viewModel.showDovizBilgileri) ? '\n(${(viewModel.kalemModel.genelToplamTutari / (viewModel.kalemModel.dovizKuru ?? 1)).commaSeparatedWithDecimalDigits(OndalikEnum.tutar)} ${viewModel.dovizAdi})' : ""}",
                                    style: const TextStyle(fontWeight: FontWeight.bold))
                              ]));
                            })),
                          ],
                        ).paddingSymmetric(horizontal: UIHelper.lowSize),
                        Card(
                            color: theme.colorScheme.primary.withOpacity(0.1),
                            child: Center(
                              child: Text.rich(TextSpan(children: [const TextSpan(text: "Son Fiyat: "), TextSpan(text: "0.00 $mainCurrency", style: const TextStyle(fontWeight: FontWeight.bold))]))
                                  .paddingOnly(top: UIHelper.lowSize),
                            ))
                      ],
                    )),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Observer(builder: (_) {
                      return Row(
                        children: [
                          Expanded(child: CustomTextField(labelText: "Kalem Adı", controller: kalemAdiController, onChanged: (p0) => viewModel.kalemModel.stokAdi = p0)),
                          Expanded(
                              child: CustomTextField(
                                  labelText: "Muh. Kodu",
                                  suffixMore: true,
                                  readOnly: true,
                                  onClear: () => viewModel.setMuhasebeKodu(null),
                                  // suffix: IconButton(
                                  //     onPressed: () {
                                  //       muhKoduController.clear();
                                  //       viewModel.setMuhasebeKodu(null);
                                  //     },
                                  //     icon: const Icon(Icons.close)),
                                  controller: muhKoduController,
                                  valueWidget: Observer(builder: (_) => Text(viewModel.kalemModel.muhasebeKodu ?? "")),
                                  onTap: () async {
                                    var result = await bottomSheetDialogManager.showMuhasebeKoduBottomSheetDialog(context);
                                    if (result != null) {
                                      muhKoduController.text = result.adi ?? "";
                                      viewModel.setMuhasebeKodu((StaticVariables.instance.isMusteriSiparisleri ? result.satisHesabi : result.satisHesabi) ?? "");
                                    }
                                  })).yetkiVarMi((viewModel.kalemModel.stokKodu?.startsWith("HIZ") ?? false) && yetkiController.siparisHizmetAktifMi),
                        ],
                      );
                    }),
                    CustomTextField(labelText: "Ek Alan 1", onChanged: (p0) => viewModel.kalemModel.ekalan1 = p0).yetkiVarMi(yetkiController.siparisEkAlan1AktifMi),
                    CustomTextField(labelText: "Ek Alan 2", onChanged: (p0) => viewModel.kalemModel.ekalan2 = p0).yetkiVarMi(yetkiController.siparisSatirdaEkAlan2AktifMi),
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
                          var result = await Get.toNamed("/mainPage/yapilandirmaRehberi",
                              arguments: widget.stokListesiModel ?? viewModel.model ?? StokListesiModel()
                                ..stokKodu = viewModel.kalemModel.stokKodu);
                          if (result is YapilandirmaRehberiModel) {
                            yapKodController.text = result.yapacik ?? "";
                            viewModel.setYapKod(result.yapkod);
                          }
                        }).yetkiVarMi(widget.stokListesiModel?.yapkod != null || widget.kalemModel?.yapkod != null),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: CustomTextField(
                                labelText: "Teslim Tarihi",
                                controller: teslimTarihiController,
                                readOnly: true,
                                onClear: () => viewModel.kalemModel.teslimTarihi = null,
                                onTap: () async {
                                  var result = await dialogManager.showDateTimePicker();
                                  if (result != null) {
                                    teslimTarihiController.text = result.toDateString;
                                    viewModel.kalemModel.teslimTarihi = result;
                                  }
                                },
                                suffix: Row(mainAxisSize: MainAxisSize.min, children: [
                                  IconButton(
                                      onPressed: () async {
                                        var result = await dialogManager.showDateTimePicker();
                                        if (result != null) {
                                          teslimTarihiController.text = result.toDateString;
                                          viewModel.kalemModel.teslimTarihi = result;
                                        }
                                      },
                                      icon: const Icon(Icons.calendar_today_outlined))
                                ]))).yetkiVarMi(yetkiController.siparisSatirdaTeslimTarihiSor),
                        Expanded(
                            child: CustomTextField(
                          labelText: "Koşul",
                          readOnly: true,
                          suffixMore: true,
                          valueWidget: Observer(builder: (_) => Text(viewModel.kalemModel.kosulKodu ?? "")),
                          controller: kosulController,
                          onTap: () async {
                            var result = await bottomSheetDialogManager.showKosullarBottomSheetDialog(context);
                            if (result != null) {
                              kosulController.text = result.genelKosulAdi ?? result.kosulKodu ?? "";
                              viewModel.setKosul(result.kosulKodu ?? "");
                            }
                          },
                        )).yetkiVarMi(yetkiController.siparisKosulSatirdaSor),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: CustomTextField(
                          labelText: "Depo",
                          controller: depoController,
                          isMust: true,
                          readOnly: true,
                          suffixMore: true,
                          onClear: () => viewModel.setDepoKodu(null),
                          valueWidget: Observer(builder: (_) => Text(viewModel.kalemModel.depoKodu.toStringIfNotNull ?? "")),
                          onTap: () async {
                            var result = await bottomSheetDialogManager.showDepoBottomSheetDialog(context);
                            if (result != null) {
                              depoController.text = result.depoTanimi ?? result.depoKodu.toStringIfNotNull ?? "";
                              viewModel.kalemModel.depoTanimi = result.depoTanimi;
                              if (result.depoKodu != null) {
                                viewModel.setDepoKodu(result.depoKodu!);
                              }
                            }
                          },
                        )).yetkiVarMi(yetkiController.lokalDepoUygulamasiAcikMi),
                        Expanded(
                            child: CustomTextField(
                          labelText: "Proje",
                          controller: projeController,
                          isMust: true,
                          readOnly: true,
                          suffixMore: true,
                          valueWidget: Observer(builder: (_) => Text(viewModel.kalemModel.projeKodu ?? "")),
                          onTap: () async {
                            var result = await bottomSheetDialogManager.showProjeBottomSheetDialog(context);
                            if (result != null) {
                              projeController.text = result.projeAciklama ?? result.projeKodu ?? "";
                              viewModel.setProjeKodu(result.projeKodu ?? "");
                            }
                          },
                        )).yetkiVarMi(yetkiController.projeUygulamasiAcikMi),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: Observer(builder: (_) {
                          return CustomTextField(
                            enabled: !viewModel.koliMi,
                            labelText: "Miktar",
                            isMust: true,
                            controller: viewModel.koliMi ? null : miktarController,
                            keyboardType: TextInputType.number,
                            onChanged: (value) => viewModel.setMiktar(int.tryParse(value) ?? 0),
                            suffix: Wrap(children: [
                              IconButton(icon: const Icon(Icons.remove_outlined), onPressed: () => viewModel.decreaseMiktar(miktarController)),
                              IconButton(icon: const Icon(Icons.add_outlined), onPressed: () => viewModel.increaseMiktar(miktarController)),
                            ]),
                          );
                        })),
                        Expanded(child: Observer(builder: (_) {
                          return CustomTextField(
                            labelText: "Miktar 2",
                            controller: miktar2Controller,
                            keyboardType: TextInputType.number,
                            validator: miktar2Validator,
                            isMust: viewModel.model?.koliMi,
                            onChanged: (value) => viewModel.setMiktar2(int.tryParse(value) ?? 0),
                            suffix: Wrap(children: [
                              IconButton(icon: const Icon(Icons.remove_outlined), onPressed: () => viewModel.decreaseMiktar2(miktar2Controller)),
                              IconButton(icon: const Icon(Icons.add_outlined), onPressed: () => viewModel.increaseMiktar2(miktar2Controller)),
                            ]),
                          );
                        })),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: CustomTextField(
                          labelText: "Mal. Faz. Miktar",
                          controller: malFazMiktarController,
                          suffix: Wrap(children: [
                            IconButton(icon: const Icon(Icons.remove_outlined), onPressed: () => viewModel.decreaseMFMiktar(malFazMiktarController)),
                            IconButton(icon: const Icon(Icons.add_outlined), onPressed: () => viewModel.increaseMFMiktar(malFazMiktarController)),
                          ]),
                        )),
                        Expanded(
                            child: CustomTextField(
                                labelText: "Ölçü Birimi",
                                readOnly: true,
                                suffixMore: true,
                                controller: olcuBirimiController,
                                valueWidget: Observer(builder: (_) => Text(viewModel.kalemModel.olcuBirimKodu.toStringIfNotNull ?? "")),
                                onClear: () => viewModel.setOlcuBirimi(null),
                                onTap: () async {
                                  var result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                                      title: "Ölçü Birimi Seçiniz",
                                      children: List.generate(
                                          viewModel.olcuBirimiMap.length,
                                          (index) => BottomSheetModel(
                                              title: viewModel.olcuBirimiMap[index], description: index.toStringIfNotNull, value: MapEntry<String, int>(viewModel.olcuBirimiMap[index], index))));
                                  if (result != null && result is MapEntry<String, int>) {
                                    viewModel.setOlcuBirimi(result);
                                    olcuBirimiController.text = result.key;
                                  }
                                })),
                      ],
                    ),
                    Observer(builder: (_) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: CustomTextField(
                            labelText: "Döviz Tipi",
                            controller: dovizTipiController,
                            isMust: true,
                            readOnly: true,
                            suffixMore: true,
                            onClear: () => viewModel.kalemModel.dovizTipi = null,
                            onTap: () async {
                              var result = await bottomSheetDialogManager.showDovizBottomSheetDialog(context);
                              if (result != null) {
                                if (result.dovizTipi == 0) {
                                  viewModel.setShowDovizBilgileri(false);
                                } else {
                                  viewModel.setShowDovizBilgileri(true);
                                }
                                viewModel.kalemModel.dovizTipi = result.dovizKodu;
                                viewModel.setDovizAdi(result.isim ?? "");
                                dovizTipiController.text = result.isim ?? "";
                                getDovizData();
                              }
                            },
                          )).yetkiVarMi(widget.stokListesiModel?.dovizliMi ?? false),
                          Expanded(
                              child: CustomTextField(
                            labelText: "Döviz Kuru",
                            isMust: true,
                            controller: dovizKuruController,
                            isFormattedString: true,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            onChanged: (value) {
                              viewModel.kalemModel.dovizKuru = value.toDoubleWithFormattedString;
                              viewModel.setBrutFiyat((viewModel.kalemModel.dovizFiyati ?? 0) * (viewModel.kalemModel.dovizKuru ?? 1));
                              fiyatController.text = viewModel.kalemModel.brutFiyat.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati);
                            },
                          )).yetkiVarMi((widget.stokListesiModel?.dovizliMi ?? false) && viewModel.showDovizBilgileri),
                        ],
                      );
                    }),
                    Observer(
                        builder: (_) => CustomTextField(
                            labelText: "Döviz Fiyatı",
                            isMust: true,
                            controller: dovizFiyatiController,
                            keyboardType: const TextInputType.numberWithOptions(decimal: true),
                            isFormattedString: true,
                            onChanged: (p0) {
                              viewModel.setDovizFiyati(p0.toDoubleWithFormattedString);
                              viewModel.setBrutFiyat((viewModel.kalemModel.dovizFiyati ?? 0) * (viewModel.kalemModel.dovizKuru ?? 1));
                              fiyatController.text = viewModel.kalemModel.brutFiyat.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati);
                            }).yetkiVarMi((widget.stokListesiModel?.dovizliMi ?? false) && viewModel.showDovizBilgileri)),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            child: CustomTextField(
                          enabled: yetkiController.siparisSatirdaKDVSor,
                          labelText: "KDV Oranı",
                          controller: kdvOraniController,
                          isMust: true,
                          keyboardType: const TextInputType.numberWithOptions(decimal: true),
                          isFormattedString: true,
                          onChanged: (p0) => viewModel.setKdvOrani(p0.toDoubleWithFormattedString),
                          suffix: IconButton(
                            icon: const Icon(Icons.more_horiz_outlined),
                            onPressed: () async {
                              var result = await bottomSheetDialogManager.showKdvOranlariBottomSheetDialog(context);
                              if (result != null) {
                                viewModel.setKdvOrani(result);
                                kdvOraniController.text = result.toIntIfDouble.toStringIfNotNull ?? "";
                                // kdvOraniController.value = TextEditingValue(text: result.toIntIfDouble.toStringIfNotNull ?? "");
                                // kdvOraniController.buildTextSpan(context: context, withComposing: true);
                              }
                            },
                          ),
                        )),
                        Expanded(
                            child: CustomTextField(
                                labelText: "Fiyat",
                                controller: fiyatController,
                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                isFormattedString: true,
                                onChanged: (p0) {
                                  viewModel.setBrutFiyat(p0.toDoubleWithFormattedString);
                                  if (viewModel.model?.dovizliMi ?? false) {
                                    viewModel.setDovizFiyati((viewModel.kalemModel.brutFiyat ?? 0) / (viewModel.kalemModel.dovizKuru ?? 1));
                                    dovizFiyatiController.text = viewModel.kalemModel.dovizFiyati.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati);
                                  }
                                })),
                      ],
                    ),
                    ...List.generate(yetkiController.siparisSatirKademeliIskontoSayisi > 6 ? 6 : yetkiController.siparisSatirKademeliIskontoSayisi, (index) {
                      return Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                              child: CustomTextField(
                                  labelText: "İsk.${index + 1}${index != 0 ? " %" : ""}",
                                  controller: iskontoController(index + 1),
                                  keyboardType: TextInputType.number,
                                  isFormattedString: true,
                                  suffix: yetkiController.siparisMSISk1YuzdeSor && index == 0
                                      ? Observer(builder: (_) {
                                          return IconButton(
                                              onPressed: () => viewModel.setIskonto1OranMi(),
                                              icon: Icon((viewModel.kalemModel.iskonto1OranMi ?? false) ? Icons.percent_outlined : Icons.payments_outlined));
                                        })
                                      : null,
                                  onChanged: (p0) => setIskonto(index + 1, p0))),
                          Expanded(
                              child: CustomTextField(
                            labelText: "İsk.Tipi ${index + 1}",
                            readOnly: true,
                            suffixMore: true,
                            keyboardType: TextInputType.number,
                            controller: iskontoTipiController(index + 1),
                            onClear: () => iskontoFiller(index + 1, null),
                            onTap: () async {
                              var result = await bottomSheetDialogManager.showIskontoTipiBottomSheetDialog(context);
                              if (result != null) {
                                iskontoFiller(index + 1, result);
                              }
                            },
                          )),
                        ],
                      ).yetkiVarMi(true);
                    }),
                    Text("Ek Açıklamalar", style: TextStyle(fontSize: UIHelper.highSize)).paddingSymmetric(vertical: UIHelper.lowSize).yetkiVarMi(yetkiController.siparisMSSatirAciklamaAlanlari(null)),
                    CustomTextField(labelText: getAciklamaLabel(1), onChanged: (value) => viewModel.kalemModel.aciklama1).yetkiVarMi(yetkiController.siparisMSSatirAciklamaAlanlari(1)),
                    CustomTextField(labelText: getAciklamaLabel(2), onChanged: (value) => viewModel.kalemModel.aciklama2).yetkiVarMi(yetkiController.siparisMSSatirAciklamaAlanlari(2)),
                    CustomTextField(labelText: getAciklamaLabel(3), onChanged: (value) => viewModel.kalemModel.aciklama3).yetkiVarMi(yetkiController.siparisMSSatirAciklamaAlanlari(3)),
                    CustomTextField(labelText: getAciklamaLabel(4), onChanged: (value) => viewModel.kalemModel.aciklama4).yetkiVarMi(yetkiController.siparisMSSatirAciklamaAlanlari(4)),
                    CustomTextField(labelText: getAciklamaLabel(5), onChanged: (value) => viewModel.kalemModel.aciklama5).yetkiVarMi(yetkiController.siparisMSSatirAciklamaAlanlari(5)),
                    CustomTextField(labelText: getAciklamaLabel(6), onChanged: (value) => viewModel.kalemModel.aciklama6).yetkiVarMi(yetkiController.siparisMSSatirAciklamaAlanlari(6)),
                    CustomTextField(labelText: getAciklamaLabel(7), onChanged: (value) => viewModel.kalemModel.aciklama7).yetkiVarMi(yetkiController.siparisMSSatirAciklamaAlanlari(7)),
                    CustomTextField(labelText: getAciklamaLabel(8), onChanged: (value) => viewModel.kalemModel.aciklama8).yetkiVarMi(yetkiController.siparisMSSatirAciklamaAlanlari(8)),
                    CustomTextField(labelText: getAciklamaLabel(9), onChanged: (value) => viewModel.kalemModel.aciklama9).yetkiVarMi(yetkiController.siparisMSSatirAciklamaAlanlari(9)),
                    CustomTextField(labelText: getAciklamaLabel(10), onChanged: (value) => viewModel.kalemModel.aciklama10).yetkiVarMi(yetkiController.siparisMSSatirAciklamaAlanlari(10)),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String? miktar2Validator(p0) {
    if (viewModel.model?.koliMi == true) {
      if (p0 == "" || p0 == null) {
        return "Lütfen miktar giriniz";
      } else if (p0 == "0") {
        return "Miktar Sıfır olamaz";
      }
    }
    return null;
  }

  String getAciklamaLabel(int index) => "${StaticVariables.instance.isMusteriSiparisleri ? "MS" : "SS"} $index";

  Future<void> getData() async {
    if (widget.stokListesiModel != null) {
      viewModel.setModel(widget.stokListesiModel!);
    } else if (widget.kalemModel != null) {
      viewModel.setKalemModel(widget.kalemModel!);
    } else {
      var result = await Get.toNamed("/mainPage/stokListesi", arguments: true);
      if (result is StokListesiModel) {
        viewModel.setModel(result);
      }
      // var stokResult = await networkManager.dioGet(path: ApiUrls.getStokFiyatOzeti, bodyModel: bodyModel)
    }
  }

  Future<void> getDovizData() async {
    if (viewModel.dovizliMi) {
      var dovizResult = await networkManager.dioGet(
          path: ApiUrls.getDovizKurlari, bodyModel: DovizKurlariModel(), queryParameters: {"EkranTipi": "D", "DovizTipi": viewModel.kalemModel.dovizKodu, "Tarih": DateTime.now().toDateString});
      if (dovizResult.data != null && viewModel.kalemModel.dovizTipi != null) {
        List<DovizKurlariModel> list = dovizResult.data.map((e) => e as DovizKurlariModel).toList().cast<DovizKurlariModel>();
        var result = list.firstWhereOrNull((element) => element.dovizTipi == viewModel.kalemModel.dovizTipi);
        if (result != null) {
          if (parametreModel.satisDovizTakipHangiDeger == 1) {
            viewModel.kalemModel.dovizKuru = result.dovAlis;
          } else if (parametreModel.satisDovizTakipHangiDeger == 2) {
            viewModel.kalemModel.dovizKuru = result.dovSatis;
          } else if (parametreModel.satisDovizTakipHangiDeger == 3) {
            viewModel.kalemModel.dovizKuru = result.effAlis;
          } else if (parametreModel.satisDovizTakipHangiDeger == 4) {
            viewModel.kalemModel.dovizKuru = result.effSatis;
          }
          //TODO EFEKTİF Mİ DEĞİL Mİ ? NEYE GÖRE YAPACAĞINI ZEKİ ABİ'YE SOR
          dovizKuruController.text = viewModel.kalemModel.dovizKuru.commaSeparatedWithDecimalDigits(OndalikEnum.dovizFiyati);
          viewModel.kalemModel.dovizFiyati = (viewModel.kalemModel.brutFiyat ?? 0) / (viewModel.kalemModel.dovizKuru ?? 1);
          dovizFiyatiController.text = viewModel.kalemModel.dovizFiyati.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari);
        } else {
          viewModel.kalemModel.dovizKuru = null;
          viewModel.kalemModel.dovizFiyati = null;
          dovizKuruController.text = "";
          dovizFiyatiController.text = "";
        }
      }
    }
  }

  void initControllers() {
    kalemAdiController = TextEditingController();
    ekAlan1Controller = TextEditingController();
    ekAlan2Controller = TextEditingController();
    yapKodController = TextEditingController();
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
  }

  Future<void> controllerFiller() async {
    viewModel.kalemModel.kalemList ??= widget.stokListesiModel?.stokList?.map((e) => KalemModel.fromStokList(e)).toList();
    viewModel.kalemModel.stokKodu ??= widget.stokListesiModel?.stokKodu ?? widget.kalemModel?.stokKodu;
    viewModel.kalemModel.stokSatDovizAdi ??= widget.stokListesiModel?.satisDovizAdi ?? widget.kalemModel?.stokSatDovizAdi;
    viewModel.kalemModel.stokAlisDovizAdi ??= widget.stokListesiModel?.alisDovizAdi ?? widget.kalemModel?.stokAlisDovizAdi;
    viewModel.kalemModel.stokSatDovTip ??= widget.stokListesiModel?.satDovTip ?? viewModel.model?.satDovTip;
    viewModel.setYapKod(widget.stokListesiModel?.yapkod ?? widget.kalemModel?.yapkod);
    viewModel.kalemModel.stokAlisDovTip ??= widget.stokListesiModel?.alisDovTip;
    viewModel.kalemModel.dovizTipi ??= StaticVariables.instance.isMusteriSiparisleri ? viewModel.model?.satDovTip : viewModel.model?.alisDovTip;
    kalemAdiController.text = widget.stokListesiModel?.stokAdi ?? widget.stokListesiModel?.stokKodu ?? widget.kalemModel?.stokAdi ?? widget.kalemModel?.stokKodu ?? "";
    ekAlan1Controller.text = widget.kalemModel?.ekalan1 ?? "";
    ekAlan2Controller.text = widget.kalemModel?.ekalan2 ?? "";
    yapKodController.text = widget.stokListesiModel?.yapkodAciklama ?? widget.stokListesiModel?.yapkod ?? widget.kalemModel?.yapkod ?? "";
    isk1Controller?.text = widget.kalemModel?.iskonto1.toIntIfDouble.toStringIfNotNull ?? "";
    isk1TipiController?.text = getIskTipiAciklama(widget.kalemModel?.isk1Tipi.toIntIfDouble);
    isk2YuzdeController?.text = widget.kalemModel?.iskonto2.toIntIfDouble.toStringIfNotNull ?? "";
    isk2TipiController?.text = getIskTipiAciklama(widget.kalemModel?.isk2Tipi.toIntIfDouble);
    isk3YuzdeController?.text = widget.kalemModel?.iskonto3.toIntIfDouble.toStringIfNotNull ?? "";
    isk3TipiController?.text = getIskTipiAciklama(widget.kalemModel?.isk3Tipi.toIntIfDouble);
    isk4YuzdeController?.text = widget.kalemModel?.iskonto4.toIntIfDouble.toStringIfNotNull ?? "";
    isk4TipiController?.text = getIskTipiAciklama(widget.kalemModel?.isk4Tipi.toIntIfDouble);
    isk5YuzdeController?.text = widget.kalemModel?.iskonto5.toIntIfDouble.toStringIfNotNull ?? "";
    isk5TipiController?.text = getIskTipiAciklama(widget.kalemModel?.isk5Tipi.toIntIfDouble);
    isk6YuzdeController?.text = widget.kalemModel?.iskonto6.toIntIfDouble.toStringIfNotNull ?? "";
    isk6TipiController?.text = getIskTipiAciklama(widget.kalemModel?.isk6Tipi.toIntIfDouble);
    fiyatController.text = (widget.kalemModel?.brutFiyat.toIntIfDouble ?? viewModel.model?.bulunanFiyat.toIntIfDouble)?.commaSeparatedWithDecimalDigits(OndalikEnum.tutar) ?? "";
    miktarController.text = viewModel.kalemModel.miktar?.toIntIfDouble.toStringIfNotNull ?? "";
    miktar2Controller.text = viewModel.kalemModel.miktar2?.toIntIfDouble.toStringIfNotNull ?? "";
    malFazMiktarController.text = viewModel.kalemModel.malFazlasiMiktar?.toIntIfDouble.toStringIfNotNull ?? "";
    olcuBirimiController.text = widget.stokListesiModel?.olcuBirimi ?? widget.kalemModel?.olcuBirimAdi ?? "";
    kdvOraniController.text = widget.kalemModel?.kdvOrani.commaSeparatedWithDecimalDigits(OndalikEnum.oran) ??
        (StaticVariables.instance.isMusteriSiparisleri ? (widget.stokListesiModel?.satisKdv ?? 0) : (widget.stokListesiModel?.alisKdv ?? 0)).commaSeparatedWithDecimalDigits(OndalikEnum.oran);
    // projeController.text = teslimTarihiController.text = model.teslimTarihi.toDateString;
    kosulController.text = model.kosulKodu ?? BaseSiparisEditModel.instance.kosulKodu ?? "";
    dovizTipiController.text = (StaticVariables.instance.isMusteriSiparisleri ? viewModel.model?.satisDovizAdi : viewModel.model?.alisDovizAdi) ?? "";
    dovizFiyatiController.text = viewModel.kalemModel.dovizFiyati.commaSeparatedWithDecimalDigits(OndalikEnum.dovizTutari);
    if (yetkiController.projeUygulamasiAcikMi) {
      projeController.text = BaseSiparisEditModel.instance.projeAciklama ?? "";
      viewModel.kalemModel.projeKodu = model.projeKodu;
    }
    viewModel.kalemModel.stokAdi = widget.stokListesiModel?.stokAdi ?? widget.stokListesiModel?.stokKodu ?? widget.kalemModel?.stokAdi ?? widget.kalemModel?.stokKodu ?? "";
    viewModel.kalemModel.stokKodu = widget.stokListesiModel?.stokKodu ?? widget.kalemModel?.stokKodu ?? "";
    viewModel.kalemModel.kosulKodu = model.kosulKodu;
    viewModel.kalemModel.teslimTarihi = yetkiController.siparisSatirdaTeslimTarihiSor ? BaseSiparisEditModel.instance.teslimTarihi : null;
    viewModel.setShowDovizBilgileri(widget.stokListesiModel?.dovizliMi ?? false);
    viewModel.setOlcuBirimi(MapEntry<String, int>(widget.stokListesiModel?.olcuBirimi ?? widget.kalemModel?.olcuBirimAdi ?? "", 0));
    if (widget.kalemModel == null) {
      viewModel.setKosul(model.kosulKodu ?? "");
      if (yetkiController.projeUygulamasiAcikMi) {
        viewModel.setProjeKodu(model.projeKodu ?? "");
      }
      viewModel.setFiyat(fiyatController.text.toDoubleWithFormattedString);
      viewModel.setBrutFiyat(fiyatController.text.toDoubleWithFormattedString);
      viewModel.setMiktar(int.tryParse(miktarController.text) ?? 0);
      viewModel.setMiktar2(int.tryParse(miktar2Controller.text) ?? 0);
      viewModel.setMFMiktar(int.tryParse(malFazMiktarController.text) ?? 0);
      viewModel.setKdvOrani(double.tryParse(kdvOraniController.text) ?? 0);
      viewModel.setIskonto1(double.tryParse(isk1Controller?.text ?? "") ?? 0);
      viewModel.setIskonto2(double.tryParse(isk2YuzdeController?.text ?? "") ?? 0);
      viewModel.setIskonto3(double.tryParse(isk3YuzdeController?.text ?? "") ?? 0);
      viewModel.setIskonto4(double.tryParse(isk4YuzdeController?.text ?? "") ?? 0);
      viewModel.setIskonto5(double.tryParse(isk5YuzdeController?.text ?? "") ?? 0);
      viewModel.setIskonto6(double.tryParse(isk6YuzdeController?.text ?? "") ?? 0);
    }
    viewModel.kalemModel.depoKodu ??= BaseSiparisEditModel.instance.topluDepo ?? viewModel.model?.depoKodu ?? parametreModel.satisHizmetDepoKodu;
    viewModel.kalemModel.depoTanimi = (parametreModel.depoList?.where((element) => element.depoKodu == viewModel.kalemModel.depoKodu).firstOrNull?.depoTanimi ?? "");
    depoController.text = viewModel.kalemModel.depoTanimi ?? "";
    viewModel.kalemModel.depoTanimi ??= depoController.text;
    await getDovizData();
  }

  void disposeControllers() {
    kalemAdiController.dispose();
    ekAlan1Controller.dispose();
    ekAlan2Controller.dispose();
    yapKodController.dispose();
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
  }

  String getIskTipiAciklama(num? value) => parametreModel.listIskTip?.firstWhereOrNull((element) => element.iskontoTipi == value)?.aciklama ?? "";

  void iskontoFiller(int index, ListIskTip? iskTip) {
    switch (index) {
      case 1:
        isk1TipiController?.text = iskTip?.aciklama ?? "";
        viewModel.kalemModel.isk1Tipi = iskTip?.iskontoTipi;
        break;
      case 2:
        isk2TipiController?.text = iskTip?.aciklama ?? "";
        viewModel.kalemModel.isk2Tipi = iskTip?.iskontoTipi;
        break;
      case 3:
        isk3TipiController?.text = iskTip?.aciklama ?? "";
        viewModel.kalemModel.isk3Tipi = iskTip?.iskontoTipi;
        break;
      case 4:
        isk4TipiController?.text = iskTip?.aciklama ?? "";
        viewModel.kalemModel.isk4Tipi = iskTip?.iskontoTipi;
        break;
      case 5:
        isk5TipiController?.text = iskTip?.aciklama ?? "";
        viewModel.kalemModel.isk5Tipi = iskTip?.iskontoTipi;
        break;
      case 6:
        isk6TipiController?.text = iskTip?.aciklama ?? "";
        viewModel.kalemModel.isk6Tipi = iskTip?.iskontoTipi;
        break;
      default:
    }
  }

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

  String get getDovizAdi => StaticVariables.instance.isMusteriSiparisleri ? (viewModel.kalemModel.stokSatDovizAdi ?? "") : (viewModel.kalemModel.stokAlisDovizAdi ?? "");

  void setIskonto(int index, String value) {
    switch (index) {
      case 1:
        viewModel.setIskonto1(double.tryParse(value) ?? 0);
        break;
      case 2:
        viewModel.setIskonto2(double.tryParse(value) ?? 0);
        break;
      case 3:
        viewModel.setIskonto3(double.tryParse(value) ?? 0);
        break;
      case 4:
        viewModel.setIskonto4(double.tryParse(value) ?? 0);
        break;
      case 5:
        viewModel.setIskonto5(double.tryParse(value) ?? 0);
        break;
      case 6:
        viewModel.setIskonto6(double.tryParse(value) ?? 0);
        break;
      default:
    }
  }
}
