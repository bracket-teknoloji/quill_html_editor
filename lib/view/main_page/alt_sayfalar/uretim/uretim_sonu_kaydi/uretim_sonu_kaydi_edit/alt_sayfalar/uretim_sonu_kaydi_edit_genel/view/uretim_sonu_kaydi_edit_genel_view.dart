import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";

import "../../../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../../../core/base/model/base_proje_model.dart";
import "../../../../../../../../../core/base/model/ek_alanlar_model.dart";
import "../../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../../core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "../../../../../../../../../core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "../../../../../../../../../core/components/layout/custom_layout_builder.dart";
import "../../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../../../core/constants/extensions/iterable_extensions.dart";
import "../../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../../../core/constants/static_variables/static_variables.dart";
import "../../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "../../../../../../stok/stok_liste/model/stok_bottom_sheet_model.dart";
import "../../../../../../stok/stok_liste/model/stok_listesi_model.dart";
import "../../../../../is_emirleri/is_emri_rehberi/model/is_emirleri_model.dart";
import "../../../../uretim_sonu_kaydi_seri_listesi/model/uretim_sonu_kaydi_recete_model.dart";
import "../../../model/uretim_sonu_kaydi_edit_model.dart";
import "../view_model/uretim_sonu_kaydi_edit_genel_view_model.dart";

final class UretimSonuKaydiEditGenelView extends StatefulWidget {
  const UretimSonuKaydiEditGenelView({
    required this.model,
    required this.ekAlanlarList,
    required this.onSave,
    required this.requestModel,
    super.key,
  });
  final BaseEditModel<KalemModel> model;
  final List<EkAlanlarModel>? ekAlanlarList;
  final UretimSonuKaydiEditModel requestModel;
  final void Function(UretimSonuKaydiEditModel model) onSave;

  @override
  State<UretimSonuKaydiEditGenelView> createState() => _UretimSonuKaydiEditGenelViewState();
}

final class _UretimSonuKaydiEditGenelViewState extends BaseState<UretimSonuKaydiEditGenelView> {
  final UretimSonuKaydiEditGenelViewModel viewModel = UretimSonuKaydiEditGenelViewModel();
  late final TextEditingController belgeNoController;
  late final TextEditingController tarihController;
  late final TextEditingController isEmriController;
  late final TextEditingController depoOnceligiController;
  late final TextEditingController cikisDepoController;
  late final TextEditingController girisDepoController;
  late final TextEditingController projeController;
  late final TextEditingController mamulKoduController;
  late final TextEditingController olcuBirimiController;
  late final TextEditingController miktarController;
  late final TextEditingController hurdaFireMiktariController;
  late final TextEditingController serilerController;
  late final TextEditingController maliyetFiyatiController;
  late final TextEditingController maliyetTutariController;
  late final TextEditingController aciklamaController;
  late final TextEditingController ekAlan1Controller;
  late final TextEditingController ekAlan2Controller;
  late final List<TextEditingController> ekAlanlarControllers;

  bool get ekleMi => widget.model.baseEditEnum.ekleMi;

  bool get isEnabled => !widget.model.baseEditEnum.goruntuleMi;

  bool get yapiKalemliMi => yetkiController.uretimSonuKalemliYapi;

  UretimSonuKaydiEditModel? get model => viewModel.requestModel;

