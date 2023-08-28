import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/view/main_page/model/param_model.dart";

import "../../../../../view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../../../view/main_page/alt_sayfalar/stok/stok_liste/model/stok_listesi_model.dart";
import "../../../../components/textfield/custom_text_field.dart";
import "../../../../components/wrap/appbar_title.dart";
import "../../../../constants/extensions/date_time_extensions.dart";
import "../../../../constants/extensions/number_extensions.dart";
import "../../../../constants/extensions/widget_extensions.dart";
import "../../../../constants/static_variables/static_variables.dart";
import "../../../../constants/ui_helper/ui_helper.dart";
import "../../../../init/network/login/api_urls.dart";
import "../../../model/doviz_kurlari_model.dart";
import "../../../state/base_state.dart";
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
        IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert_outlined)),
        IconButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                BaseSiparisEditModel.instance.kalemList ??= [];
                if (BaseSiparisEditModel.instance.kalemList!.any((element) => element.stokKodu == viewModel.kalemModel.stokKodu)) {
                  //replace
                  BaseSiparisEditModel.instance.kalemList![BaseSiparisEditModel.instance.kalemList!.indexWhere((element) => element.stokKodu == viewModel.kalemModel.stokKodu)] = viewModel.kalemModel;
                } else {
                  BaseSiparisEditModel.instance.kalemList?.add(viewModel.kalemModel);
                }
                dialogManager.showSnackBar("Kalem Eklendi");
                Get.back();
              } else {
                dialogManager.showSnackBar("Lütfen gerekli alanları doldurunuz");
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

  Column body(BuildContext context) {
    return Column(
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
                                text: "${viewModel.model?.bakiye.toIntIfDouble.toStringIfNull ?? "0"} ${viewModel.model?.olcuBirimi ?? viewModel.kalemModel.olcuBirimAdi ?? ""}",
                                style: const TextStyle(fontWeight: FontWeight.bold))
                          ]))),
                        ],
                      ).paddingSymmetric(horizontal: UIHelper.lowSize).paddingOnly(top: UIHelper.lowSize),
                      Row(
                        children: [
                          Expanded(child: Observer(builder: (_) {
                            return Text.rich(TextSpan(children: [
                              const TextSpan(text: "Brüt Tutar: "),
                              TextSpan(text: "${viewModel.kalemModel.brutTutar.commaSeparatedWithFixedDigits} TL", style: const TextStyle(fontWeight: FontWeight.bold))
                            ]));
                          })),
                          Expanded(child: Observer(builder: (_) {
                            return Text.rich(TextSpan(children: [
                              const TextSpan(text: "MF. Tutarı: "),
                              TextSpan(text: "${viewModel.kalemModel.mfTutari.commaSeparatedWithFixedDigits} TL", style: const TextStyle(fontWeight: FontWeight.bold))
                            ]));
                          })),
                        ],
                      ).paddingSymmetric(horizontal: UIHelper.lowSize),
                      Row(
                        children: [
                          Expanded(
                              child: Text.rich(TextSpan(children: [
                            const TextSpan(text: "İsk. Tutarı: "),
                            TextSpan(text: "${viewModel.kalemModel.iskontoTutari.commaSeparatedWithFixedDigits} TL", style: const TextStyle(fontWeight: FontWeight.bold))
                          ]))),
                          Expanded(child: Observer(builder: (_) {
                            return Text.rich(TextSpan(children: [
                              const TextSpan(text: "Ara Toplam: "),
                              TextSpan(text: "${viewModel.kalemModel.araToplamTutari.commaSeparatedWithFixedDigits} TL", style: const TextStyle(fontWeight: FontWeight.bold))
                            ]));
                          })),
                        ],
                      ).paddingSymmetric(horizontal: UIHelper.lowSize),
                      Row(
                        children: [
                          Expanded(child: Observer(builder: (_) {
                            return Text.rich(TextSpan(children: [
                              const TextSpan(text: "KDV Tutarı: "),
                              TextSpan(text: "${viewModel.kalemModel.kdvTutari.commaSeparatedWithFixedDigits} TL", style: const TextStyle(fontWeight: FontWeight.bold))
                            ]));
                          })),
                          Expanded(child: Observer(builder: (_) {
                            return Text.rich(TextSpan(children: [
                              const TextSpan(text: "Genel Toplam: "),
                              TextSpan(text: "${viewModel.kalemModel.genelToplamTutari.commaSeparatedWithFixedDigits} TL", style: const TextStyle(fontWeight: FontWeight.bold))
                            ]));
                          })),
                        ],
                      ).paddingSymmetric(horizontal: UIHelper.lowSize),
                      Card(
                          color: theme.colorScheme.primary.withOpacity(0.1),
                          child: Center(
                            child: const Text.rich(TextSpan(children: [TextSpan(text: "Son Fiyat: "), TextSpan(text: "0.00 TL", style: TextStyle(fontWeight: FontWeight.bold))]))
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
                                labelText: "Muhasebe Kodu",
                                suffixMore: true,
                                readOnly: true,
                                onTap: () async {
                                  await bottomSheetDialogManager.showMuhasebeKoduBottomSheetDialog(context);
                                })).yetkiVarMi((viewModel.kalemModel.stokKodu?.startsWith("HIZ") ?? false) && yetkiController.siparisHizmetAktifMi),
                      ],
                    );
                  }),
                  CustomTextField(labelText: "Ek Alan 1", onChanged: (p0) => viewModel.kalemModel.ekalan1 = p0),
                  CustomTextField(labelText: "Ek Alan 2", onChanged: (p0) => viewModel.kalemModel.ekalan2 = p0),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                          child: CustomTextField(
                              labelText: "Teslim Tarihi",
                              controller: teslimTarihiController,
                              readOnly: true,
                              suffix: Row(mainAxisSize: MainAxisSize.min, children: [
                                IconButton(
                                    onPressed: () {
                                      teslimTarihiController.clear();
                                      viewModel.kalemModel.teslimTarihi = null;
                                    },
                                    icon: const Icon(Icons.close)),
                                IconButton(
                                    onPressed: () async {
                                      var result = await dialogManager.showDateTimePicker();
                                      if (result != null) {
                                        teslimTarihiController.text = result.toDateString;
                                        viewModel.kalemModel.teslimTarihi = result;
                                      }
                                    },
                                    icon: const Icon(Icons.calendar_today_outlined))
                              ]))),
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
                        valueWidget: Observer(builder: (_) => Text(viewModel.kalemModel.depoKodu.toStringIfNull ?? "")),
                        onTap: () async {
                          var result = await bottomSheetDialogManager.showDepoBottomSheetDialog(context);
                          if (result != null) {
                            depoController.text = result.depoTanimi ?? result.depoKodu.toStringIfNull ?? "";
                            viewModel.kalemModel.depoTanimi = result.depoTanimi;
                            if (result.depoKodu != null) {
                              viewModel.setDepoKodu(result.depoKodu!);
                            }
                          }
                        },
                      )),
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
                      Expanded(
                          child: CustomTextField(
                        labelText: "Döviz Tipi",
                        controller: dovizTipiController,
                        isMust: true,
                        readOnly: true,
                        suffixMore: true,
                        onTap: () async {
                          var result = await bottomSheetDialogManager.showDovizBottomSheetDialog(context);
                          if (result != null) {
                            dovizTipiController.text = result.isim ?? "";
                            viewModel.kalemModel.dovizTipi = result.dovizKodu;
                          }
                        },
                      )).yetkiVarMi(widget.stokListesiModel?.dovizliMi ?? false),
                      Expanded(child: CustomTextField(labelText: "Döviz Kuru", controller: dovizKuruController, keyboardType: TextInputType.number))
                          .yetkiVarMi(widget.stokListesiModel?.dovizliMi ?? false),
                    ],
                  ),
                  CustomTextField(
                      labelText: "Döviz Fiyatı",
                      controller: dovizFiyatiController,
                      keyboardType: TextInputType.number,
                      onChanged: (p0) => viewModel.kalemModel.dovizFiyati = double.tryParse(p0)).yetkiVarMi(widget.stokListesiModel?.dovizliMi ?? false),
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
                              valueWidget: Observer(builder: (_) => Text(viewModel.kalemModel.olcuBirimKodu.toStringIfNull ?? "")),
                              onTap: () async {
                                var result = await bottomSheetDialogManager.showBottomSheetDialog(context,
                                    title: "Ölçü Birimi Seçiniz",
                                    children: List.generate(
                                        viewModel.olcuBirimiMap.length,
                                        (index) => BottomSheetModel(
                                            title: viewModel.olcuBirimiMap[index], description: index.toStringIfNull, value: MapEntry<String, int>(viewModel.olcuBirimiMap[index], index))));
                                if (result != null && result is MapEntry<String, int>) {
                                  viewModel.setOlcuBirimi(result);
                                  olcuBirimiController.text = result.key;
                                }
                              })),
                    ],
                  ),
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
                              kdvOraniController.text = result.toIntIfDouble.toStringIfNull ?? "";
                              // kdvOraniController.value = TextEditingValue(text: result.toIntIfDouble.toStringIfNull ?? "");
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
                              onChanged: (p0) => viewModel.setBrutFiyat(p0.toDoubleWithFormattedString))),
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
      if (viewModel.dovizliMi) {
        var dovizResult =
            await networkManager.dioGet(path: ApiUrls.getDovizKurlari, bodyModel: DovizKurlariModel(), queryParameters: {"EkranTipi": "D", "DovizTipi": 2, "Tarih": result.duzeltmetarihi});
        if (dovizResult.data != null) {
          dialogManager.showAlertDialog(dovizResult.errorDetails ?? dovizResult.message ?? ("${dovizResult.errorCode.toStringIfNull ?? ""}Bir hata oluştu"));
        }
      }
    }
  }

  void initControllers() {
    kalemAdiController = TextEditingController();
    ekAlan1Controller = TextEditingController();
    ekAlan2Controller = TextEditingController();
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

  void controllerFiller() {
    viewModel.kalemModel.kalemModelHucreList ??= widget.stokListesiModel?.stokList;
    viewModel.kalemModel.stokKodu ??= widget.stokListesiModel?.stokKodu;
    kalemAdiController.text = widget.stokListesiModel?.stokAdi ?? widget.stokListesiModel?.stokKodu ?? widget.kalemModel?.stokAdi ?? widget.kalemModel?.stokKodu ?? "";
    ekAlan1Controller.text = widget.kalemModel?.ekalan1 ?? "";
    ekAlan2Controller.text = widget.kalemModel?.ekalan2 ?? "";
    isk1Controller?.text = widget.kalemModel?.iskonto1.toIntIfDouble.toStringIfNull ?? "";
    isk1TipiController?.text = widget.kalemModel?.isk1Tipi.toIntIfDouble.toStringIfNull ?? "";
    isk2TipiController?.text = widget.kalemModel?.iskonto2.toIntIfDouble.toStringIfNull ?? "";
    isk2YuzdeController?.text = widget.kalemModel?.isk2Tipi.toIntIfDouble.toStringIfNull ?? "";
    isk3TipiController?.text = widget.kalemModel?.iskonto3.toIntIfDouble.toStringIfNull ?? "";
    isk3YuzdeController?.text = widget.kalemModel?.isk3Tipi.toIntIfDouble.toStringIfNull ?? "";
    isk4TipiController?.text = widget.kalemModel?.iskonto4.toIntIfDouble.toStringIfNull ?? "";
    isk4YuzdeController?.text = widget.kalemModel?.isk4Tipi.toIntIfDouble.toStringIfNull ?? "";
    isk5TipiController?.text = widget.kalemModel?.iskonto5.toIntIfDouble.toStringIfNull ?? "";
    isk5YuzdeController?.text = widget.kalemModel?.isk5Tipi.toIntIfDouble.toStringIfNull ?? "";
    isk6TipiController?.text = widget.kalemModel?.iskonto6.toIntIfDouble.toStringIfNull ?? "";
    isk6YuzdeController?.text = widget.kalemModel?.isk6Tipi.toIntIfDouble.toStringIfNull ?? "";
    fiyatController.text = widget.kalemModel?.satisFiyati.toIntIfDouble.toStringIfNull ?? viewModel.model?.bulunanFiyat.toIntIfDouble?.commaSeparatedWithFixedDigits ?? "";
    miktarController.text = viewModel.kalemModel.miktar?.toIntIfDouble.toStringIfNull ?? "";
    miktar2Controller.text = viewModel.kalemModel.miktar2?.toIntIfDouble.toStringIfNull ?? "";
    malFazMiktarController.text = viewModel.kalemModel.malFazlasiMiktar?.toIntIfDouble.toStringIfNull ?? "";
    olcuBirimiController.text = widget.stokListesiModel?.olcuBirimi ?? widget.kalemModel?.olcuBirimAdi ?? "";
    kdvOraniController.text = widget.kalemModel?.kdvOrani.toIntIfDouble.toStringIfNull ??
        (StaticVariables.instance.isMusteriSiparisleri ? (widget.stokListesiModel?.satisKdv ?? "") : (widget.stokListesiModel?.alisKdv ?? "")).toString();
    depoController.text = (parametreModel.depoList?.where((element) => element.depoKodu == (viewModel.model?.depoKodu ?? parametreModel.satisHizmetDepoKodu)).firstOrNull?.depoTanimi ?? "");
    projeController.text = teslimTarihiController.text = model.teslimTarihi.toDateString;
    kosulController.text = model.kosulKodu ?? BaseSiparisEditModel.instance.kosulKodu ?? "";
    projeController.text = model.projeKodu ?? BaseSiparisEditModel.instance.projeKodu ?? "";
    viewModel.kalemModel.stokAdi = widget.stokListesiModel?.stokAdi ?? widget.stokListesiModel?.stokKodu ?? widget.kalemModel?.stokAdi ?? widget.kalemModel?.stokKodu ?? "";
    viewModel.kalemModel.stokKodu = widget.stokListesiModel?.stokKodu ?? widget.kalemModel?.stokKodu ?? "";
    viewModel.kalemModel.depoKodu = model.cikisDepoKodu;
    viewModel.kalemModel.projeKodu = model.projeKodu;
    viewModel.kalemModel.kosulKodu = model.kosulKodu;
    viewModel.kalemModel.teslimTarihi = model.teslimTarihi;
    viewModel.setKosul(model.kosulKodu ?? "");
    viewModel.setDepoKodu(model.cikisDepoKodu ?? viewModel.model?.depoKodu ?? 0);
    viewModel.setFiyat(fiyatController.text.toDoubleWithFormattedString);
    viewModel.setProjeKodu(model.projeKodu ?? "");
    viewModel.setBrutFiyat(fiyatController.text.toDoubleWithFormattedString);
    viewModel.setMiktar(int.tryParse(miktarController.text) ?? 0);
    viewModel.setMiktar2(int.tryParse(miktar2Controller.text) ?? 0);
    viewModel.setMFMiktar(int.tryParse(malFazMiktarController.text) ?? 0);
    viewModel.setOlcuBirimi(MapEntry<String, int>(widget.stokListesiModel?.olcuBirimi ?? widget.kalemModel?.olcuBirimAdi ?? "", 0));
    viewModel.setKdvOrani(double.tryParse(kdvOraniController.text) ?? 0);
    viewModel.setIskonto1(double.tryParse(isk1Controller?.text ?? "") ?? 0);
    viewModel.setIskonto2(double.tryParse(isk2YuzdeController?.text ?? "") ?? 0);
    viewModel.setIskonto3(double.tryParse(isk3YuzdeController?.text ?? "") ?? 0);
    viewModel.setIskonto4(double.tryParse(isk4YuzdeController?.text ?? "") ?? 0);
    viewModel.setIskonto5(double.tryParse(isk5YuzdeController?.text ?? "") ?? 0);
    viewModel.setIskonto6(double.tryParse(isk6YuzdeController?.text ?? "") ?? 0);
  }

  void disposeControllers() {
    kalemAdiController.dispose();
    ekAlan1Controller.dispose();
    ekAlan2Controller.dispose();
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

  void iskontoFiller(int index, ListIskTip iskTip) {
    switch (index) {
      case 1:
        isk1TipiController?.text = iskTip.aciklama ?? "";
        viewModel.kalemModel.isk1Tipi = iskTip.iskontoTipi;
        break;
      case 2:
        isk2TipiController?.text = iskTip.aciklama ?? "";
        viewModel.kalemModel.isk2Tipi = iskTip.iskontoTipi;
        break;
      case 3:
        isk3TipiController?.text = iskTip.aciklama ?? "";
        viewModel.kalemModel.isk3Tipi = iskTip.iskontoTipi;
        break;
      case 4:
        isk4TipiController?.text = iskTip.aciklama ?? "";
        viewModel.kalemModel.isk4Tipi = iskTip.iskontoTipi;
        break;
      case 5:
        isk5TipiController?.text = iskTip.aciklama ?? "";
        viewModel.kalemModel.isk5Tipi = iskTip.iskontoTipi;
        break;
      case 6:
        isk6TipiController?.text = iskTip.aciklama ?? "";
        viewModel.kalemModel.isk6Tipi = iskTip.iskontoTipi;
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
