import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/base/model/base_edit_model.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/base_edit_enum.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_aktivite_kayitlari/cari_aktivite_edit/view_model/cari_aktivite_edit_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_aktivite_kayitlari/model/cari_aktivite_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_listesi_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_listesi/model/cari_request_model.dart";

class CariAktiviteEditView extends StatefulWidget {
  final BaseEditModel<CariAktiviteListesiModel>? model;
  const CariAktiviteEditView({super.key, this.model});

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

  @override
  void initState() {
    if (widget.model?.model != null) {
      viewModel.setModel(widget.model!.model!);
    }
    baslangicTarihiController = TextEditingController();
    saatController = TextEditingController();
    cariController = TextEditingController();
    bolumController = TextEditingController();
    ilgiliKisiController = TextEditingController();
    kullaniciController = TextEditingController();
    aktiviteTipiController = TextEditingController();
    aciklamaController = TextEditingController();
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
            subtitle: widget.model?.baseEditEnum?.name,
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                child: SwitchListTile.adaptive(
                  value: false,
                  onChanged: (value) {},
                  title: const Text("Aktivite Bitirilsin"),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: CustomTextField(
                      labelText: "Başlama Tarihi",
                      controller: baslangicTarihiController,
                      isDateTime: true,
                      readOnly: true,
                    ),
                  ),
                  Expanded(
                    child: CustomTextField(
                      labelText: "Saat",
                      controller: saatController,
                      readOnly: true,
                    ),
                  ),
                ],
              ),
              CustomTextField(
                labelText: "Cari",
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
                labelText: "Bölüm/Departman",
                controller: bolumController,
                maxLength: 100,
                onChanged: viewModel.setBolum,
                suffix: IconButton(
                  onPressed: () async {
                    //TODO
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
                labelText: "Kullanıcı",
                controller: kullaniciController,
                suffixMore: true,
                readOnly: true,
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
                controller: aktiviteTipiController,
                suffixMore: true,
                readOnly: true,
                isMust: true,
                onTap: () async {
                  final result = await bottomSheetDialogManager.showCariAktiviteTipiBottomSheetDialog(context, viewModel.model.aktiviteTipi);
                  if (result != null) {
                    aktiviteTipiController.text = result.aktiviteAdi ?? "";
                    viewModel.setAktiviteTipi(result.aktiviteTipi );
                  }
                },
              ),
              CustomTextField(
                labelText: "Açıklama/Konu",
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
      );
}