  @override
  void initState() {
    viewModel
      ..setRequestModel(widget.requestModel)
      ..setOnSave(widget.onSave)
      ..setEkAlanlarList(widget.ekAlanlarList);
    if (!widget.model.baseEditEnum.ekleMi && widget.model.model != null) {
      viewModel.setModel(widget.model.model);
      viewModel.requestModel.kalemList = [widget.model.model!];
    }
    viewModel.kalemliMi = yetkiController.uretimSonuKalemliYapi;
    ekAlanlarControllers = [];
    belgeNoController = TextEditingController();
    tarihController = TextEditingController();
    isEmriController = TextEditingController();
    depoOnceligiController = TextEditingController();
    cikisDepoController = TextEditingController();
    girisDepoController = TextEditingController();
    projeController = TextEditingController();
    mamulKoduController = TextEditingController();
    olcuBirimiController = TextEditingController();
    miktarController = TextEditingController(
      text: model?.kalemList?.firstOrNull?.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar) ?? "",
    );
    hurdaFireMiktariController = TextEditingController();
    serilerController = TextEditingController();
    maliyetFiyatiController = TextEditingController();
    maliyetTutariController = TextEditingController();
    aciklamaController = TextEditingController();
    ekAlan1Controller = TextEditingController();
    ekAlan2Controller = TextEditingController();
    // viewModel.setModel(widget.model.model);
    if (viewModel.ekAlanlarList != null) {
      ekAlanlarControllers.addAll(
        List.generate(
          viewModel.ekAlanlarList!.length,
          (index) => TextEditingController(text: model?.ekAlanlar?[index] ?? ""),
        ),
      );
    }
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (widget.model.baseEditEnum.ekleMi && model?.belgeNo == null) {
        viewModel.setDepoOnceligi(
          viewModel.depoOnceligiList.firstWhereOrNull(
            (element) => element.value == yetkiController.uretimSonuDepoOnceligi,
          ),
        );
        final result = await viewModel.getSiradakiKod(null);
        if (result != null) {
          belgeNoController.text = result;
        }
      } else {
        // await viewModel.getKalemler();
        // viewModel.setModel(widget.model.model);
        belgeNoController.text = model?.belgeNo ?? "";
      }
      olcuBirimiController.text =
          viewModel.kalem?.olcuBirimAdi ?? viewModel.kalem?.olcuBirimKodu.toStringIfNotNull ?? "";
      projeController.text = model?.projeAdi ?? model?.projeKodu ?? "";
      tarihController.text = model?.tarih ?? "";
      depoOnceligiController.text =
          viewModel.depoOnceligiList.firstWhereOrNull((element) => element.value == model?.depoOnceligi)?.name ?? "";
      girisDepoController.text = model?.girisDepoAdi ?? "";
      cikisDepoController.text = model?.cikisDepoAdi ?? "";
      mamulKoduController.text = viewModel.kalem?.stokKodu ?? "";
      maliyetFiyatiController.text =
          viewModel.kalem?.maliyetFiyati.commaSeparatedWithDecimalDigits(OndalikEnum.fiyat) ?? "";
      maliyetTutariController.text =
          viewModel.kalem?.maliyetTutari.commaSeparatedWithDecimalDigits(OndalikEnum.fiyat) ?? "";
      ekAlan1Controller.text = viewModel.kalem?.ekalan1 ?? "";
      miktarController.text = viewModel.kalem?.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar) ?? "";
      hurdaFireMiktariController.text =
          viewModel.kalem?.miktar2.commaSeparatedWithDecimalDigits(OndalikEnum.miktar) ?? "";
      ekAlan1Controller.text = viewModel.kalem?.ekalan1 ?? "";
      ekAlan2Controller.text = viewModel.kalem?.ekalan2 ?? "";
      aciklamaController.text = model?.aciklama ?? "";
    });
    super.initState();
  }

  @override
  void dispose() {
    // StaticVariables.instance.uretimSonuGenelFormKey.currentState?.save();
    widget.onSave.call(viewModel.requestModel);
    for (final element in ekAlanlarControllers) {
      element.dispose();
    }
    belgeNoController.dispose();
    tarihController.dispose();
    isEmriController.dispose();
    depoOnceligiController.dispose();
    cikisDepoController.dispose();
    girisDepoController.dispose();
    projeController.dispose();
    mamulKoduController.dispose();
    olcuBirimiController.dispose();
    miktarController.dispose();
    hurdaFireMiktariController.dispose();
    serilerController.dispose();
    maliyetFiyatiController.dispose();
    maliyetTutariController.dispose();
    aciklamaController.dispose();
    ekAlan1Controller.dispose();
    ekAlan2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => body();

  SingleChildScrollView body() => SingleChildScrollView(
    child: Form(
      key: StaticVariables.instance.uretimSonuGenelFormKey,
      child: Column(
        children: [
          belgeNoField(),
          tarihField(),
          if (!yapiKalemliMi) isEmriField(),
          CustomLayoutBuilder.divideInHalf(
            children: [
              depoOnceligiField(),
              cikisDepoField(),
              girisDepoField(),
              if (yetkiController.projeUygulamasiAcikMi) projeField(),
              if (!yapiKalemliMi) olcuBirimiField(),
              if (!yapiKalemliMi) miktarField(),
            ],
          ),
          if (!yapiKalemliMi) mamulKoduField(),
          Observer(
            builder:
                (_) => CustomLayoutBuilder.divideInHalf(
                  children: [
                    if (!yapiKalemliMi) hurdaFireMiktariField(),
                    if (!yapiKalemliMi && (viewModel.kalem?.seriCikislardaAcik ?? false)) serilerField(),
                    if (!widget.model.baseEditEnum.ekleMi && !yapiKalemliMi) maliyetFiyatiField(),
                    if (!widget.model.baseEditEnum.ekleMi && !yapiKalemliMi) mailyetTutariField(),
                  ],
                ),
          ),
          aciklamaField(),
          if (!yapiKalemliMi) ekAlan1Field(),
          if (!yapiKalemliMi) ekAlan2Field(),
          ekAlanlarWidget(),
        ],
      ).paddingAll(UIHelper.lowSize),
    ),
  );

  CustomTextField belgeNoField() => CustomTextField(
    labelText: "Belge No",
    enabled: isEnabled,
    controller: belgeNoController,
    isMust: true,
    onChanged: viewModel.setBelgeNo,
    suffix: IconButton(
      icon: const Icon(Icons.add),
      onPressed: () async {
        final result = await viewModel.getSiradakiKod(belgeNoController.text);
        if (result is String) {
          belgeNoController.text = result;
          viewModel.setBelgeNo(result);
        }
      },
    ),
  );

  CustomTextField tarihField() => CustomTextField.dateTime(
    labelText: "Tarih",
    controller: tarihController,
    enabled: isEnabled,
    isMust: true,
    readOnly: true,
    onDateChange: (date) {
      if (date is! DateTime) return;
      tarihController.text = date.toDateString;
      viewModel.setTarih(date);
    },
  );

  CustomTextField isEmriField() => CustomTextField(
    labelText: "İş Emri",
    enabled: isEnabled,
    controller: isEmriController,
    suffixMore: true,
    readOnly: true,
    onTap: () async {
      if (viewModel.stokModel == null) {
        return dialogManager.showAlertDialog("Önce stok seçiniz.");
      }
      final result = await Get.toNamed("/mainPage/isEmriRehberiOzel", arguments: viewModel.kalem?.stokKodu);
      if (result is IsEmirleriModel) {
        // viewModel.changeIsEmri(result);
        isEmriController.text = result.isemriNo ?? "";
      }
    },
  );

  CustomTextField depoOnceligiField() => CustomTextField(
    labelText: "Depo Önceliği",
    enabled: isEnabled,
    readOnly: true,
    suffixMore: true,
    controller: depoOnceligiController,
    valueWidget: Observer(builder: (_) => Text(viewModel.requestModel.depoOnceligi ?? "")),
    onTap: () async {
      final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
        context,
        title: "Depo Önceliği",
        groupValue: viewModel.requestModel.depoOnceligi,
        children: List.generate(viewModel.depoOnceligiList.length, (index) {
          final item = viewModel.depoOnceligiList[index];
          return BottomSheetModel(title: item.name, groupValue: item.value, value: item);
        }),
      );
      if (result is DepoOnceligiRecord) {
        depoOnceligiController.text = result.name;
        viewModel.setDepoOnceligi(result);
      }
    },
  );

  CustomTextField cikisDepoField() => CustomTextField(
    labelText: "Çıkış Depo",
    enabled: isEnabled,
    controller: cikisDepoController,
    isMust: true,
    suffixMore: true,
    readOnly: true,
    valueWidget: Observer(builder: (_) => Text(viewModel.requestModel.cikisDepo.toStringIfNotNull ?? "")),
    onTap: () async {
      final result = await bottomSheetDialogManager.showDepoBottomSheetDialog(context, model?.cikisDepo);
      if (result == null) return;
      viewModel.setCikisDepo(result);
      cikisDepoController.text = result.depoTanimi ?? "";
    },
  );

  CustomTextField girisDepoField() => CustomTextField(
    labelText: "Giriş Depo",
    enabled: isEnabled,
    controller: girisDepoController,
    isMust: true,
    suffixMore: true,
    readOnly: true,
    valueWidget: Observer(builder: (_) => Text(viewModel.requestModel.girisDepo.toStringIfNotNull ?? "")),
    onTap: () async {
      final result = await bottomSheetDialogManager.showDepoBottomSheetDialog(context, model?.girisDepo);
      if (result == null) return;
      viewModel.setGirisDepo(result);
      girisDepoController.text = result.depoTanimi ?? "";
    },
  );

  CustomTextField projeField() => CustomTextField(
    labelText: "Proje",
    enabled: isEnabled,
    controller: projeController,
    isMust: true,
    suffixMore: true,
    readOnly: true,
    valueWidget: Observer(builder: (_) => Text(viewModel.kalem?.projeKodu ?? "")),
    onTap: () async {
      final item = await bottomSheetDialogManager.showProjeBottomSheetDialog(context, viewModel.kalem);
      if (item is BaseProjeModel) {
        viewModel.setProje(item);
        projeController.text = item.projeAciklama ?? "";
      }
    },
  );

  CustomTextField mamulKoduField() => CustomTextField(
    labelText: "Mamul Kodu",
    enabled: isEnabled,
    controller: mamulKoduController,
    isMust: true,
    suffixMore: true,
    readOnly: true,
    valueWidget: Observer(
      builder: (_) => Text(viewModel.kalem?.stokAdi ?? "", maxLines: 1, overflow: TextOverflow.ellipsis),
    ),
    suffix: IconButton(
      onPressed: () async {
        if (viewModel.kalem?.stokKodu == null) {
          return dialogManager.showAlertDialog("Önce stok seçiniz.");
        }
        dialogManager.showStokGridViewDialog(
          await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: viewModel.kalem?.stokKodu)),
        );
      },
      icon: const Icon(Icons.open_in_new_outlined, color: UIHelper.primaryColor),
    ),
    onTap: () async {
      final result = await Get.toNamed(
        "mainPage/stokListesiOzel",
        arguments: StokBottomSheetModel(receteliStoklar: true, menuKodu: "STOK_SREH", okutuldu: true),
      );
      if (result is StokListesiModel) {
        mamulKoduController.text = result.stokKodu ?? "";
        serilerController.clear();
        viewModel
          ..setMamulKodu(result)
          ..setSeriList(null);
        getSeriler();
      }
    },
  );

  Future<void> getSeriler() async {
    if (viewModel.kalem?.miktar == null) return dialogManager.showErrorSnackBar("Miktar giriniz.");
    final result = await Get.toNamed(
      "mainPage/uskSeriListesi",
      arguments: viewModel.kalem?.copyWith(tarih: model?.tarih.toDateTimeDDMMYYYY(), cikisDepo: model?.cikisDepo),
    );
    if (result is List<UskReceteModel>) {
      viewModel.setSeriList(result.map((e) => e.seriList).nonNulls.toList().expand((e) => e).toList());
      serilerController.text =
          "Miktar (${viewModel.kalem?.seriList?.map((e) => e.miktar ?? 0).sum.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)})";
    }
  }

  CustomTextField olcuBirimiField() => CustomTextField(
    labelText: "Ölçü Birimi",
    enabled: isEnabled,
    controller: olcuBirimiController,
    suffixMore: true,
    readOnly: true,
    onTap: () async {
      if (viewModel.stokModel == null) {
        return dialogManager.showAlertDialog("Önce stok seçiniz.");
      }
      final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
        context,
        title: "Ölçü Birimi",
        groupValue: viewModel.kalem?.olcuBirimKodu,
        children: List.generate(viewModel.stokModel?.olcuBirimiAdedi ?? 0, (index) {
          final OlcuBirimiRecord? item = viewModel.stokModel?.getOlcuBirimiRecords[index];
          return BottomSheetModel(title: item?.adi ?? "", groupValue: item?.kodu, value: item);
        }),
      );
      if (result is! OlcuBirimiRecord) return;
      olcuBirimiController.text = result.adi ?? "";
      viewModel.setOlcuBirimi(result);
    },
  );

  CustomTextField miktarField() => CustomTextField(
    labelText: "Miktar",
    enabled: isEnabled,
    controller: miktarController,
    isMust: true,
    isFormattedString: true,
    keyboardType: const TextInputType.numberWithOptions(decimal: true),
    onChanged: (value) => viewModel.setMiktar(value.toDoubleWithFormattedString),
  );

  CustomTextField hurdaFireMiktariField() => CustomTextField(
    labelText: miktar2Title,
    enabled: isEnabled,
    controller: hurdaFireMiktariController,
    isFormattedString: true,
    suffixMore: yetkiController.uretimFireDetayUygulamasi,
     
    keyboardType: const TextInputType.numberWithOptions(decimal: true),
    onChanged: (value) => viewModel.setHurdaMiktari(value.toDoubleWithFormattedString),
  );

  CustomTextField serilerField() => CustomTextField(
    labelText: "Seriler",
    controller: serilerController,
    suffixMore: true,
    isMust: true,
    readOnly: true,
    valueWidget: Observer(
      builder:
          (_) => Text(
            viewModel.kalem?.seriList != null
                ? "(${viewModel.kalem?.seriList?.length.commaSeparatedWithDecimalDigits(OndalikEnum.miktar)})"
                : "",
          ),
    ),
    onTap: getSeriler,
  );

  CustomTextField maliyetFiyatiField() => CustomTextField(
    labelText: "Maliyet Fiyatı",
    enabled: isEnabled,
    controller: maliyetFiyatiController,
    isFormattedString: true,
    keyboardType: const TextInputType.numberWithOptions(decimal: true),
    onChanged: (value) => viewModel.setMaliyetFiyati(value.toDoubleWithFormattedString),
  );

  CustomTextField mailyetTutariField() => CustomTextField(
    labelText: "Maliyet Tutarı",
    enabled: isEnabled,
    controller: maliyetTutariController,
    isFormattedString: true,
    keyboardType: const TextInputType.numberWithOptions(decimal: true),
    onChanged: (value) {},
  );

  CustomTextField aciklamaField() => CustomTextField(
    labelText: "Açıklama",
    enabled: isEnabled,
    controller: aciklamaController,
    onChanged: viewModel.setAciklama,
  );

  CustomTextField ekAlan1Field() => CustomTextField(
    labelText: "Ek Alan 1",
    enabled: isEnabled,
    controller: ekAlan1Controller,
    onChanged: viewModel.setEkAlan1,
  );

  CustomTextField ekAlan2Field() => CustomTextField(
    labelText: "Ek Alan 2",
    enabled: isEnabled,
    controller: ekAlan2Controller,
    onChanged: viewModel.setEkAlan2,
  );

  Observer ekAlanlarWidget() => Observer(
    builder: (_) {
      if (!viewModel.ekAlanlarList.ext.isNotNullOrEmpty) {
        return const SizedBox.shrink();
      }
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Ek Alanlar").paddingOnly(left: UIHelper.lowSize),
          ...List.generate(viewModel.ekAlanlarList?.length ?? 0, (index) {
            final item = viewModel.ekAlanlarList?[index];
            return CustomTextField(
              labelText: "${item?.alanAciklama}",
              controller: ekAlanlarControllers[index],
              enabled: isEnabled,
              suffixMore: item?.secimListesi?.isNotEmpty,
              isMust: item?.zorunlu == "E",
              maxLength: item?.uzunluk,
              readOnly: item?.secimListesi?.isNotEmpty,
              onChanged: (value) {
                if (item?.secimListesi?.isNotEmpty ?? false) return;
                viewModel.setEkAlanlar(index, value);
              },
              onTap: () async {
                if (item?.secimListesi?.isEmpty ?? false) return;

                final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
                  context,
                  title: "Ek Alan $index",
                  groupValue: viewModel.requestModel.ekAlanlar?[index],
                  children: List.generate(
                    item?.secimListesi?.length ?? 0,
                    (newIndex) => BottomSheetModel(
                      title: item?.secimListesi?[newIndex] ?? "",
                      value: item?.secimListesi?[newIndex] ?? "",
                      groupValue: item?.secimListesi?[newIndex] ?? "",
                    ),
                  ),
                );
                if (result == null) return;
                ekAlanlarControllers[index].text = result;
                viewModel.setEkAlanlar(index, result);
              },
            );
          }),
        ],
      );
    },
  );

  String get miktar2Title {
    if (!yetkiController.uretimFireUygulamasi) return "Miktar 2";
    if (yetkiController.uretimFireDetayUygulamasi) return "Hurda/Fire Bilgileri";
    return "Hurda/Fire Miktarı";
  }
}
