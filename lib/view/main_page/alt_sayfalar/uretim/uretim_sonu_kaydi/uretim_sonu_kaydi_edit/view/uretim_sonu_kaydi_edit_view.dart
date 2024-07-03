import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:kartal/kartal.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/base/model/base_proje_model.dart";
import "package:picker/core/base/model/base_stok_mixin.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/base/view/stok_rehberi/model/stok_rehberi_request_model.dart";
import "package:picker/core/components/dialog/bottom_sheet/model/bottom_sheet_model.dart";
import "package:picker/core/components/layout/custom_layout_builder.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ondalik_utils.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/stok/stok_liste/model/stok_bottom_sheet_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/is_emirleri/is_emri_rehberi/model/is_emirleri_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/uretim_sonu_kaydi/uretim_sonu_kaydi_edit/model/uretim_sonu_kaydi_edit_model.dart";
import "package:picker/view/main_page/alt_sayfalar/uretim/uretim_sonu_kaydi/uretim_sonu_kaydi_edit/view_model/uretim_sonu_kaydi_edit_view_model.dart";

final class UretimSonuKaydiEditView extends StatefulWidget {
  final BaseEditModel<KalemModel> model;
  const UretimSonuKaydiEditView({super.key, required this.model});

  @override
  State<UretimSonuKaydiEditView> createState() => _UretimSonuKaydiEditViewState();
}

final class _UretimSonuKaydiEditViewState extends BaseState<UretimSonuKaydiEditView> {
  final UretimSonuKaydiEditViewModel viewModel = UretimSonuKaydiEditViewModel();
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
  late final TextEditingController maliyetFiyatiController;
  late final TextEditingController maliyetTutariController;
  late final TextEditingController aciklamaController;
  late final TextEditingController ekAlan1Controller;
  late final TextEditingController ekAlan2Controller;

  bool get ekleMi => widget.model.baseEditEnum.ekleMi;

  bool get isEnabled => !widget.model.baseEditEnum.goruntuleMi;

  UretimSonuKaydiEditModel? get model => viewModel.requestModel;

