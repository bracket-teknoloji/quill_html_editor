// ignore_for_file: use_build_context_synchronously

import "package:collection/collection.dart";
import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:google_maps_flutter/google_maps_flutter.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/constants/enum/muhasebe_kodu_belge_tipi_enum.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/base_cari_edit/view/base_cari_edit_diger/view_model/base_edit_cari_diger_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_save_request_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/base_stok_edit/model/stok_muhasebe_kodu_model.dart";

import "../../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../../core/base/model/base_grup_kodu_model.dart";
import "../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../../core/components/helper_widgets/custom_label_widget.dart";
import "../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../core/constants/static_variables/static_variables.dart";
import "../../../../../../../../core/init/cache/cache_manager.dart";
import "../../../../../../../auth/model/isletme_model.dart";
import "../../../../cari_listesi/model/cari_kosullar_model.dart";
import "../../../../cari_listesi/model/cari_listesi_model.dart";
import "../../../../cari_network_manager.dart";

final class CariEditDigerView extends StatefulWidget {
  const CariEditDigerView({super.key, this.model});
  final BaseEditModel? model;

  @override
  State<CariEditDigerView> createState() => _CariEditDigerViewState();
}

final class _CariEditDigerViewState extends BaseState<CariEditDigerView> {
  Map veriTabani = CacheManager.getVeriTabani;
  final GlobalKey<FormState> cariKartiDigerFormKey = GlobalKey<FormState>();
  BaseEditCariDigerViewModel viewModel = BaseEditCariDigerViewModel();
  List<BaseGrupKoduModel>? list = <BaseGrupKoduModel>[];
  List<IsletmeModel> subeList = <IsletmeModel>[];
  List<CariKosullarModel> kosullarList = <CariKosullarModel>[];
  late final TextEditingController grupKoduController;
  late final TextEditingController kod1Controller;
  late final TextEditingController kod2Controller;
  late final TextEditingController kod3Controller;
  late final TextEditingController kod4Controller;
  late final TextEditingController kod5Controller;
  late final TextEditingController bilgiController;
  late final TextEditingController subeController;
  late final TextEditingController konumController;
  late final TextEditingController kilitController;
  late final TextEditingController bagliCariController;
  late final TextEditingController kosulKoduController;
  late final TextEditingController aciklama1Controller;
  late final TextEditingController aciklama2Controller;
  late final TextEditingController aciklama3Controller;
  late final TextEditingController a1Controller;
  late final TextEditingController a2Controller;
  late final TextEditingController a3Controller;
  late final TextEditingController a4Controller;
  late final TextEditingController a5Controller;
  late final TextEditingController a6Controller;
  late final TextEditingController a7Controller;
  late final TextEditingController a8Controller;
  late final TextEditingController n1Controller;
  late final TextEditingController n2Controller;
  late final TextEditingController n3Controller;
  late final TextEditingController n4Controller;
  late final TextEditingController n5Controller;
  late final TextEditingController n6Controller;
  late final TextEditingController n7Controller;
  late final TextEditingController n8Controller;
  late final TextEditingController muhasebeKoduController;
  late final TextEditingController kurFarkiBorcMuhasebeKoduController;
  late final TextEditingController kurFarkiAlacakMuhasebeKoduController;
  late final TextEditingController eFaturaSenaryoController;

