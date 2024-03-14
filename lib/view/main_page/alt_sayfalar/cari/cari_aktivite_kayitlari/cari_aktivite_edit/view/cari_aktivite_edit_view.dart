import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/number_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/core/init/cache/cache_manager.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_aktivite_kayitlari/cari_aktivite_edit/view_model/cari_aktivite_edit_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_aktivite_kayitlari/model/cari_aktivite_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_request_model.dart";

class CariAktiviteEditView extends StatefulWidget {
  final BaseEditModel<CariAktiviteListesiModel> model;
  const CariAktiviteEditView({super.key, required this.model});

  @override
  State<CariAktiviteEditView> createState() => _CariAktiviteEditViewState();
}

class _CariAktiviteEditViewState extends BaseState<CariAktiviteEditView> {
  final CariAktiviteEditViewModel viewModel = CariAktiviteEditViewModel();
  late final TextEditingController baslangicTarihiController;
  late final TextEditingController saatController;
  late final TextEditingController cariController;
  late final TextEditingController bolumController;
  late final TextEditingController ilgiliKisiController;
  late final TextEditingController kullaniciController;
  late final TextEditingController aktiviteTipiController;
  late final TextEditingController aciklamaController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  CariAktiviteListesiModel get cariAktiviteModel => widget.model.model!;

  bool get kayitYetkisi => widget.model.baseEditEnum?.ekleMi == true ? yetkiController.cariAktiviteYeniKayit : yetkiController.cariAktiviteDuzenleme;

  bool get enabled => widget.model.baseEditEnum?.goruntuleMi != true;

  @override
  void initState() {
    viewModel.setBaseEditEnum(widget.model.baseEditEnum);
    if (widget.model.model != null) {
      viewModel.setModel(widget.model.model!);
    }
    if (widget.model.baseEditEnum?.ekleMi == true) {
      viewModel.setBaslangicTarihi(DateTime.now());
    }
    baslangicTarihiController = TextEditingController(text: viewModel.model.bastar?.toDateString);
    saatController = TextEditingController(text: viewModel.model.bastar?.getTime);
    cariController = TextEditingController(text: cariAktiviteModel.cariAdi);
    bolumController = TextEditingController(text: cariAktiviteModel.bolum);
    ilgiliKisiController = TextEditingController(text: cariAktiviteModel.ilgiliKisi);
    kullaniciController = TextEditingController(text: cariAktiviteModel.kullaniciAdi);
    aktiviteTipiController = TextEditingController(text: cariAktiviteModel.aktiviteAdi);
    aciklamaController = TextEditingController(text: cariAktiviteModel.aciklama);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (widget.model.baseEditEnum.ekleMi && !yetkiController.cariAktiviteAtayabilir) {
        kullaniciController.text = CacheManager.getAnaVeri!.userModel?.kuladi ?? "";
        viewModel.setKullanici(kullaniciController.text);
      }
      if (widget.model.baseEditEnum?.ekleMi == true) {
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "Cari Aktivite",
            subtitle: widget.model.baseEditEnum?.name,
          ),
          actions: [
            IconButton(
              onPressed: () async {
                if (formKey.currentState?.validate() == true) {
                  final result = await viewModel.saveCariAktivite();
                  if (result.success == true) {
                    dialogManager.showSuccessSnackBar(result.message ?? loc.generalStrings.success);
                    Get.back(result: true);
                  }
                }
              },
              icon: const Icon(Icons.save_outlined),
            ).yetkiVarMi(kayitYetkisi && widget.model.baseEditEnum != BaseEditEnum.goruntule),
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Card(
                  child: Observer(
                    builder: (_) => SwitchListTile.adaptive(
                      value: viewModel.aktiviteBitirilsinMi,
                      onChanged: viewModel.setAktiviteBitirilsinMi,
                      title: const Text("Aktivite Bitirilsin"),
                    ),
                  ),
                ).yetkiVarMi(widget.model.baseEditEnum.ekleMi),
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
                      viewModel.setCari(result.cariKodu);
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
                    icon: Icon(Icons.open_in_new_outlined, color: theme.colorScheme.inversePrimary),
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
                      viewModel.setKullanici(result.kodu);
                    }
                  },
                ),
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
              ],
            ).paddingAll(UIHelper.lowSize),
          ),
        ),
      );

  Future<void> getAktiviteTipi() async {
    final result = await bottomSheetDialogManager.showCariAktiviteTipiBottomSheetDialog(context, viewModel.model.aktiviteTipi);
    if (result != null) {
      aktiviteTipiController.text = result.aktiviteAdi ?? "";
      viewModel.setAktiviteTipi(result.aktiviteTipi);
    }
  }
}