  @override
  void initState() {
    if (widget.model.baseEditEnum.ekleMi) {
      viewModel.setModel(KalemModel(tarih: DateTime.now()));
    } else {
      viewModel.setModel(widget.model.model);
    }
    belgeNoController = TextEditingController();
    tarihController = TextEditingController();
    isEmriController = TextEditingController();
    depoOnceligiController = TextEditingController();
    cikisDepoController = TextEditingController();
    girisDepoController = TextEditingController();
    projeController = TextEditingController();
    mamulKoduController = TextEditingController();
    olcuBirimiController = TextEditingController();
    miktarController = TextEditingController(text: model?.kalemList?.firstOrNull?.miktar.commaSeparatedWithDecimalDigits(OndalikEnum.miktar) ?? "");
    hurdaFireMiktariController = TextEditingController();
    maliyetFiyatiController = TextEditingController();
    maliyetTutariController = TextEditingController();
    aciklamaController = TextEditingController();
    ekAlan1Controller = TextEditingController();
    ekAlan2Controller = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await viewModel.getEkAlanlar();
      if (widget.model.baseEditEnum.ekleMi) {
        viewModel.setDepoOnceligi(viewModel.depoOnceligiList.firstWhereOrNull((element) => element.value == yetkiController.uretimSonuDepoOnceligi));
        final result = await viewModel.getSiradakiKod(null);
        if (result != null) {
          belgeNoController.text = result;
        }
      } else {
        viewModel.setBelgeNo(widget.model.model?.belgeNo);
        await viewModel.getKalemler();
        belgeNoController.text = model?.belgeNo ?? "";
      }
      if (viewModel.model != null) {
        tarihController.text = viewModel.kalem?.tarih.toDateString ?? "";
        depoOnceligiController.text = viewModel.depoOnceligiList.firstWhereOrNull((element) => element.value == model?.depoOnceligi)?.name ?? "";
        cikisDepoController.text = viewModel.model!.cikisDepoAdi ?? "";
        mamulKoduController.text = viewModel.model!.stokKodu ?? "";
        maliyetFiyatiController.text = viewModel.model!.maliyetFiyati.commaSeparatedWithDecimalDigits(OndalikEnum.fiyat);
        maliyetTutariController.text = viewModel.model!.maliyetTutari.commaSeparatedWithDecimalDigits(OndalikEnum.fiyat);
        ekAlan1Controller.text = viewModel.model!.ekalan1 ?? "";
        ekAlan2Controller.text = viewModel.model!.ekalan2 ?? "";
        aciklamaController.text = viewModel.model!.aciklama ?? "";
        girisDepoController.text = viewModel.model!.girisDepoAdi ?? "";
      }
    });
    super.initState();
  }

  @override
  void dispose() {
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
    maliyetFiyatiController.dispose();
    maliyetTutariController.dispose();
    aciklamaController.dispose();
    ekAlan1Controller.dispose();
    ekAlan2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: appBar(),
        body: body(),
      );

  AppBar appBar() => AppBar(
        title: AppBarTitle(
          title: "Üretim Sonu Kaydı",
          subtitle: widget.model.baseEditEnum?.getName,
        ),
      );

  SingleChildScrollView body() => SingleChildScrollView(
        child: Column(
          children: [
            belgeNoField(),
            tarihField(),
            isEmriField(),
            CustomLayoutBuilder(
              splitCount: 2,
              children: [
                depoOnceligiField(),
                cikisDepoField(),
              ],
            ),
            CustomLayoutBuilder(
              splitCount: 2,
              children: [
                girisDepoField(),
                projeField().yetkiVarMi(yetkiController.projeUygulamasiAcikMi),
              ],
            ),
            mamulKoduField(),
            CustomLayoutBuilder(
              splitCount: 2,
              children: [
                olcuBirimiField(),
                miktarField(),
              ],
            ),
            hurdaFireMiktariField(),
            CustomLayoutBuilder(
              splitCount: 2,
              children: [
                maliyetFiyatiField().yetkiVarMi(!widget.model.baseEditEnum.ekleMi),
                mailyetTutariField().yetkiVarMi(!widget.model.baseEditEnum.ekleMi),
              ],
            ),
            aciklamaField(),
            ekAlan1Field(),
            ekAlan2Field(),
            ekAlanlarWidget(),
          ],
        ).paddingAll(UIHelper.lowSize),
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
          final result = await Get.toNamed("/mainPage/isEmriRehberiOzel");
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
        onTap: () async {
          final result = await bottomSheetDialogManager.showRadioBottomSheetDialog(
            context,
            title: "Depo Önceliği",
            groupValue: viewModel.requestModel.depoOnceligi,
            children: List.generate(
              viewModel.depoOnceligiList.length,
              (index) {
                final item = viewModel.depoOnceligiList[index];
                return BottomSheetModel(title: item.name, groupValue: item.value, value: item);
              },
            ),
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
        //TODO Projeyi ekle
        valueWidget: Observer(builder: (_) => Text(viewModel.kalem?.projeKodu ?? "")),
        onTap: () async {
          final item = await bottomSheetDialogManager.showProjeBottomSheetDialog(context, viewModel.model);
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
          builder: (_) => Text(
            viewModel.kalem?.stokAdi ?? "",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        suffix: IconButton(
          onPressed: () async {
            if (viewModel.model?.stokKodu == null) {
              return dialogManager.showAlertDialog("Önce stok seçiniz.");
            }
            dialogManager.showStokGridViewDialog(await networkManager.getStokModel(StokRehberiRequestModel(stokKodu: viewModel.model?.stokKodu)));
          },
          icon: const Icon(Icons.open_in_new_outlined, color: UIHelper.primaryColor),
        ),
        onTap: () async {
          final result = await Get.toNamed("mainPage/stokListesiOzel", arguments: StokBottomSheetModel(receteliStoklar: true, menuKodu: "STOK_SREH", okutuldu: true));
          if (result is BaseStokMixin) {
            mamulKoduController.text = result.stokKodu ?? "";
            viewModel.setMamulKodu(result);
          }
        },
      );

  CustomTextField olcuBirimiField() => CustomTextField(
        labelText: "Ölçü Birimi",
        enabled: isEnabled,
        controller: olcuBirimiController,
        suffixMore: true,
        readOnly: true,
        onChanged: (value) {},
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
        labelText: "Hurda/Fire Miktarı",
        enabled: isEnabled,
        controller: hurdaFireMiktariController,
        isFormattedString: true,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        onChanged: (value) => viewModel.setHurdaMiktari(value.toDoubleWithFormattedString),
      );

  CustomTextField maliyetFiyatiField() => CustomTextField(
        labelText: "Maliyet Fiyatı",
        enabled: isEnabled,
        controller: maliyetFiyatiController,
        isFormattedString: true,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        onChanged: (value) {},
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
        onChanged: (value) {},
      );

  CustomTextField ekAlan1Field() => CustomTextField(
        labelText: "Ek Alan 1",
        enabled: isEnabled,
        controller: ekAlan1Controller,
        onChanged: (value) {},
      );

  CustomTextField ekAlan2Field() => CustomTextField(
        labelText: "Ek Alan 2",
        enabled: isEnabled,
        controller: ekAlan2Controller,
        onChanged: (value) {},
      );

  Observer ekAlanlarWidget() => Observer(
        builder: (_) => Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Ek Alanlar").paddingOnly(left: UIHelper.lowSize),
            ...List.generate(
              viewModel.ekAlanlarList?.length ?? 0,
              (index) {
                final item = viewModel.ekAlanlarList?[index];
                return CustomTextField(
                  labelText: "${item?.alanAciklama}",
                  enabled: isEnabled,
                  suffixMore: item?.secimListesi?.isNotEmpty,
                  isMust: item?.zorunlu == "E",
                  maxLength: item?.uzunluk,
                );
              },
            ),
          ],
        ).yetkiVarMi(viewModel.ekAlanlarList.ext.isNotNullOrEmpty),
      );
}
