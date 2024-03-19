import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:picker/core/base/state/base_state.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_aktivite_kayitlari/cari_aktivite_edit/alt_sayfalar/cari_aktivite_detayi_edit/view_model/cari_aktivite_detayi_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/cari/cari_aktivite_kayitlari/model/cari_aktivite_listesi_model.dart";

class CariAktiviteDetayiEditView extends StatefulWidget {
  final CariAktiviteListesiModel? model;
  const CariAktiviteDetayiEditView({super.key, this.model});

  @override
  State<CariAktiviteDetayiEditView> createState() => CariAktiviteDetayiEditViewState();
}

class CariAktiviteDetayiEditViewState extends BaseState<CariAktiviteDetayiEditView> {
  CariAktiviteDetayiViewModel viewModel = CariAktiviteDetayiViewModel();
  late final TextEditingController tarihController;
  late final TextEditingController aktiviteTipiController;
  late final TextEditingController bolumController;
  late final TextEditingController ilgiliKisiController;
  late final TextEditingController aciklamaController;
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    if (widget.model != null) {
      viewModel.setModel(widget.model!);
    } else {
      viewModel.setTarih(DateTime.now());
    }
    tarihController = TextEditingController(text: viewModel.model.tarih.toDateString);
    aktiviteTipiController = TextEditingController(text: viewModel.model.aktiviteAdi);
    bolumController = TextEditingController(text: viewModel.model.bolum);
    ilgiliKisiController = TextEditingController(text: viewModel.model.ilgiliKisi);
    aciklamaController = TextEditingController(text: viewModel.model.aciklama);
    super.initState();
  }

  @override
  void dispose() {
    tarihController.dispose();
    aktiviteTipiController.dispose();
    bolumController.dispose();
    ilgiliKisiController.dispose();
    aciklamaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("Aktivite Detayı"),
          actions: [
            IconButton(
              icon: const Icon(Icons.save_outlined),
              onPressed: () async {
                if (formKey.currentState?.validate() == true) {
                  Get.back(result: viewModel.model..kayittarihi = DateTime.now());
                  dialogManager.showSuccessSnackBar(loc.generalStrings.success);
                }
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextField(
                  labelText: "Tarih",
                  isDateTime: true,
                  isMust: true,
                  readOnly: true,
                  controller: tarihController,
                  onTap: () async {
                    final result = await dialogManager.showDateTimePicker();
                    if (result != null) {
                      tarihController.text = result.toDateString;
                      viewModel.setTarih(result);
                    }
                  },
                ),
                CustomTextField(
                  labelText: "Aktivite Tipi",
                  isMust: true,
                  readOnly: true,
                  suffixMore: true,
                  controller: aktiviteTipiController,
                  onTap: () async {
                    final result = await bottomSheetDialogManager.showCariAktiviteTipiBottomSheetDialog(context, true);
                    if (result != null) {
                      aktiviteTipiController.text = result.aktiviteAdi ?? "";
                      viewModel.setAktiviteTipi(result);
                    }
                  },
                ),
                CustomTextField(
                  labelText: "Bölüm/Departman",
                  controller: bolumController,
                  onChanged: viewModel.setBolum,
                  suffix: IconButton(
                    onPressed: () async {
                      final result = await bottomSheetDialogManager.showCariAktiviteBolumlerBottomSheetDialog(context, viewModel.model.bolum);
                      if (result != null) {
                        bolumController.text = result.adi ?? "";
                        viewModel.setBolum(result.kodu);
                      }
                    },
                    icon: const Icon(Icons.more_horiz_outlined),
                  ),
                ),
                CustomTextField(
                  labelText: "İlgili Kişi",
                  controller: ilgiliKisiController,
                  onChanged: viewModel.setIlgiliKisi,
                  suffix: IconButton(
                    onPressed: () async {
                      final result = await bottomSheetDialogManager.showIlgiliKisilerBottomSheetDialog(context, viewModel.model.ilgiliKisi);
                      if (result != null) {
                        ilgiliKisiController.text = result.adi ?? "";
                        viewModel.setIlgiliKisi(result.kodu);
                      }
                    },
                    icon: const Icon(Icons.more_horiz_outlined),
                  ),
                ),
                CustomTextField(
                  labelText: "Açıklama",
                  controller: aciklamaController,
                  onChanged: viewModel.setAciklama,
                ),
              ],
            ),
          ),
        ),
      );
}
