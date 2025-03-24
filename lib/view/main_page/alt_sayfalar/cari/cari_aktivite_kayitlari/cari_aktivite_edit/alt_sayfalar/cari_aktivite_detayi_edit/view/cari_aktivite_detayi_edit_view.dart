import "package:flutter/material.dart";
import "package:flutter_mobx/flutter_mobx.dart";
import "package:get/get.dart";

import "../../../../../../../../../core/base/model/base_edit_model.dart";
import "../../../../../../../../../core/base/model/base_network_mixin.dart";
import "../../../../../../../../../core/base/model/generic_response_model.dart";
import "../../../../../../../../../core/base/state/base_state.dart";
import "../../../../../../../../../core/components/textfield/custom_text_field.dart";
import "../../../../../../../../../core/components/wrap/appbar_title.dart";
import "../../../../../../../../../core/constants/enum/base_edit_enum.dart";
import "../../../../../../../../../core/constants/extensions/date_time_extensions.dart";
import "../../../../../../../../../core/constants/extensions/number_extensions.dart";
import "../../../../model/cari_aktivite_listesi_model.dart";
import "../view_model/cari_aktivite_detayi_view_model.dart";

final class CariAktiviteDetayiEditView extends StatefulWidget {
  const CariAktiviteDetayiEditView({super.key, this.model});
  final BaseEditModel<CariAktiviteListesiModel>? model;

  @override
  State<CariAktiviteDetayiEditView> createState() => CariAktiviteDetayiEditViewState();
}

final class CariAktiviteDetayiEditViewState extends BaseState<CariAktiviteDetayiEditView> {
  CariAktiviteDetayiViewModel viewModel = CariAktiviteDetayiViewModel();
  late final TextEditingController tarihController;
  late final TextEditingController aktiviteTipiController;
  late final TextEditingController bolumController;
  late final TextEditingController ilgiliKisiController;
  late final TextEditingController aciklamaController;
  final GlobalKey<FormState> formKey = GlobalKey();

  @override
  void initState() {
    if (widget.model?.model != null) {
      viewModel.setModel(widget.model!.model!);
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
  Widget build(BuildContext context) => BaseScaffold(
    appBar: AppBar(
      title: const AppBarTitle(title: "Aktivite Detayı"),
      actions: [
        IconButton(
          icon: const Icon(Icons.save_outlined),
          onPressed: () async {
            GenericResponseModel<NetworkManagerMixin>? result;
            if (formKey.currentState?.validate() == true) {
              dialogManager.showAreYouSureDialog(
                onYes: () async {
                  viewModel.model.kayittarihi = DateTime.now();
                  if (widget.model?.baseEditEnum?.duzenleMi == true) {
                    result = await viewModel.getData();
                  }

                  if ((result?.isSuccess ?? false) || (widget.model?.baseEditEnum?.ekleMi == true)) {
                    Get.back(result: viewModel.model..kayittarihi = DateTime.now());
                    dialogManager.showSuccessSnackBar(loc.generalStrings.success);
                  }
                },
              );
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
              valueWidget: Observer(builder: (_) => Text(viewModel.model.aktiviteTipi.toStringIfNotNull ?? "")),
              onTap: () async {
                final result = await bottomSheetDialogManager.showCariAktiviteTipiBottomSheetDialog(
                  context,
                  viewModel.model.aktiviteTipi,
                );
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
                  final result = await bottomSheetDialogManager.showCariAktiviteBolumlerBottomSheetDialog(
                    context,
                    viewModel.model.bolum,
                  );
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
                  final result = await bottomSheetDialogManager.showIlgiliKisilerBottomSheetDialog(
                    context,
                    viewModel.model.ilgiliKisi,
                  );
                  if (result != null) {
                    ilgiliKisiController.text = result.adi ?? "";
                    viewModel.setIlgiliKisi(result.kodu);
                  }
                },
                icon: const Icon(Icons.more_horiz_outlined),
              ),
            ),
            CustomTextField(labelText: "Açıklama", controller: aciklamaController, onChanged: viewModel.setAciklama),
          ],
        ),
      ),
    ),
  );
}