  @override
  void initState() {
    viewModel.setModel(CariSaveRequestModel.instance);
    grupKoduController = TextEditingController(text: viewModel.model?.grupKodu);
    kod1Controller = TextEditingController(text: viewModel.model?.kod1Tanimi);
    kod2Controller = TextEditingController(text: viewModel.model?.kod2Tanimi);
    kod3Controller = TextEditingController(text: viewModel.model?.kod3Tanimi);
    kod4Controller = TextEditingController(text: viewModel.model?.kod4Tanimi);
    kod5Controller = TextEditingController(text: viewModel.model?.kod5Tanimi);
    bilgiController = TextEditingController(text: viewModel.model?.bilgi);
    subeController = TextEditingController(text: viewModel.model?.subeKodu);
    konumController = TextEditingController(
      text: viewModel.model?.enlem == null
          ? ""
          : "${viewModel.model?.enlem?.toStringAsFixed(5)}, ${viewModel.model?.boylam?.toStringAsFixed(5)}",
    );
    kilitController = TextEditingController(
      text:
          viewModel.kilitMap.entries.firstWhereOrNull((element) => element.value == viewModel.model?.kilit)?.key ?? "",
    );
    bagliCariController = TextEditingController(text: viewModel.model?.bagliCariAciklama);
    kosulKoduController = TextEditingController(text: viewModel.model?.kosulKoduAciklama);
    aciklama1Controller = TextEditingController(text: viewModel.model?.aciklama1);
    aciklama2Controller = TextEditingController(text: viewModel.model?.aciklama2);
    aciklama3Controller = TextEditingController(text: viewModel.model?.aciklama3);
    a1Controller = TextEditingController(text: viewModel.model?.kull1s);
    a2Controller = TextEditingController(text: viewModel.model?.kull2s);
    a3Controller = TextEditingController(text: viewModel.model?.kull3s);
    a4Controller = TextEditingController(text: viewModel.model?.kull4s);
    a5Controller = TextEditingController(text: viewModel.model?.kull5s);
    a6Controller = TextEditingController(text: viewModel.model?.kull6s);
    a7Controller = TextEditingController(text: viewModel.model?.kull7s);
    a8Controller = TextEditingController(text: viewModel.model?.kull8s);
    n1Controller = TextEditingController(text: viewModel.model?.kull1n.toIntIfDouble.toStringIfNotNull);
    n2Controller = TextEditingController(text: viewModel.model?.kull2n.toIntIfDouble.toStringIfNotNull);
    n3Controller = TextEditingController(text: viewModel.model?.kull3n.toIntIfDouble.toStringIfNotNull);
    n4Controller = TextEditingController(text: viewModel.model?.kull4n.toIntIfDouble.toStringIfNotNull);
    n5Controller = TextEditingController(text: viewModel.model?.kull5n.toIntIfDouble.toStringIfNotNull);
    n6Controller = TextEditingController(text: viewModel.model?.kull6n.toIntIfDouble.toStringIfNotNull);
    n7Controller = TextEditingController(text: viewModel.model?.kull7n.toIntIfDouble.toStringIfNotNull);
    n8Controller = TextEditingController(text: viewModel.model?.kull8n.toIntIfDouble.toStringIfNotNull);
    muhasebeKoduController = TextEditingController(text: viewModel.model?.muhAdi);
    kurFarkiBorcMuhasebeKoduController = TextEditingController(text: viewModel.model?.kurfarkiborcAdi);
    kurFarkiAlacakMuhasebeKoduController = TextEditingController(text: viewModel.model?.kurfarkialacakAdi);
    eFaturaSenaryoController = TextEditingController(
      text:
          viewModel.senaryoMap.entries
              .firstWhereOrNull((element) => element.value == viewModel.model?.efaturaSenaryo)
              ?.key ??
          "",
    );

    viewModel
      ..changeSubeKodu(int.tryParse(viewModel.model?.subeKodu ?? ""))
      ..changeKilit(viewModel.model?.kilit);
    if (viewModel.model?.kilit == null) {
      kilitController.text = "Kilitli Değil";
      viewModel.changeKilit("H");
    }
    StaticVariables.instance.cariKartiDigerFormKey.currentState?.activate();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await dataChecker();
      await subeChecker();
      subeController.text =
          subeList.firstWhereOrNull((element) {
            if (viewModel.model?.subeKodu == null) {
              viewModel.changeSubeKodu(-1);
            }
            return element.subeKodu.toStringIfNotNull == (viewModel.model?.subeKodu ?? "-1");
          })?.subeAdi ??
          "";
    });
  }

  @override
  void deactivate() {
    StaticVariables.instance.cariKartiDigerFormKey.currentState?.deactivate();
    super.deactivate();
  }

  @override
  void dispose() {
    grupKoduController.dispose();
    kod1Controller.dispose();
    kod2Controller.dispose();
    kod3Controller.dispose();
    kod4Controller.dispose();
    kod5Controller.dispose();
    bilgiController.dispose();
    subeController.dispose();
    konumController.dispose();
    kilitController.dispose();
    bagliCariController.dispose();
    kosulKoduController.dispose();
    aciklama1Controller.dispose();
    aciklama2Controller.dispose();
    aciklama3Controller.dispose();
    a1Controller.dispose();
    a2Controller.dispose();
    a3Controller.dispose();
    a4Controller.dispose();
    a5Controller.dispose();
    a6Controller.dispose();
    a7Controller.dispose();
    a8Controller.dispose();
    n1Controller.dispose();
    n2Controller.dispose();
    n3Controller.dispose();
    n4Controller.dispose();
    n5Controller.dispose();
    n6Controller.dispose();
    n7Controller.dispose();
    n8Controller.dispose();
    eFaturaSenaryoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool enabled = widget.model?.baseEditEnum != BaseEditEnum.goruntule;
    return SingleChildScrollView(
      child: Form(
        key: StaticVariables.instance.cariKartiDigerFormKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: CustomTextField(
                    enabled: enabled,
                    readOnly: true,
                    suffixMore: true,
                    labelText: "Grup Kodu",
                    controller: grupKoduController,
                    onClear: () => viewModel.changeGrupKodu(null),
                    onTap: () async {
                      final List<BaseGrupKoduModel>? liste = list?.where((element) => element.grupNo == 0).toList();
                      final result = await bottomSheetDialogManager.showBottomSheetDialog(
                        context,
                        aramaVarMi: true,
                        title: "GrupKodu",
                        children: List.generate(
                          liste!.length,
                          (index) => BottomSheetModel(title: liste[index].grupAdi ?? "", value: liste[index]),
                        ),
                      );
                      if (result != null) {
                        grupKoduController.text = result.grupAdi ?? "";
                        viewModel.changeGrupKodu(result.grupKodu);
                      }
                    },
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    enabled: enabled,
                    readOnly: true,
                    suffixMore: true,
                    labelText: "Kod 1",
                    controller: kod1Controller,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model?.kod1 ?? "")),
                    onClear: () => viewModel.changeKod1(null),
                    onTap: () async {
                      final List<BaseGrupKoduModel>? liste = list?.where((element) => element.grupNo == 1).toList();
                      final result = await bottomSheetDialogManager.showBottomSheetDialog(
                        context,
                        aramaVarMi: true,
                        title: "Kod 1",
                        children: List.generate(
                          liste!.length,
                          (index) => BottomSheetModel(title: liste[index].grupAdi ?? "", value: liste[index]),
                        ),
                      );
                      if (result is BaseGrupKoduModel) {
                        kod1Controller.text = result.grupAdi ?? "";
                        viewModel.changeKod1(result);
                      }
                    },
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: CustomTextField(
                    enabled: enabled,
                    readOnly: true,
                    suffixMore: true,
                    labelText: "Kod 2",
                    controller: kod2Controller,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model?.kod2 ?? "")),
                    onClear: () => viewModel.changeKod2(null),
                    onTap: () async {
                      final List<BaseGrupKoduModel>? liste = list?.where((element) => element.grupNo == 2).toList();
                      final result = await bottomSheetDialogManager.showBottomSheetDialog(
                        context,
                        aramaVarMi: true,
                        title: "Kod 2",
                        children: List.generate(
                          liste!.length,
                          (index) => BottomSheetModel(title: liste[index].grupAdi ?? "", value: liste[index]),
                        ),
                      );
                      if (result is BaseGrupKoduModel) {
                        kod2Controller.text = result.grupAdi ?? "";

                        viewModel.changeKod2(result);
                      }
                    },
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    enabled: enabled,
                    readOnly: true,
                    suffixMore: true,
                    labelText: "Kod 3",
                    controller: kod3Controller,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model?.kod3 ?? "")),
                    onClear: () => viewModel.changeKod3(null),
                    onTap: () async {
                      final List<BaseGrupKoduModel>? liste = list?.where((element) => element.grupNo == 3).toList();
                      final result = await bottomSheetDialogManager.showBottomSheetDialog(
                        context,
                        aramaVarMi: true,
                        title: "Kod 3",
                        children: List.generate(
                          liste!.length,
                          (index) => BottomSheetModel(title: liste[index].grupAdi ?? "", value: liste[index]),
                        ),
                      );
                      if (result is BaseGrupKoduModel) {
                        kod3Controller.text = result.grupAdi ?? "";
                        viewModel.changeKod3(result);
                      }
                    },
                  ),
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: CustomTextField(
                    enabled: enabled,
                    labelText: "Kod 4",
                    readOnly: true,
                    suffixMore: true,
                    controller: kod4Controller,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model?.kod4 ?? "")),
                    onClear: () => viewModel.changeKod4(null),
                    onTap: () async {
                      final List<BaseGrupKoduModel>? liste = list?.where((element) => element.grupNo == 4).toList();
                      final result = await bottomSheetDialogManager.showBottomSheetDialog(
                        context,
                        aramaVarMi: true,
                        title: "Kod 4",
                        children: List.generate(
                          liste!.length,
                          (index) => BottomSheetModel(title: liste[index].grupAdi ?? "", value: liste[index]),
                        ),
                      );
                      if (result is BaseGrupKoduModel) {
                        kod4Controller.text = result.grupAdi ?? "";
                        viewModel.changeKod4(result);
                      }
                    },
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    enabled: enabled,
                    labelText: "Kod 5",
                    readOnly: true,
                    suffixMore: true,
                    controller: kod5Controller,
                    valueWidget: Observer(builder: (_) => Text(viewModel.model?.kod5 ?? "")),
                    onClear: () => viewModel.changeKod5(null),
                    onTap: () async {
                      final List<BaseGrupKoduModel>? liste = list?.where((element) => element.grupNo == 5).toList();
                      final result = await bottomSheetDialogManager.showBottomSheetDialog(
                        context,
                        aramaVarMi: true,
                        title: "Kod 5",
                        children: List.generate(
                          liste!.length,
                          (index) => BottomSheetModel(title: liste[index].grupAdi ?? "", value: liste[index]),
                        ),
                      );
                      if (result is BaseGrupKoduModel) {
                        kod5Controller.text = result.grupAdi ?? "";
                        viewModel.changeKod5(result);
                      }
                    },
                  ),
                ),
              ],
            ),
            CustomTextField(
              enabled: enabled && !yetkiController.cariKartiDegistirilmeyecekAlanlar("bilgi"),
              labelText: "Bilgi",
              controller: bilgiController,
              onChanged: (p0) => viewModel.changeBilgi(p0),
            ),
            if (parametreModel.muhasebeEntegre == true)
              CustomTextField(
                enabled: enabled,
                labelText: "Muhasebe Kodu",
                readOnly: true,
                suffixMore: true,
                controller: muhasebeKoduController,
                valueWidget: Observer(builder: (_) => Text(viewModel.model?.muhasebeKodu ?? "")),
                onClear: () => viewModel.changeMuhaseKodu(null),
                onTap: () async {
                  final StokMuhasebeKoduModel? result = await bottomSheetDialogManager
                      .showMuhasebeMuhasebeKoduBottomSheetDialog(
                        context,
                        viewModel.model?.muhasebeKodu,
                        belgeTipi: MuhasebeBelgeTipiEnum.cari.value,
                        hesapTipi: "M",
                      );
                  if (result is StokMuhasebeKoduModel) {
                    muhasebeKoduController.text = result.hesapAdi ?? "";
                    viewModel.changeMuhaseKodu(result);
                  }
                },
              ),
            if (parametreModel.muhasebeEntegre == true)
              CustomTextField(
                enabled: enabled,
                labelText: "Kur Farkı Borç Muh. Kodu",
                readOnly: true,
                suffixMore: true,
                controller: kurFarkiBorcMuhasebeKoduController,
                valueWidget: Observer(builder: (_) => Text(viewModel.model?.kurfarkiborcKodu ?? "")),
                onClear: () => viewModel.changeKurFarkiBorc(null),
                onTap: () async {
                  final StokMuhasebeKoduModel? result = await bottomSheetDialogManager
                      .showMuhasebeMuhasebeKoduBottomSheetDialog(
                        context,
                        viewModel.model?.kurfarkiborcKodu,
                        belgeTipi: MuhasebeBelgeTipiEnum.cari.value,
                        hesapTipi: "M",
                      );
                  if (result is StokMuhasebeKoduModel) {
                    kurFarkiBorcMuhasebeKoduController.text = result.hesapAdi ?? "";
                    viewModel.changeKurFarkiBorc(result);
                  }
                },
              ),
            if (parametreModel.muhasebeEntegre == true)
              CustomTextField(
                enabled: enabled,
                labelText: "Kur Farkı Alacak Muh. Kodu",
                readOnly: true,
                suffixMore: true,
                controller: kurFarkiAlacakMuhasebeKoduController,
                valueWidget: Observer(builder: (_) => Text(viewModel.model?.kurfarkialacakKodu ?? "")),
                onClear: () => viewModel.changeKurFarkiAlacak(null),
                onTap: () async {
                  final StokMuhasebeKoduModel? result = await bottomSheetDialogManager
                      .showMuhasebeMuhasebeKoduBottomSheetDialog(
                        context,
                        viewModel.model?.kurfarkialacakKodu,
                        belgeTipi: MuhasebeBelgeTipiEnum.cari.value,
                        hesapTipi: "M",
                      );
                  if (result is StokMuhasebeKoduModel) {
                    kurFarkiAlacakMuhasebeKoduController.text = result.hesapAdi ?? "";
                    viewModel.changeKurFarkiAlacak(result);
                  }
                },
              ),
            CustomTextField(
              enabled:
                  (enabled &&
                      subeList.firstWhereOrNull((element) => element.subeKodu == veriTabani["Şube"])?.merkezmi ==
                          "E") ||
                  widget.model?.baseEditEnum != BaseEditEnum.goruntule &&
                      !yetkiController.cariKartiDegistirilmeyecekAlanlar("sube"),
              readOnly: true,
              suffixMore: true,
              isMust: true,
              labelText: "Şube",
              controller: subeController,
              valueWidget: Observer(builder: (_) => Text(viewModel.model?.subeKodu ?? "")),
              onClear: () => viewModel.changeSubeKodu(null),
              onTap: () async {
                final List<BottomSheetModel<IsletmeModel>> children2 = List.generate(
                  subeList.length,
                  (index) => BottomSheetModel(
                    title: subeList[index].subeAdi ?? "",
                    description: subeList[index].subeAdi ?? "",
                    value: subeList[index],
                    groupValue: subeList[index].subeKodu,
                  ),
                );
                final IsletmeModel? result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                  context,
                  title: "Şube",
                  children: children2,
                  groupValue: viewModel.model?.subeKodu,
                );
                if (result is IsletmeModel) {
                  subeController.text = result.subeAdi ?? "";
                  viewModel.changeSubeKodu(result.subeKodu);
                }
              },
            ),
            CustomTextField(
              enabled: enabled && !yetkiController.cariKartiDegistirilmeyecekAlanlar("konum"),
              readOnly: true,
              suffixMore: true,
              labelText: "Konum",
              controller: konumController,
              onClear: () => viewModel.changeKonum(null),
              onTap: () async {
                final result = await Get.toNamed(
                  "/mainPage/cariHaritasiOzel",
                  arguments: (enlem: viewModel.model?.enlem, boylam: viewModel.model?.boylam),
                );
                if (result is LatLng) {
                  viewModel.changeKonum((result.latitude, result.longitude));
                  konumController.text =
                      "${result.latitude.toStringAsFixed(5)}, ${result.longitude.toStringAsFixed(5)}";
                }
              },
            ),
            CustomTextField(
              enabled: enabled && !yetkiController.cariKartiDegistirilmeyecekAlanlar("kilit"),
              readOnly: true,
              suffixMore: true,
              isMust: true,
              labelText: "Kilit",
              valueWidget: Observer(builder: (_) => Text(viewModel.model?.kilit ?? "")),
              controller: kilitController,
              onClear: () => viewModel.changeKilit(null),
              onTap: () async {
                final result = await bottomSheetDialogManager.showBottomSheetDialog(
                  context,
                  title: "Kilit",
                  children: List.generate(
                    viewModel.kilitMap.length,
                    (index) => BottomSheetModel(
                      title: viewModel.kilitMap.keys.toList()[index],
                      value: viewModel.kilitMap.entries.toList()[index],
                    ),
                  ),
                );
                if (result != null) {
                  kilitController.text = result.key;
                  viewModel.changeKilit(result.value);
                }
              },
            ),
            CustomTextField(
              enabled: enabled && !yetkiController.cariKartiDegistirilmeyecekAlanlar("bagli_cari"),
              readOnly: true,
              suffixMore: true,
              labelText: "Bağlı Cari",
              controller: bagliCariController,
              valueWidget: Observer(builder: (_) => Text(viewModel.model?.bagliCari ?? "")),
              onClear: () => viewModel.changeBagliCari(null),
              onTap: () async {
                final result = await Get.toNamed("/mainPage/cariListesi", arguments: true);
                if (result is CariListesiModel) {
                  bagliCariController.text = result.cariAdi ?? "";
                  viewModel.changeBagliCari(result);
                }
              },
            ),
            if (parametreModel.konsinyeUygulamasi == true)
              CustomTextField(
                enabled: enabled,
                readOnly: true,
                suffixMore: true,
                labelText: "Koşul Kodu",
                controller: kosulKoduController,
                valueWidget: Observer(builder: (_) => Text(viewModel.model?.kosulKodu ?? "")),
                onClear: () => viewModel.changeKosul(null),
                onTap: () async {
                  final CariKosullarModel? result = await bottomSheetDialogManager.showKosullarBottomSheetDialog(
                    context,
                    viewModel.model?.kosulKodu,
                    null,
                  );
                  if (result is CariKosullarModel) {
                    kosulKoduController.text = "${result.kosulKodu ?? ""} - ${result.kosulSabitAdi ?? ""}";
                    viewModel.model?.kosulKoduAciklama = "${result.kosulKodu ?? ""} - ${result.kosulSabitAdi ?? ""}";
                    viewModel.changeKosul(result);
                  }
                },
              ),
            CustomTextField(
              enabled: enabled,
              labelText: "Açıklama 1",
              controller: aciklama1Controller,
              onChanged: (p0) => viewModel.changeAciklama(1, p0),
            ),
            CustomTextField(
              enabled: enabled,
              labelText: "Açıklama 2",
              controller: aciklama2Controller,
              onChanged: (p0) => viewModel.changeAciklama(2, p0),
            ),
            CustomTextField(
              enabled: enabled,
              labelText: "Açıklama 3",
              controller: aciklama3Controller,
              onChanged: (p0) => viewModel.changeAciklama(3, p0),
            ),
            if (parametreModel.mapCariKullSahalar != null)
              CustomWidgetWithLabel(
                text: "Kullanıcı Tanımlı Sahalar",
                child: Wrap(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (parametreModel.mapCariKullSahalar?.the1S != null)
                          Expanded(
                            child: CustomTextField(
                              enabled: enabled,
                              labelText: "A 1",
                              controller: a1Controller,
                              onChanged: (p0) => viewModel.changeKullA(1, p0),
                            ),
                          ),
                        if (parametreModel.mapCariKullSahalar?.the2S != null)
                          Expanded(
                            child: CustomTextField(
                              enabled: enabled,
                              labelText: "A 2",
                              controller: a2Controller,
                              onChanged: (p0) => viewModel.changeKullA(2, p0),
                            ),
                          ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        if (parametreModel.mapCariKullSahalar?.the3S != null)
                          Expanded(
                            child: CustomTextField(
                              enabled: enabled,
                              labelText: "A 3",
                              controller: a3Controller,
                              onChanged: (p0) => viewModel.changeKullA(3, p0),
                            ),
                          ),
                        if (parametreModel.mapCariKullSahalar?.the4S != null)
                          Expanded(
                            child: CustomTextField(
                              enabled: enabled,
                              labelText: "A 4",
                              controller: a4Controller,
                              onChanged: (p0) => viewModel.changeKullA(4, p0),
                            ),
                          ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (parametreModel.mapCariKullSahalar?.the5S != null)
                          Expanded(
                            child: CustomTextField(
                              enabled: enabled,
                              labelText: "A 5",
                              controller: a5Controller,
                              onChanged: (p0) => viewModel.changeKullA(5, p0),
                            ),
                          ),
                        if (parametreModel.mapCariKullSahalar?.the6S != null)
                          Expanded(
                            child: CustomTextField(
                              enabled: enabled,
                              labelText: "A 6",
                              controller: a6Controller,
                              onChanged: (p0) => viewModel.changeKullA(6, p0),
                            ),
                          ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (parametreModel.mapCariKullSahalar?.the7S != null)
                          Expanded(
                            child: CustomTextField(
                              enabled: enabled,
                              labelText: "A 7",
                              controller: a7Controller,
                              onChanged: (p0) => viewModel.changeKullA(7, p0),
                            ),
                          ),
                        if (parametreModel.mapCariKullSahalar?.the8S != null)
                          Expanded(
                            child: CustomTextField(
                              enabled: enabled,
                              labelText: "A 8",
                              controller: a8Controller,
                              onChanged: (p0) => viewModel.changeKullA(8, p0),
                            ),
                          ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (parametreModel.mapCariKullSahalar?.the1N != null)
                          Expanded(
                            child: CustomTextField(
                              enabled: enabled,
                              labelText: "N 1",
                              isFormattedString: true,
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                              controller: n1Controller,
                              onChanged: (p0) => viewModel.changeKullN(1, p0),
                            ),
                          ),
                        if (parametreModel.mapCariKullSahalar?.the2N != null)
                          Expanded(
                            child: CustomTextField(
                              enabled: enabled,
                              labelText: "N 2",
                              isFormattedString: true,
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                              controller: n2Controller,
                              onChanged: (p0) => viewModel.changeKullN(2, p0),
                            ),
                          ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (parametreModel.mapCariKullSahalar?.the3N != null)
                          Expanded(
                            child: CustomTextField(
                              enabled: enabled,
                              labelText: "N 3",
                              isFormattedString: true,
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                              controller: n3Controller,
                              onChanged: (p0) => viewModel.changeKullN(3, p0),
                            ),
                          ),
                        if (parametreModel.mapCariKullSahalar?.the4N != null)
                          Expanded(
                            child: CustomTextField(
                              enabled: enabled,
                              labelText: "N 4",
                              isFormattedString: true,
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                              controller: n4Controller,
                              onChanged: (p0) => viewModel.changeKullN(4, p0),
                            ),
                          ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (parametreModel.mapCariKullSahalar?.the5N != null)
                          Expanded(
                            child: CustomTextField(
                              enabled: enabled,
                              labelText: "N 5",
                              isFormattedString: true,
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                              controller: n5Controller,
                              onChanged: (p0) => viewModel.changeKullN(5, p0),
                            ),
                          ),
                        if (parametreModel.mapCariKullSahalar?.the6N != null)
                          Expanded(
                            child: CustomTextField(
                              enabled: enabled,
                              labelText: "N 6",
                              isFormattedString: true,
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                              controller: n6Controller,
                              onChanged: (p0) => viewModel.changeKullN(6, p0),
                            ),
                          ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        if (parametreModel.mapCariKullSahalar?.the7N != null)
                          Expanded(
                            child: CustomTextField(
                              enabled: enabled,
                              labelText: "N 7",
                              isFormattedString: true,
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                              controller: n7Controller,
                              onChanged: (p0) => viewModel.changeKullN(7, p0),
                            ),
                          ),
                        if (parametreModel.mapCariKullSahalar?.the8N != null)
                          Expanded(
                            child: CustomTextField(
                              enabled: enabled,
                              labelText: "N 8",
                              isFormattedString: true,
                              keyboardType: const TextInputType.numberWithOptions(decimal: true),
                              controller: n8Controller,
                              onChanged: (p0) => viewModel.changeKullN(8, p0),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            if (parametreModel.eFaturaAktif == true)
              CustomWidgetWithLabel(
                text: "E-İşlemler",
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (yetkiController.eFaturaAktif)
                      CustomTextField(
                        labelText: "E-Fatura Senaryo",
                        enabled: enabled,
                        isMust: true,
                        readOnly: true,
                        controller: eFaturaSenaryoController,
                        suffixMore: true,
                        valueWidget: Observer(builder: (_) => Text(viewModel.model?.efaturaSenaryo ?? "")),
                        onTap: () async {
                          final result = await bottomSheetDialogManager.showBottomSheetDialog(
                            context,
                            title: "E-Fatura Senaryo",
                            children: List.generate(
                              viewModel.senaryoMap.length,
                              (index) => BottomSheetModel(
                                title: viewModel.senaryoMap.keys.toList()[index],
                                value: viewModel.senaryoMap.entries.toList()[index],
                              ),
                            ),
                          );
                          if (result != null) {
                            viewModel.setSenaryo(result.value);
                            eFaturaSenaryoController.text = result.key;
                          }
                        },
                      ),
                    ElevatedButton(
                      onPressed: enabled
                          ? () async {
                              final result = await viewModel.postFaturaTipi();
                              if (result.isSuccess) {
                                dialogManager.showSuccessSnackBar(result.message ?? "Başarılı");
                              } else {
                                dialogManager.showErrorSnackBar(result.message ?? "Hata");
                              }
                            }
                          : null,
                      child: Observer(
                        builder: (_) => Text("E-Fatura Mükellefiyetini ${viewModel.efaturaButonAciklama}"),
                      ),
                    ).paddingAll(UIHelper.lowSize),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Future<void> dataChecker() async {
    if (list.ext.isNullOrEmpty && StaticVariables.grupKodlari.ext.isNullOrEmpty) {
      final data = await CariNetworkManager.getKod();
      if (!data.isSuccess) return;
      list = data.dataList;
      if (list != null) {
        StaticVariables.grupKodlari = list!;
      }
      debugPrint(data.toString());
    }
    list = StaticVariables.grupKodlari;
  }

  Future<void> subeChecker() async {
    final List result = CacheManager.getSubeListesi();
    subeList = result.map((e) => e as IsletmeModel).toList().cast<IsletmeModel>();
    if (subeList.any((element) => element.subeAdi != "Şubelerde Ortak")) {
      subeList.insert(0, IsletmeModel(subeKodu: -1, subeAdi: "Şubelerde Ortak"));
    }
  }
}
