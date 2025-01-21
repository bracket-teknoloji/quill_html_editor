import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../../../core/base/model/kullanicilar_model.dart";
import "../../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../../../../../../core/constants/ondalik_utils.dart";
import "../../../../../../../../../core/constants/static_variables/singleton_models.dart";
import "../../../../../../../../../core/constants/ui_helper/ui_helper.dart";
import "../../../../../../../../../core/init/cache/cache_manager.dart";
import "../../../../../cari_listesi/model/cari_listesi_model.dart";
import "../../../../../cari_listesi/model/cari_request_model.dart";
import "../../../../model/cari_aktivite_listesi_model.dart";
import "../view_model/cari_aktivite_genel_view_model.dart";

final class CariAktiviteGenelView extends StatefulWidget {
  const CariAktiviteGenelView({required this.model, required this.onSave, super.key});
  final BaseEditModel<CariAktiviteListesiModel> model;
  final Function(GlobalKey<FormState> value) onSave;

  @override
  State<CariAktiviteGenelView> createState() => _CariAktiviteGenelViewState();
}

final class _CariAktiviteGenelViewState extends BaseState<CariAktiviteGenelView> {
  final CariAktiviteGenelViewModel viewModel = CariAktiviteGenelViewModel();
  late final TextEditingController baslangicTarihiController;
  late final TextEditingController saatController;
  late final TextEditingController cariController;
  late final TextEditingController bolumController;
  late final TextEditingController ilgiliKisiController;
  late final TextEditingController kullaniciController;
  late final TextEditingController aktiviteTipiController;
  late final TextEditingController aciklamaController;
  late final TextEditingController sonucAciklamaController;
  late final TextEditingController sureController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool get kayitYetkisi => widget.model.baseEditEnum?.ekleMi == true ? yetkiController.cariAktiviteYeniKayit : yetkiController.cariAktiviteDuzenleme;

  bool get enabled => widget.model.baseEditEnum?.goruntuleMi != true;

