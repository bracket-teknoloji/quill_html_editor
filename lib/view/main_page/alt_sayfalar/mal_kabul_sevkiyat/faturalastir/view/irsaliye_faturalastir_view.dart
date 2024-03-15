import "package:flutter/material.dart";
import "package:picker/core/components/textfield/custom_text_field.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/view/main_page/alt_sayfalar/mal_kabul_sevkiyat/faturalastir/view_model/irsaliye_faturalastir_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

class IrsaliyeFaturalastirView extends StatefulWidget {
  final BaseSiparisEditModel model;
  const IrsaliyeFaturalastirView({super.key, required this.model});

  @override
  State<IrsaliyeFaturalastirView> createState() => _IrsaliyeFaturalastirViewState();
}

class _IrsaliyeFaturalastirViewState extends State<IrsaliyeFaturalastirView> {
  final IrsaliyeFaturalastirViewModel viewModel = IrsaliyeFaturalastirViewModel();
  late final TextEditingController cariController;
  late final TextEditingController irsaliyeNoController;
  late final TextEditingController irsaliyeTarihiController;
  late final TextEditingController faturaTarihiController;
  late final TextEditingController faturaNoController;
  late final TextEditingController resmiFaturaNoController;
  late final TextEditingController istisnaKoduNoController;

  BaseSiparisEditModel get model => BaseSiparisEditModel.instance;

  @override
  void initState() {
    // viewModel.set
    cariController = TextEditingController(text: model.cariAdi ?? "");
    irsaliyeNoController = TextEditingController(text: model.belgeNo ?? "");
    irsaliyeTarihiController = TextEditingController(text: model.belgeNo ?? "");
    faturaTarihiController = TextEditingController(text: model.tarih.toDateString);
    faturaNoController = TextEditingController(text: model.belgeNo ?? "");
    resmiFaturaNoController = TextEditingController(text: model.belgeNo ?? "");
    istisnaKoduNoController = TextEditingController(text: model.belgeNo ?? "");
    super.initState();
  }

  @override
  void dispose() {
    cariController.dispose();
    irsaliyeNoController.dispose();
    irsaliyeTarihiController.dispose();
    faturaTarihiController.dispose();
    faturaNoController.dispose();
    resmiFaturaNoController.dispose();
    istisnaKoduNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: AppBarTitle(
            title: "İrsaliye Faturalaştır",
            subtitle: model.getEditTipiEnum?.getName,
          ),
          // title: const Text("İrsaliye Faturalaştır"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextField(
                labelText: "Cari",
                controller: cariController,
              ),
              CustomTextField(
                labelText: "İrsaliye No",
                controller: irsaliyeNoController,
              ),
              CustomTextField(
                labelText: "İrsaliye Tarihi",
                controller: irsaliyeTarihiController,
              ),
              CustomTextField(
                labelText: "Fatura Tarihi",
                isMust: true,
                controller: faturaTarihiController,
                onTap: () {},
              ),
              CustomTextField(
                labelText: "Fatura No",
                isMust: true,
                maxLength: 15,
                controller: faturaNoController,
                onTap: () {},
              ),
              CustomTextField(
                labelText: "Resmi Fatura No",
                isMust: true,
                maxLength: 16,
                controller: resmiFaturaNoController,
                onTap: () {},
              ),
              CustomTextField(
                labelText: "İstisna Kodu",
                controller: istisnaKoduNoController,
                onTap: () {},
              ),
            ],
          ),
        ),
      );
}
