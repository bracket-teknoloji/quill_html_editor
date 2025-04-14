import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";
import "package:picker/core/components/wrap/appbar_title.dart";
import "package:picker/core/constants/enum/edit_tipi_enum.dart";
import "package:picker/core/constants/extensions/date_time_extensions.dart";
import "package:picker/core/constants/extensions/string_extensions.dart";
import "package:picker/core/constants/extensions/widget_extensions.dart";
import "package:picker/core/constants/ui_helper/ui_helper.dart";
import "package:picker/view/main_page/alt_sayfalar/mal_kabul_sevkiyat/faturalastir/view_model/irsaliye_faturalastir_view_model.dart";
import "package:picker/view/main_page/alt_sayfalar/siparis/base_siparis_edit/model/base_siparis_edit_model.dart";

import "../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../core/base/state/base_state.dart";
import "../../../../../../core/components/textfield/custom_text_field.dart";

final class IrsaliyeFaturalastirView extends StatefulWidget {
  const IrsaliyeFaturalastirView({required this.model, super.key});
  final BaseEditModel<BaseSiparisEditModel> model;

  @override
  State<IrsaliyeFaturalastirView> createState() => _IrsaliyeFaturalastirViewState();
}

final class _IrsaliyeFaturalastirViewState extends BaseState<IrsaliyeFaturalastirView> {
  final IrsaliyeFaturalastirViewModel viewModel = IrsaliyeFaturalastirViewModel();
  late final TextEditingController cariController;
  late final TextEditingController irsaliyeNoController;
  late final TextEditingController irsaliyeTarihiController;
  late final TextEditingController faturaTarihiController;
  late final TextEditingController faturaNoController;
  late final TextEditingController resmiFaturaNoController;
  late final TextEditingController istisnaKoduNoController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  BaseSiparisEditModel get model => widget.model.model!;

  @override
  void initState() {
    viewModel.setBasiSiparisEditModel(widget.model.model);
    cariController = TextEditingController(text: model.cariAdi ?? "");
    irsaliyeNoController = TextEditingController(text: model.belgeNo ?? "");
    irsaliyeTarihiController = TextEditingController(text: model.tarih.toDateString);
    faturaTarihiController = TextEditingController(text: DateTime.now().toDateStringIfNull);
    faturaNoController = TextEditingController();
    resmiFaturaNoController = TextEditingController();
    istisnaKoduNoController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await getSiradakiKod();
    });
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
  Widget build(BuildContext context) => BaseScaffold(
    appBar: AppBar(
      title: AppBarTitle(title: "İrsaliye Faturalaştır", subtitle: model.getEditTipiEnum?.getName),
      actions: [
        IconButton(
          onPressed: () {
            if (formKey.currentState?.validate() != true) {
              return;
            }
            dialogManager.showAreYouSureDialog(
              onYes: () async {
                final result = await viewModel.sendFatura();
                if (result.isSuccess) {
                  Get.back(result: true);
                  dialogManager.showSuccessSnackBar(result.message ?? loc.generalStrings.success);
                }
              },
            );
          },
          icon: const Icon(Icons.save_outlined),
        ),
      ],
    ),
    body: SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          children: [
            if (widget.model.model?.eBelgeMi == true)
              const Card(
                child: ListTile(leading: Icon(Icons.info_outlined), title: Text("Cari E-Fatura Mükellefidir.")),
              ),
            CustomTextField(
              labelText: "Cari",
              readOnly: true,
              valueWidget: Observer(builder: (_) => Text(viewModel.model?.cariKodu ?? "")),
              controller: cariController,
            ),
            CustomTextField(labelText: "İrsaliye No", readOnly: true, controller: irsaliyeNoController),
            CustomTextField(labelText: "İrsaliye Tarihi", readOnly: true, controller: irsaliyeTarihiController),
            CustomTextField(
              labelText: "Fatura Tarihi",
              isMust: true,
              readOnly: true,
              isDateTime: true,
              controller: faturaTarihiController,
              onTap: () async {
                final result = await dialogManager.showDateTimePicker(initialDate: viewModel.model?.tarih);
                if (result is DateTime) {
                  viewModel.setFaturaTarihi(result);
                  faturaTarihiController.text = result.toDateString;
                }
              },
            ),
            CustomTextField(
              labelText: "Fatura No",
              isMust: true,
              maxLength: 15,
              controller: faturaNoController,
              suffix: IconButton(
                onPressed: () async => await getSiradakiKod(),
                icon: const Icon(Icons.format_list_numbered_rtl_outlined),
              ),
              onChanged: viewModel.setFaturaNo,
            ),
            CustomTextField(
              labelText: "Resmi Fatura No",
              isMust: true,
              maxLength: 16,
              controller: resmiFaturaNoController,
              onChanged: viewModel.setResmiFaturaNo,
            ),
            CustomTextField(
              labelText: "İstisna Kodu",
              controller: istisnaKoduNoController,
              onTap: () {},
            ).yetkiVarMi(false),
          ],
        ).paddingAll(UIHelper.lowSize),
      ),
    ),
  );
  Future<void> getSiradakiKod() async {
    final result = await viewModel.getSiradakiBelgeNo(widget.model.editTipiEnum!, faturaNoController.text);
    if (result case ("" || null)) {
      return;
    } else {
      faturaNoController.text = result;
      viewModel.setResmiFaturaNo(result.belgeNoToResmiBelgeNo(result, viewModel.model?.tarih));
      resmiFaturaNoController.text = viewModel.requestModel.resmiBelgeNo ?? "";
    }
  }
}