  @override
  void initState() {
    viewModel.setBaseEditEnum(widget.model.baseEditEnum);
    if (SingletonModels.cariAktiviteListesi != null) {
      viewModel
        ..setModel(SingletonModels.cariAktiviteListesi!)
        ..setAktiviteBitirilsinMi(viewModel.model.aktiviteBitirilsin == true);
    } else if (widget.model.model != null) {
      viewModel
        ..setModel(widget.model.model!)
        ..setAktiviteBitirilsinMi(viewModel.model.aktiviteBitirilsin == true);
    }
    if (widget.model.baseEditEnum?.ekleMi == true) {
      viewModel.setBaslangicTarihi(DateTime.now());
    }
    baslangicTarihiController = TextEditingController(text: viewModel.model.bastar?.toDateString);
    saatController = TextEditingController(text: viewModel.model.bastar?.getTime);
    cariController = TextEditingController(text: viewModel.model.cariAdi);
    bolumController = TextEditingController(text: viewModel.model.bolum);
    ilgiliKisiController = TextEditingController(text: viewModel.model.ilgiliKisi);
    kullaniciController = TextEditingController(text: viewModel.model.kullaniciTitle ?? viewModel.model.kullaniciAdi);
    aktiviteTipiController = TextEditingController(text: viewModel.model.aktiviteAdi ?? viewModel.model.aktiviteTipi.toStringIfNotNull);
    aciklamaController = TextEditingController(text: viewModel.model.aciklama);
    sonucAciklamaController = TextEditingController(text: viewModel.model.sonucAciklama);
    sureController = TextEditingController(text: viewModel.model.sure.commaSeparatedWithDecimalDigits(OndalikEnum.oran));
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      widget.onSave(formKey);
      if (widget.model.baseEditEnum.ekleMi && viewModel.model.kullaniciTitle == null) {
        kullaniciController.text = CacheManager.getAnaVeri?.userModel?.adiSoyadi ?? "";
        viewModel.setKullanici(KullanicilarModel(adi: kullaniciController.text, kodu: CacheManager.getAnaVeri?.userModel?.kuladi));
      }
      if (widget.model.baseEditEnum?.ekleMi == true && viewModel.model.aktiviteTipi == null && !yetkiController.cariAktiviteDetayliMi) {
        await getAktiviteTipi();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    baslangicTarihiController.dispose();
    saatController.dispose();
    cariController.dispose();
    bolumController.dispose();
    ilgiliKisiController.dispose();
    kullaniciController.dispose();
    aktiviteTipiController.dispose();
    aciklamaController.dispose();
    SingletonModels.setCariAktiviteListesi = viewModel.model;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: "Başlama Tarihi",
                      enabled: widget.model.baseEditEnum.ekleMi,
                      controller: baslangicTarihiController,
                      isDateTime: true,
                      readOnly: true,
                      onTap: () async {
                        final result = await dialogManager.showDateTimePicker(initialDate: viewModel.model.bastar);
                        if (result != null) {
                          baslangicTarihiController.text = result.toDateString;
                          viewModel.setBaslangicTarihi(result);
                        }
                      },
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      labelText: "Saat",
                      enabled: widget.model.baseEditEnum.ekleMi,
                      controller: saatController,
                      readOnly: true,
                      isDateTime: true,
                      onTap: () async {
                        final result = await dialogManager.showSaatPicker();
                        if (result != null) {
                          saatController.text = result.toTimeString;
                          viewModel.setSaat(DateTime(0, 0, 0, result.hour, result.minute));
                        }
                      },
                    ),
                  ),
                ],
              ),
              CustomTextField(
                labelText: "Cari",
                enabled: enabled,
                controller: cariController,
                readOnly: true,
                isMust: true,
                suffixMore: true,
                valueWidget: Observer(builder: (_) => Text(viewModel.model.cariKodu ?? "")),
                onTap: () async {
                  final result = await Get.toNamed("mainPage/cariListesiOzel");
                  if (result is CariListesiModel) {
                    cariController.text = result.cariAdi ?? "";
                    viewModel.setCari(result);
                  }
                },
                suffix: IconButton(
                  onPressed: () async {
                    if (viewModel.model.cariKodu == null) {
                      dialogManager.showErrorSnackBar("Cari Seçiniz.");
                      return;
                    }
                    dialogManager.showCariIslemleriGridViewDialog(await networkManager.getCariModel(CariRequestModel(kod: [viewModel.model.cariKodu ?? ""])));
                  },
                  icon: const Icon(Icons.open_in_new_outlined, color: UIHelper.primaryColor),
                ),
              ),
              CustomTextField(
                labelText: "Kullanıcı",
                controller: kullaniciController,
                suffixMore: true,
                readOnly: true,
                enabled: yetkiController.cariAktiviteAtayabilir && enabled,
                valueWidget: Observer(builder: (_) => Text(viewModel.model.kullaniciAdi ?? "")),
                onClear: () => viewModel.setKullanici(null),
                onTap: () async {
                  final result = await bottomSheetDialogManager.showKullanicilarBottomSheetDialog(context, viewModel.model.kullaniciAdi);
                  if (result != null) {
                    kullaniciController.text = result.adi ?? "";
                    viewModel.setKullanici(result);
                  }
                },
              ),
              if (!yetkiController.cariAktiviteDetayliMi)
                CustomTextField(
                  labelText: "Aktivite Tipi",
                  enabled: enabled,
                  controller: aktiviteTipiController,
                  suffixMore: true,
                  readOnly: true,
                  isMust: true,
                  valueWidget: Observer(builder: (_) => Text(viewModel.model.aktiviteTipi.toStringIfNotNull ?? "")),
                  onTap: getAktiviteTipi,
                ),
              if (!yetkiController.cariAktiviteDetayliMi)
                CustomTextField(
                  labelText: "Bölüm/Departman",
                  enabled: enabled,
                  controller: bolumController,
                  maxLength: 100,
                  onChanged: viewModel.setBolum,
                  suffix: IconButton(
                    onPressed: () async {
                      final result = await bottomSheetDialogManager.showCariAktiviteBolumlerBottomSheetDialog(context, viewModel.model.bolum);
                      if (result != null) {
                        bolumController.text = result.adi ?? "";
                        viewModel.setBolum(result.adi);
                      }
                    },
                    icon: const Icon(Icons.more_horiz_outlined),
                  ),
                ),
              if (!yetkiController.cariAktiviteDetayliMi)
                CustomTextField(
                  labelText: "İlgili Kişi",
                  enabled: enabled,
                  controller: ilgiliKisiController,
                  maxLength: 100,
                  onChanged: viewModel.setIlgiliKisi,
                  suffix: IconButton(
                    onPressed: () async {
                      final result = await bottomSheetDialogManager.showIlgiliKisilerBottomSheetDialog(context, viewModel.model.ilgiliKisi);
                      if (result != null) {
                        ilgiliKisiController.text = result.adi ?? "";
                        viewModel.setIlgiliKisi(result.adi);
                      }
                    },
                    icon: const Icon(Icons.more_horiz_outlined),
                  ),
                ),
              CustomTextField(
                labelText: "Açıklama/Konu",
                enabled: enabled,
                controller: aciklamaController,
                maxLength: 500,
                onChanged: viewModel.setAciklama,
                suffix: IconButton(
                  onPressed: () async {
                    final result = await bottomSheetDialogManager.showCariAktiviteAciklamalarBottomSheetDialog(context, viewModel.model.aciklama);
                    if (result != null) {
                      aciklamaController.text = result.adi ?? "";
                      viewModel.setAciklama(result.adi);
                    }
                  },
                  icon: const Icon(Icons.more_horiz_outlined),
                ),
              ),
              if (widget.model.baseEditEnum.ekleMi)
                Card(
                  child: Observer(
                    builder: (_) => SwitchListTile.adaptive(
                      value: viewModel.aktiviteBitirilsinMi,
                      onChanged: viewModel.setAktiviteBitirilsinMi,
                      title: const Text("Aktivite Bitirilsin"),
                    ),
                  ),
                ),
              Observer(
                builder: (_) => viewModel.aktiviteBitirilsinMi && !yetkiController.cariAktiviteDetayliMi
                    ? CustomTextField(
                        labelText: "Sonuç Açıklaması",
                        isMust: true,
                        controller: sonucAciklamaController,
                        onChanged: viewModel.setSonucAciklama,
                        suffix: IconButton(
                          onPressed: () async {
                            final result = await bottomSheetDialogManager.showCariAktiviteSonucAciklamalarBottomSheetDialog(context, viewModel.model.sonucAciklama);
                            if (result != null) {
                              sonucAciklamaController.text = result.adi ?? "";
                              viewModel.setAciklama(result.adi);
                            }
                          },
                          icon: const Icon(Icons.more_horiz_outlined),
                        ),
                      )
                    : const SizedBox.shrink(),
              ),
              Observer(
                builder: (_) => viewModel.aktiviteBitirilsinMi && !yetkiController.cariAktiviteDetayliMi
                    ? CustomTextField(
                        labelText: "Süre (Saat)",
                        controller: sureController,
                        isFormattedString: true,
                        isMust: true,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        onChanged: (value) => viewModel.setSure(value.toDoubleWithFormattedString),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ).paddingAll(UIHelper.lowSize),
        ),
      );

  Future<void> getAktiviteTipi() async {
    final result = await bottomSheetDialogManager.showCariAktiviteTipiBottomSheetDialog(context, viewModel.model.aktiviteTipi);
    if (result != null) {
      aktiviteTipiController.text = result.aktiviteAdi ?? "";
      viewModel.setAktiviteTipi(result);
    }
  }
}
